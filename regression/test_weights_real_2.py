from __future__ import print_function

import argparse
import glob
import os

import numpy as np
import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
from sklearn import preprocessing
from sklearn.metrics import mean_squared_error
from torch.autograd import Variable

# [conda activate proj2]
np.set_printoptions(precision=3, suppress=True)
class LSTM(nn.Module):

    def __init__(self, input_dim, hidden_dim, layer_dim, output_dim,
                    num_layers=2):
        super(LSTM, self).__init__()
        self.input_dim = input_dim
        self.hidden_dim = hidden_dim
        self.layer_dim = layer_dim
        self.num_layers = num_layers
        self.output_dim = output_dim
        self.batch_size = None
        self.hidden = None

        # Define the LSTM layer
        self.lstm = nn.LSTM(self.input_dim, self.hidden_dim, self.layer_dim)

        # Define the output layer
        self.linear = nn.Linear(self.hidden_dim, self.output_dim)

        # self.hidden_cell = (torch.zeros(1,1,self.hidden_dim),
        #                     torch.zeros(1,1,self.hidden_dim))

    def init_hidden(self, x):
        h0 = torch.zeros(self.layer_dim, x.size(1), self.hidden_dim)
        c0 = torch.zeros(self.layer_dim, x.size(1), self.hidden_dim)
        return [t.cuda() for t in (h0, c0)]

    def forward(self, x):
        x = x.view(1, 1, self.input_dim)
        h0, c0 = self.init_hidden(x)
        out, (hn, cn) = self.lstm(x, (h0, c0))
        out = self.linear(out[:, -1, :])
        return out

class regress_1layer(nn.Module):
    def __init__(self, in_size, out_size):
        super(regress_1layer, self).__init__()
        self.regressor = nn.Sequential(
            nn.Linear(in_size, out_size)
        )

    def forward(self, x):
        out = self.regressor(x)
        return out

class regress_2layer(nn.Module):
    def __init__(self, in_size, out_size):
        super(regress_2layer, self).__init__()
        self.regressor = nn.Sequential(
            nn.Linear(in_size, 32), nn.ReLU(True), nn.Linear(32, out_size)
        )

    def forward(self, x):
        out = self.regressor(x)
        return out


class regress_3layer(nn.Module):
    def __init__(self, in_size, out_size):
        super(regress_3layer, self).__init__()
        self.regressor = nn.Sequential(
            nn.Linear(in_size, 32),
            nn.ReLU(True),
            nn.Linear(32, 16),
            nn.ReLU(True),
            nn.Linear(16, out_size),
        )

    def forward(self, x):
        out = self.regressor(x)
        return out


class regress_4layer(nn.Module):
    def __init__(self, in_size, out_size):
        super(regress_4layer, self).__init__()
        self.regressor = nn.Sequential(
            nn.Linear(in_size, 32),
            nn.ReLU(True),
            nn.Linear(32, 16),
            nn.ReLU(True),
            nn.Linear(16, 8),
            nn.ReLU(True),
            nn.Linear(8, out_size),
        )

    def forward(self, x):
        out = self.regressor(x)
        return out

embedding = nn.Embedding(3, 16)


def process_data(train, test, val, embed_type, preprocess):
    multi = False
    processed_train = train.copy()
    processed_test = test.copy()
    processed_val = val.copy()

    if preprocess == 'stand':
        if multi:
            xy_scaler = preprocessing.StandardScaler().fit(train[:, :2])
        else:
            x_scaler = preprocessing.StandardScaler().fit(train[:, 0].reshape(-1, 1))
            y_scaler = preprocessing.StandardScaler().fit(train[:, 1].reshape(-1, 1))
            # ct_scaler = preprocessing.StandardScaler().fit(train[:, 2].reshape(-1, 1))
            # st_scaler = preprocessing.StandardScaler().fit(train[:, 3].reshape(-1, 1))
    elif preprocess == 'norm':
        if multi:
            xy_scaler = preprocessing.MaxAbsScaler().fit(train[:, :2])
        else:
            x_scaler = preprocessing.MaxAbsScaler().fit(train[:, 0].reshape(-1, 1))
            y_scaler = preprocessing.MaxAbsScaler().fit(train[:, 1].reshape(-1, 1))
            # ct_scaler = preprocessing.MaxAbsScaler().fit(train[:, 2].reshape(-1, 1))
            # st_scaler = preprocessing.MaxAbsScaler().fit(train[:, 3].reshape(-1, 1))

    if multi:
        processed_train[:, :2] = xy_scaler.transform(train[:, :2])
        processed_test[:, :2] = xy_scaler.transform(test[:, :2])
        processed_val[:, :2] = xy_scaler.transform(val[:, :2])
    else:
        processed_train[:, 0] = x_scaler.transform(train[:, 0].reshape(-1, 1))[:, 0]
        processed_train[:, 1] = y_scaler.transform(train[:, 1].reshape(-1, 1))[:, 0]
        # processed_train[:, 2] = ct_scaler.transform(train[:, 2].reshape(-1, 1))[:, 0]
        # processed_train[:, 3] = st_scaler.transform(train[:, 3].reshape(-1, 1))[:, 0]
        processed_test[:, 0] = x_scaler.transform(test[:, 0].reshape(-1, 1))[:, 0]
        processed_test[:, 1] = y_scaler.transform(test[:, 1].reshape(-1, 1))[:, 0]
        # processed_test[:, 2] = ct_scaler.transform(test[:, 2].reshape(-1, 1))[:, 0]
        # processed_test[:, 3] = st_scaler.transform(test[:, 3].reshape(-1, 1))[:, 0]
        processed_val[:, 0] = x_scaler.transform(val[:, 0].reshape(-1, 1))[:, 0]
        processed_val[:, 1] = y_scaler.transform(val[:, 1].reshape(-1, 1))[:, 0]
        # processed_val[:, 2] = ct_scaler.transform(val[:, 2].reshape(-1, 1))[:, 0]
        # processed_val[:, 3] = st_scaler.transform(val[:, 3].reshape(-1, 1))[:, 0]

    if embed_type == "embed":
        # add embedding: x, y, cost, sint, embed_action
        offset = 4 - len(action_space)
        p_train = np.hstack(
            (
                processed_train[:, :-1],
                embedding(torch.LongTensor(processed_train[:, -1] - offset))
                .detach()
                .numpy(),
            )
        )
        p_test = np.hstack(
            (
                processed_test[:, :-1],
                embedding(torch.LongTensor(processed_test[:, -1] - offset))
                .detach()
                .numpy(),
            )
        )
        p_val = np.hstack(
            (
                processed_val[:, :-1],
                embedding(torch.LongTensor(processed_val[:, -1] - offset))
                .detach()
                .numpy(),
            )
        )
        processed_train = p_train
        processed_test = p_test
        processed_val = p_val

    return numpy_to_torch(processed_train, processed_test, processed_val)


def numpy_to_torch(train, test, val):
    tensor_train = torch.from_numpy(train).float()
    tensor_test = torch.from_numpy(test).float()
    tensor_val = torch.from_numpy(val).float()
    return tensor_train, tensor_test, tensor_val


def np_load_data(datapath, action_space, data_type, embed_type=""):
    if embed_type != "":
        embed_type += "_"
    train_path = os.path.join(
        datapath,
        action_space,
        data_type + "_" + action_space + "_" + embed_type + "train.npy",
    )
    test_path = os.path.join(
        datapath,
        action_space,
        data_type + "_" + action_space + "_" + embed_type + "test.npy",
    )
    val_path = os.path.join(
        datapath,
        action_space,
        data_type + "_" + action_space + "_" + embed_type + "val.npy",
    )
    np_train = np.load(train_path, allow_pickle=True)
    np_test = np.load(test_path, allow_pickle=True)
    np_val = np.load(val_path, allow_pickle=True)
    return np_train, np_test, np_val


def preprocess_input_data(datapath, action_space, embed_type, preprocess):
    # input is x, y, cost, sint, action
    # action may be a number (to be embedded), or a one hot encoding of the action
    in_train, in_test, in_val = np_load_data(datapath, action_space, "input", embed_type)
    in_tensor_train, in_tensor_test, in_tensor_val = process_data(
        in_train, in_test, in_val, embed_type, preprocess
    )
    return in_tensor_train, in_tensor_test, in_tensor_val


def preprocess_output_data(datapath, action_space):
    label_train, label_test, label_val = np_load_data(datapath, action_space, "labels")
    label_tensor_train, label_tensor_test, label_tensor_val = numpy_to_torch(label_train, label_test, label_val)
    return label_tensor_train, label_tensor_test, label_tensor_val


def convert_angles(arr, ang_type='deg'):
    if arr != []:
        r, c = arr.shape
        arr_xyt = np.zeros((r, c - 1))
        arr_xyt[:, :2] = arr[:, :2]
        if ang_type == 'deg':
            arr_xyt[:, 2] = np.degrees(np.arctan2(arr[:, 3], arr[:, 2]))
        elif ang_type == 'rad':
            arr_xyt[:, 2] = np.arctan2(arr[:, 3], arr[:, 2])
        if c > 4:
            arr_xyt[:, 3:] = arr[:, 4:]
        return arr_xyt
    return arr

def get_error(label, pred):
    error = np.subtract(pred, label)
    if error != []:
        r, c = error.shape
        error_t = np.zeros((r, c - 1))
        error_t[:, :2] = error[:, :2]
        error_t[:, 2] = np.subtract(convert_angles(pred, 'rad')[:, 2], convert_angles(label, 'rad')[:, 2])
        error_xyt = error_t.copy()
        error_xyt[:, 2] = np.degrees(error_xyt[:, 2])
        return error_t, error_xyt
    return None, None

def get_mean_offset(pred, action):
    if action == 'rot':
        rot_amt = np.deg2rad(30)
        trans_amt = 0.0
    elif action == 'linear':
        rot_amt = 0.0
        trans_amt = 0.25
    r, c = pred.shape
    offset = np.zeros((r, c - 1))
    abs_pred = np.abs(pred)
    offset[:, :2] = np.subtract(abs_pred[:, :2], trans_amt) * np.sign(pred[:, :2])
    offset[:, 2] = np.subtract(convert_angles(abs_pred, 'rad')[:, 2], rot_amt) * np.sign(pred[:, 2])
    offset = np.mean(offset, axis=0)
    offset_xyt = offset.copy()
    offset_xyt[2] = np.degrees(offset[2])
    return offset, offset_xyt

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--ckpt-dir", type=str, required=True)
    parser.add_argument("--data-dir", type=str, required=True)
    args = parser.parse_args()
    args.cuda = torch.cuda.is_available()
    device = (
        torch.device("cuda:{}".format(0))
        if torch.cuda.is_available()
        else torch.device("cpu")
    )
    filename_model = []
    filename_model_mse = []
    for filename in glob.iglob(args.ckpt_dir + "**/*.pt", recursive=True):
        print(filename)
        filename_model.append(filename)
        checkpoint = torch.load(filename, map_location=device)
        model.load_state_dict(checkpoint)
        model.eval()

        ## parse file name
        model_name = filename.split("/")[-1]
        output_type = model_name.split("_")[0]
        action_space = model_name.split("_")[1]
        num_layers = model_name.split("_")[2]
        embed_type = model_name.split("_")[3]
        preprocess_type = model_name.split("_")[4]
        print(preprocess_type)

        datapath = os.path.join(args.data_dir, output_type)
        in_tensor_train, in_tensor_test, in_tensor_val = preprocess_input_data(
            datapath, action_space, embed_type, preprocess=preprocess_type
        )
        label_tensor_train, label_tensor_test, label_tensor_val = preprocess_output_data(
            datapath, action_space
        )  

        in_train, in_test, in_val = np_load_data(datapath, action_space, "input", embed_type)
        label_train, label_test, label_val = np_load_data(datapath, action_space, "labels")

        ## convert label to x, y, t (take arctan sin/ cos)
        label_test_xyt = convert_angles(label_test)
        label_train_xyt = convert_angles(label_train)
        # label_test_xyt = np.zeros((label_test.shape[0], 3))
        # label_test_xyt[:, :2] = label_test[:, :2]
        # label_test_xyt[:, 2] = np.degrees(np.divide(label_test[:, 3], label_test[:, 2]))

        ### predict with test set
        outputs = []
        outputs_L = []
        outputs_R = []
        outputs_LR = []
        outputs_F = []
        label_L = []
        label_R = []
        label_LR = []
        label_F = []
        with torch.no_grad():
            for idx, i in enumerate(in_tensor_test):
                data = in_tensor_test[idx, :]
                target = label_tensor_test[idx, :]
                data, target = Variable(data), Variable(target)
                if args.cuda:
                    data, target = data.cuda(), target.cuda()
                output = model(data).cpu().detach()
                print(output)
                outputs.append(output.numpy().tolist())
                action = in_test[idx][4:]
                if len(action) == 1:
                    if action == [1]: #forward
                        outputs_F.append(output.numpy().tolist())
                        label_F.append(label_test[idx].tolist())
                    elif action == [2]: # left
                        outputs_L.append(output.numpy().tolist())
                        label_L.append(label_test[idx].tolist())
                        outputs_LR.append(output.numpy().tolist())
                        label_LR.append(label_test[idx].tolist())
                    elif action == [3]:  # right
                        outputs_R.append(output.numpy().tolist())
                        label_R.append(label_test[idx].tolist())
                        outputs_LR.append(output.numpy().tolist())
                        label_LR.append(label_test[idx].tolist())
                elif len(action) == 2:
                    if all(action == [0, 1]): #left
                        outputs_L.append(output.numpy().tolist())
                        label_L.append(label_test[idx].tolist())
                        outputs_LR.append(output.numpy().tolist())
                        label_LR.append(label_test[idx].tolist())
                    elif all(action == [1, 0]): # right
                        outputs_R.append(output.numpy().tolist())
                        label_R.append(label_test[idx].tolist())
                        outputs_LR.append(output.numpy().tolist())
                        label_LR.append(label_test[idx].tolist())
                elif len(action) == 3:
                    if all(action == [0, 1, 0]): #left
                        outputs_L.append(output.numpy().tolist())
                        label_L.append(label_test[idx].tolist())
                        outputs_LR.append(output.numpy().tolist())
                        label_LR.append(label_test[idx].tolist())
                    elif all(action == [1, 0, 0]): # right
                        outputs_R.append(output.numpy().tolist())
                        label_R.append(label_test[idx].tolist())
                        outputs_LR.append(output.numpy().tolist())
                        label_LR.append(label_test[idx].tolist())
                    elif all(action == [0, 0, 1]):  #forward
                        outputs_F.append(output.numpy().tolist())
                        label_F.append(label_test[idx].tolist())
        outputs = np.array(outputs)
        outputs_L = np.array(outputs_L)
        outputs_R = np.array(outputs_R)
        outputs_LR = np.array(outputs_LR)
        outputs_F = np.array(outputs_F)
        label_L = np.array(label_L)
        label_R = np.array(label_R)
        label_LR = np.array(label_LR)
        label_F = np.array(label_F)
        # outputs = np.add(outputs, mean_labels)

        outputs_xyt = convert_angles(outputs)
        outputs_L_xyt = convert_angles(outputs_L)
        outputs_R_xyt = convert_angles(outputs_R)
        outputs_LR_xyt = convert_angles(outputs_LR)
        outputs_F_xyt = convert_angles(outputs_F)
        labels_L_xyt = convert_angles(label_L)
        labels_R_xyt = convert_angles(label_R)
        labels_LR_xyt = convert_angles(label_LR)
        labels_F_xyt = convert_angles(label_F)
        in_test_xyt = convert_angles(in_test)

        error, error_xyt = get_error(label_test, outputs)
        error_L, error_xyt_L = get_error(label_L, outputs_L)
        error_R, error_xyt_R = get_error(label_R, outputs_R)
        error_F, error_xyt_F = get_error(label_F, outputs_F)
        error_LR, error_xyt_LR = get_error(label_LR, outputs_LR)
        mean_error_xyt = np.mean(np.abs(error_xyt), axis=0)
        mean_error_xyt_L = np.mean(np.abs(error_xyt_L), axis=0)
        mean_error_xyt_R = np.mean(np.abs(error_xyt_R), axis=0)
        mean_error_xyt_LR = np.mean(np.abs(error_xyt_LR), axis=0)
        mean_error_xyt_F = np.mean(np.abs(error_xyt_F), axis=0)

        mean_error = np.mean(np.abs(error), axis=0)
        mean_error_L = np.mean(np.abs(error_L), axis=0)
        mean_error_R = np.mean(np.abs(error_R), axis=0)
        mean_error_LR = np.mean(np.abs(error_LR), axis=0)
        mean_error_F = np.mean(np.abs(error_F), axis=0)

        # # FORWARD
        # mean_offset_F, mean_offset_F_XYT = get_mean_offset(outputs_F, 'linear')
        # # LEFT
        # mean_offset_L, mean_offset_L_XYT = get_mean_offset(outputs_L, 'rot')
        # # RIGHT 
        # mean_offset_R, mean_offset_R_XYT = get_mean_offset(outputs_R, 'rot')
        # # LEFT AND RIGHT 
        # mean_offset_LR, mean_offset_LR_XYT = get_mean_offset(outputs_LR, 'rot')

        # FORWARD
        mean_offset_F, mean_offset_F_XYT = get_mean_offset(label_F, 'linear')
        # LEFT
        mean_offset_L, mean_offset_L_XYT = get_mean_offset(label_L, 'rot')
        # RIGHT 
        mean_offset_R, mean_offset_R_XYT = get_mean_offset(label_R, 'rot')
        # LEFT AND RIGHT 
        mean_offset_LR, mean_offset_LR_XYT = get_mean_offset(label_LR, 'rot')

        # print("X MIN, MAX: ")
        # print(np.min(label_train[:,0]), np.max(label_train[:, 0]), np.std(label_train[:, 0]))
        # print("Y MIN, MAX: ")
        # print(np.min(label_train[:, 1]), np.max(label_train[:, 1]), np.std(label_train[:, 0]))
        # print("COST MIN, MAX: ")
        # print(np.min(label_train[:, 2]), np.max(label_train[:, 2]), np.std(label_train[:, 0]))
        # print("SINT MIN, MAX: ")
        # print(np.min(label_train[:, 3]), np.max(label_train[:, 3]), np.std(label_train[:, 0]))
        # print("THETA MIN, MAX: ")
        # print(np.min(label_train_xyt[:, 3]), np.max(label_train_xyt[:, 3]), np.std(label_train_xyt[:, 0]))

        # print("INPUT: ")
        # print(in_test[7:10])
        # print("LABEL: ")
        # print(label_test[7:10])
        # print("PRED: ")
        # print(outputs[7:10])
        # print("ERROR: ")
        # print(error[7:10])
        # print("Mean ERROR: ")
        # print(mean_error)
        # print("Mean ERROR L: ")
        # print(mean_error_L)
        # print("Mean ERROR R: ")
        # print(mean_error_R)
        # # print("Mean ERROR LR: ")
        # # print(mean_error_LR)
        # print("Mean ERROR F: ")
        # print(mean_error_F)
        # print("OFFSET ERROR L: ")
        # print(mean_offset_L)
        # print("OFFSET ERROR R: ")
        # print(mean_offset_R)
        # print("OFFSET ERROR LR: ")
        # print(mean_offset_LR)
        # print("OFFSET ERROR F: ")
        # print(mean_offset_F)

        print("INPUT XYT: ")
        print(in_test_xyt[:10])
        print("LABEL XYT: ")
        print(label_test_xyt[:10])
        print("PRED XYT: ")
        print(outputs_xyt[:10])
        print("ERROR XYT: ")
        print(error_xyt[:10])
        # print("Mean ERROR XYT: ")
        # print(mean_error_xyt)
        # print("Mean ERROR L: ")
        # print(mean_error_xyt_L)
        # print("Mean ERROR R: ")
        # print(mean_error_xyt_R)
        # # print("Mean ERROR LR: ")
        # # print(mean_error_xyt_LR)
        # print("Mean ERROR F: ")
        # print(mean_error_xyt_F)
        # # print("OFFSET ERROR L XYT: ")
        # # print(mean_offset_L_XYT)
        # # print("OFFSET ERROR R XYT: ")
        # # print(mean_offset_R_XYT)
        # print("OFFSET ERROR LR XYT: ")
        # print(mean_offset_LR_XYT)
        # print("OFFSET ERROR F XYT: ")
        # print(mean_offset_F_XYT)

        MSE = mean_squared_error(outputs, label_test)
        avg_mse = np.mean(MSE)

        filename_model_mse.append(avg_mse)

    print([x for y, x in sorted(zip(filename_model_mse, filename_model))])
    print([y for y, x in sorted(zip(filename_model_mse, filename_model))])
