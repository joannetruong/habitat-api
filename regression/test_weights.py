from __future__ import print_function

import argparse
import glob
import os

import numpy as np
import quaternion
import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
from scipy.spatial.transform import Rotation as R
from sklearn import preprocessing
from sklearn.metrics import mean_squared_error
from torch.autograd import Variable
from torch.utils.data import DataLoader, TensorDataset
from typing import List, Tuple, Union
from regression_models.regression import regress_1layer, regress_2layer, regress_3layer, regress_4layer

# [conda activate proj2]
np.set_printoptions(precision=3, suppress=True)
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

def get_offset(pred, action):
    offset = np.zeros_like(pred)
    if action == 'f':
        trans_amt = 0.25
        offset = np.zeros_like(pred)
        offset[:, 0] = pred[:, 0]
        offset[:, 1] = np.subtract(np.abs(pred[:, 1]), trans_amt)
        offset[:, 2] = pred[:, 2]
    else:
        if action == 'l':
            rot_amt = np.deg2rad(30)
        elif action == 'r':
            rot_amt = -np.deg2rad(30)
        offset[:, 0] = pred[:, 0]
        offset[:, 1] = pred[:, 1]
        offset[:, 2] = np.subtract(pred[:, 2], rot_amt)
    return offset

def weighted_mse_loss(pred, target):
    # weights_arr = [3 / 8, 3 / 8, 1 / 8, 1 / 8]
    weights_arr = [2/5, 2/5, 1/5]
    #weights_arr = [1/3, 1/3, 1/3]
    weights = Variable(torch.Tensor(weights_arr).cuda())
    pred_angle = torch.atan2(pred[:, 3], pred[:, 2])
    target_angle = torch.atan2(target[:, 3], target[:, 2])
    angle_diff = ((((pred_angle - target_angle)+ np.pi) % (2*np.pi) - np.pi)**2).view(-1,1)
    xy_diff = (pred[:, :2] - target[:, :2])**2
    diff = torch.cat((xy_diff, angle_diff), 1)
    out = diff * weights.expand_as(diff)
    loss = torch.mean(out)
    #pred_tmp = torch.cat((pred[:, :2], pred_angle.view(-1, 1)),1)
    #target_tmp = torch.cat((target[:, :2], target_angle.view(-1, 1)), 1)
    #print('pred_tmp: ', pred_tmp)
    #print('target_tmp: ', target_tmp)
    return loss

def quaternion_to_list(q: np.quaternion):
    return q.imag.tolist() + [q.real]

def quaternion_from_coeffs(coeffs: np.ndarray) -> np.quaternion:
    r"""Creates a quaternions from coeffs in [x, y, z, w] format
    """
    quat = np.quaternion(0, 0, 0, 0)
    quat.real = coeffs[3]
    quat.imag = coeffs[0:3]
    return quat

def quaternion_rotate_vector(quat: np.quaternion, v: np.array) -> np.array:
    r"""Rotates a vector by a quaternion
    Args:
        quaternion: The quaternion to rotate by
        v: The vector to rotate
    Returns:
        np.array: The rotated vector
    """
    vq = np.quaternion(0, 0, 0, 0)
    vq.imag = v
    return (quat * vq * quat.inverse()).imag


def agent_state_target2ref(ref_rot, delta) -> List:
    r"""Computes the target agent_state's position and rotation representation
    with respect to the coordinate system defined by reference agent's position and rotation.
    All rotations must be in [x, y, z, w] format.
    :param ref_agent_state: reference agent_state in the format of [position, rotation].
         The position and roation are from a common/global coordinate systems.
         They define a local coordinate system.
    :param target_agent_state: target agent_state in the format of [position, rotation].
        The position and roation are from a common/global coordinate systems.
        and need to be transformed to the local coordinate system defined by ref_agent_state.
    """
    delta_x = delta[0]
    delta_y = delta[1]
    delta_t = delta[2]

    ref_rotation = R.from_rotvec([0, 0, ref_rot]).as_quat()
    target_rotation = R.from_rotvec([0, 0, ref_rot + delta_t]).as_quat()

    # convert to all rotation representations to np.quaternion
    if not isinstance(ref_rotation, np.quaternion):
        ref_rotation = quaternion_from_coeffs(ref_rotation)
    ref_rotation = ref_rotation.normalized()

    if not isinstance(target_rotation, np.quaternion):
        target_rotation = quaternion_from_coeffs(target_rotation)
    target_rotation = target_rotation.normalized()

    position_in_ref_coordinate = quaternion_rotate_vector(
        ref_rotation.inverse(), np.array([delta_x, delta_y, 0])
    )

    rotation_in_ref_coordinate = quaternion_to_list(
        ref_rotation.inverse() * target_rotation
    )

    r = R.from_quat(rotation_in_ref_coordinate)
    out_t = r.as_rotvec()[2]
    return [position_in_ref_coordinate[0], position_in_ref_coordinate[1], out_t]

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--ckpt-dir", type=str, required=True)
    parser.add_argument("--data-dir", type=str, required=True)
    args = parser.parse_args()
    args.cuda = torch.cuda.is_available()
    args.batch_size = 1
    kwargs = {"num_workers": 1, "pin_memory": True} if args.cuda else {}
    device = (
        torch.device("cuda:{}".format(0))
        if torch.cuda.is_available()
        else torch.device("cpu")
    )
    filename_model = []
    filename_model_mse = []
    print('HERE!')
    for filename in glob.iglob(args.ckpt_dir + "**/*.pt", recursive=True):
        print(filename)
        filename_model.append(filename)
        ## parse file name
        model_name = filename.split("/")[-1]
        output_type = model_name.split("_")[0]
        action_space = model_name.split("_")[1]
        num_layers = model_name.split("_")[2]
        embed_type = model_name.split("_")[3]
        preprocess_type = model_name.split("_")[4]
        print(preprocess_type)

        if num_layers == '3layer':
            model = regress_3layer(7,4)
        elif num_layers == '4layer':
            model = regress_4layer(7,4)
        elif num_layers == '2layer':
            model = regress_2layer(7,4)
        elif num_layers == '1layer':
            model = regress_1layer(7,4)
        model.to(device)
        checkpoint = torch.load(filename, map_location=device)
        model.load_state_dict(checkpoint)
        #model = torch.load(filename, map_location=device)
        model.eval()

        datapath = os.path.join(args.data_dir, output_type)
        in_tensor_train, in_tensor_test, in_tensor_val = preprocess_input_data(
            datapath, action_space, embed_type, preprocess=preprocess_type
        )
        label_tensor_train, label_tensor_test, label_tensor_val = preprocess_output_data(
            datapath, action_space
        )  

        dataset_train = TensorDataset(in_tensor_train, label_tensor_train)
        dataset_test = TensorDataset(in_tensor_test, label_tensor_test)
        dataset_val = TensorDataset(in_tensor_val, label_tensor_val)

        # Create a data loader from the dataset
        # Type of sampling and batch size are specified at this step
        train_loader = torch.utils.data.DataLoader(dataset_train,
                         batch_size=args.batch_size, shuffle=False, **kwargs)
        val_loader = torch.utils.data.DataLoader(dataset_val,
                         batch_size=args.batch_size, shuffle=False, **kwargs)
        test_loader = torch.utils.data.DataLoader(dataset_test,
                         batch_size=args.batch_size, shuffle=False, **kwargs)
        

        ### predict with test set
        all_data = []
        all_target = []
        all_output = []
        all_wmse = []
        F_error = []
        L_error = []
        R_error = []

        with torch.no_grad():
            for batch_idx, batch in enumerate(test_loader):
                inputs, targets = Variable(batch[0]), Variable(batch[1])
                if args.cuda:
                    model.cuda()
                    inputs, targets = inputs.cuda(), targets.cuda()
                output = model(inputs)
                wmse = weighted_mse_loss(output, targets).data.cpu().detach().numpy().tolist()
                output = output.cpu().detach().numpy().tolist()
                input1 = inputs.cpu().detach().numpy().tolist()
                target = targets.cpu().detach().numpy().tolist()
                for i in range(inputs.shape[0]):
                    all_data.append(input1[i])
                    all_target.append(target[i])
                    all_output.append(output[i])
                all_wmse.append(wmse)
        all_data_xyt = convert_angles(np.array(all_data), ang_type='rad')
        all_target_xyt = convert_angles(np.array(all_target), ang_type='rad')
        all_output_xyt = convert_angles(np.array(all_output).reshape(-1, 4), ang_type='rad')

        all_local_xyt = []
        for idx, i in enumerate(all_data_xyt):
            all_local_xyt.append(agent_state_target2ref(i[2], all_output_xyt[idx]))

#        print('input')
#        print(all_data_xyt[:10, :])
#        print('target')
#        print(all_target_xyt[:10, :])
#        print('pred')
#        print(all_output_xyt[:10, :])
#        print('error')
#        print(np.subtract(all_output_xyt, all_target_xyt)[:10, :])
        #print('wmse')
        #print(np.mean(np.array(all_wmse)))

        f_data_xyt = []
        l_data_xyt = []
        r_data_xyt = []
        f_output_xyt = []
        f_target_xyt = []
        l_output_xyt = []
        l_target_xyt = []
        r_output_xyt = []
        r_target_xyt = []
        f_local_xyt = []
        l_local_xyt = []
        r_local_xyt = []

        for idx, i in enumerate(all_data_xyt):
            if all(i[3:] == [0, 0, 1]): #f
                f_data_xyt.append(i)
                f_output_xyt.append(all_output_xyt[idx])
                f_local_xyt.append(all_local_xyt[idx])
                f_target_xyt.append(all_target_xyt[idx])
            elif all(i[3:] == [0, 1, 0]): #l
                l_data_xyt.append(i)
                l_output_xyt.append(all_output_xyt[idx])
                l_local_xyt.append(all_local_xyt[idx])
                l_target_xyt.append(all_target_xyt[idx])
            elif all(i[3:] == [1, 0, 0]): #r
                r_data_xyt.append(i)
                r_output_xyt.append(all_output_xyt[idx])
                r_local_xyt.append(all_local_xyt[idx])
                r_target_xyt.append(all_target_xyt[idx])

        F_error = np.subtract(np.array(f_output_xyt), np.array(f_target_xyt))
        L_error = np.subtract(np.array(l_output_xyt), np.array(l_target_xyt))
        R_error = np.subtract(np.array(r_output_xyt), np.array(r_target_xyt))
        all_error = np.subtract(all_output_xyt, all_target_xyt)
        
        F_offset = get_offset(np.array(f_local_xyt), 'f')
        L_offset = get_offset(np.array(l_local_xyt), 'l')
        R_offset = get_offset(np.array(r_local_xyt), 'r')
        LR_offset = np.array([0, 0, 0])
        LR_offset = np.vstack((LR_offset, L_offset))
        LR_offset = np.vstack((LR_offset, R_offset))
        #print('f_output: ', f_output_xyt) 
        #print('f_offset: ', F_offset) 

        f_data_xyt = np.hstack((f_data_xyt, f_target_xyt))
        f_data_xyt = np.hstack((f_data_xyt, f_output_xyt))
        f_data_xyt = np.hstack((f_data_xyt, F_error))

        l_data_xyt = np.hstack((l_data_xyt, l_target_xyt))
        l_data_xyt = np.hstack((l_data_xyt, l_output_xyt))
        l_data_xyt = np.hstack((l_data_xyt, L_error))

        r_data_xyt = np.hstack((r_data_xyt, r_target_xyt))
        r_data_xyt = np.hstack((r_data_xyt, r_output_xyt))
        r_data_xyt = np.hstack((r_data_xyt, R_error))

        all_data_xyt = np.hstack((all_data_xyt, all_target_xyt))
        all_data_xyt = np.hstack((all_data_xyt, all_output_xyt))
        all_data_xyt = np.hstack((all_data_xyt, all_error))

        #np.savetxt(os.path.join('weights_output', 'f_data.csv'),  f_data_xyt[:, :], delimiter=",")
        #np.savetxt(os.path.join('weights_output', 'l_data.csv'),  l_data_xyt[:, :], delimiter=",")
        #np.savetxt(os.path.join('weights_output', 'r_data.csv'),  r_data_xyt[:, :], delimiter=",")
        #np.savetxt(os.path.join('weights_output', 'all_data.csv'),  all_data_xyt[:, :], delimiter=",")

        #print('Mean F_error: ')
        #print(np.mean(F_error, axis=0))
        #print('Std F_error: ')
        #print(np.std(F_error, axis=0))
        #print('Mean L_error: ')
        #print(np.mean(L_error, axis=0))
        #print('Std L_error: ')
        #print(np.std(L_error, axis=0))
        #print('Mean R_error: ')
        #print(np.mean(R_error, axis=0))
        #print('Std R_error: ')
        #print(np.std(R_error, axis=0))
        #print('')
        print('Mean F_offset: ')
        print(np.mean(F_offset, axis=0))
        print('Std F_offset: ')
        print(np.std(F_offset, axis=0))
        print('Mean LR_offset: ')
        print(np.mean(LR_offset, axis=0))
        print('Std LR_offset: ')
        print(np.std(LR_offset, axis=0))
