from __future__ import print_function

import argparse
import datetime
import os

import numpy as np
import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
import torchvision
from sklearn import preprocessing
from torch import Tensor
from torch.autograd import Variable
from torch.utils.data import DataLoader, TensorDataset
from torch.utils.tensorboard import SummaryWriter
from torchvision import datasets, transforms

# [conda activate sim2real]
parser = argparse.ArgumentParser(description="Regression Test1")

# Hyperparameters
# parser.add_argument('--output-type', type=str,
#                     help='delta or pose', default='delta')
parser.add_argument("--action-space", type=str, help="LR or LRF", default="LRF")
parser.add_argument("--preprocess", type=str, help="stand or norm", default="stand")
parser.add_argument('--lr', type=float, metavar='LR', help='learning rate', default=0.001)
parser.add_argument("--traj-dir", type=str, help="datapath containing trajectories")
parser.add_argument("--weighted", action="store_true")
parser.add_argument(
    "--epochs", type=int, metavar="N", help="number of epochs to train", default=10
)
parser.add_argument(
    "--batch-size", type=int, metavar="N", help="batch_size", default=4
)
parser.add_argument(
    "--seed", type=int, default=1, metavar="S", help="random seed (default: 1)"
)

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
        x = x.view(1, len(x), self.input_dim)
        h0, c0 = self.init_hidden(x)
        out, (hn, cn) = self.lstm(x, (h0, c0))
        out = self.linear(out[:, -1, :])
        return out

args = parser.parse_args()
torch.manual_seed(args.seed)
args.cuda = torch.cuda.is_available()
if args.cuda:
    torch.cuda.manual_seed(args.seed)

torch.cuda.set_device(0)

kwargs = {"num_workers": 1, "pin_memory": True} if args.cuda else {}

print("LENGTH: {}".format(len(args.action_space)))
embedding = nn.Embedding(len(args.action_space), 16)


def pad_array(in_arr, out_shape, val):
    tmp = np.full((1, out_shape.shape[1]), val)
    tmp[0][0] = in_arr[0]
    tmp[0][1] = in_arr[1]
    return tmp

def process_data(train, test, val, embed_type, preprocess):
    processed_train = train.copy()
    processed_test = test.copy()
    processed_val = val.copy()

    if preprocess == 'stand':
        # xy_scaler = preprocessing.StandardScaler().fit(train[:, :2])
        x_scaler = preprocessing.StandardScaler().fit(train[:, 0].reshape(-1, 1))
        y_scaler = preprocessing.StandardScaler().fit(train[:, 1].reshape(-1, 1))
    elif preprocess == 'norm':
        # xy_scaler = preprocessing.MaxAbsScaler().fit(train[:, :2])
        x_scaler = preprocessing.MaxAbsScaler().fit(train[:, 0].reshape(-1, 1))
        y_scaler = preprocessing.MaxAbsScaler().fit(train[:, 1].reshape(-1, 1))

    # processed_train[:, :2] = xy_scaler.transform(train[:, :2])
    # processed_test[:, :2] = xy_scaler.transform(test[:, :2])
    # processed_val[:, :2] = xy_scaler.transform(val[:, :2])

    processed_train[:, 0] = x_scaler.transform(train[:, 0].reshape(-1, 1))[:, 0]
    processed_train[:, 1] = y_scaler.transform(train[:, 1].reshape(-1, 1))[:, 0]
    processed_test[:, 0] = x_scaler.transform(test[:, 0].reshape(-1, 1))[:, 0]
    processed_test[:, 1] = y_scaler.transform(test[:, 1].reshape(-1, 1))[:, 0]
    processed_val[:, 0] = x_scaler.transform(val[:, 0].reshape(-1, 1))[:, 0]
    processed_val[:, 1] = y_scaler.transform(val[:, 1].reshape(-1, 1))[:, 0]

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


def weighted_mse_loss(pred, target):
    # weights_arr = [3 / 8, 3 / 8, 1 / 8, 1 / 8]
    weights_arr = [2/5, 2/5, 1/5]
    #weights_arr = [1/3, 1/3, 1/3]
    weights = Variable(torch.Tensor(weights_arr).cuda())
    pred_angle = torch.atan2(pred[:, 3], pred[:, 2])
    target_angle = torch.atan2(target[:, 3], target[:, 2])
    angle_diff = (torch.abs(((pred_angle - target_angle)+ np.pi) % (2*np.pi) - np.pi)).view(-1,1)
    xy_diff = torch.abs(pred[:, :2] - target[:, :2] )
    diff = torch.cat((xy_diff, angle_diff), 1)
    out = diff * weights.expand_as(diff)
    loss = torch.mean(out)
    #pred_tmp = torch.cat((pred[:, :2], pred_angle.view(-1, 1)),1)
    #target_tmp = torch.cat((target[:, :2], target_angle.view(-1, 1)), 1)
    #print('pred_tmp: ', pred_tmp)
    #print('target_tmp: ', target_tmp)
    return loss

def create_dir(dir_path):
    if not os.path.exists(dir_path):
        os.makedirs(dir_path)
    return

def evaluate(model, split, n_batches=None):
    model.eval()
    loss = 0
    correct = 0
    n_examples = 0
    diff = 0
    if split == 'val':
        loader = val_loader
    elif split == 'test':
        loader = test_loader
    with torch.no_grad():
        for batch_i, batch in enumerate(loader):
            data, target = batch
            if args.cuda:
                data, target = data.cuda(), target.cuda()
            data, target = Variable(data), Variable(target)
            output = model(data)
            # loss += criterion(output, target).data
            if args.weighted:
                loss += weighted_mse_loss(output, target).data
            else:
                loss += criterion(output, target).data
            diff += (target - output).mean()
            if n_batches and (batch_i >= n_batches):
                break

    val_loss = loss / len(loader.dataset)
    val_diff = diff / len(loader.dataset)
    return val_loss, val_diff

def get_optimizer(model, opt_type, lr, wd, m=0.9):
    if opt_type == "Adam":
        return optim.Adam(model.parameters(), lr=lr, weight_decay=wd)
    elif opt_type == "SGD":
        return optim.SGD(model.parameters(), lr=lr, momentum=m, weight_decay=wd)
    return None

def train_regressor():
    name = (
        "LSTM_oneHot_" + args.preprocess + "_Adam_lr_1e-2_wd_0"
        + weight
    )
    pth = output_type + "_" + action_space
    model_name = pth + "_" + name
    writer = SummaryWriter(os.path.join(tb_dir, model_name))
    # print('run ' + str(o_idx) + '/' + str(total_runs))
    j = 0
    for epoch in range(1, args.epochs + 1):
        for batch_idx, batch in enumerate(train_loader):
            model.train()
            inputs, targets = Variable(batch[0]), Variable(batch[1])
            if args.cuda:
                model.cuda()
                inputs, targets = inputs.cuda(), targets.cuda()
            optimizer.zero_grad()
            outputs = model(inputs)
            if weight != "":
                loss = weighted_mse_loss(outputs, targets)
            else:
                loss = criterion(outputs, targets)
            # MSE_loss = nn.MSELoss()(outputs, inputs)
            # ===================backward====================
            loss.backward()
            optimizer.step()
            # ===================log========================
            if batch_idx % 10 == 0:
                val_loss, val_diff = evaluate(model, 'val', n_batches=4)
                train_loss = loss.data
                examples_this_epoch = batch_idx * len(inputs)
                epoch_progress = 100. * batch_idx / len(train_loader)
                writer.add_scalar("Train/MSE_Loss", train_loss, j)
                writer.add_scalar("Test/MSE_Loss", val_loss, j)

                j += 1

                torch.save(
                    model, os.path.join(ckpt_dir, model_name + ".pt")
                )

                print(
                    "Train_Epoch: {} [{}/{} ({:.0f}%)]\t"
                    "Train_loss:{:.6f}, Val_loss:{:.6f}".format(
                        epoch,
                        examples_this_epoch,
                        len(train_loader.dataset),
                        epoch_progress,
                        loss.data,
                        val_loss,
                    )
                )

action_space = args.action_space
weight = ""
if args.weighted:
    weight = "_weighted"
# output_type = args.output_type
output_type = 'delta'
date = datetime.datetime.now().strftime("%Y-%m-%d")
date_time = datetime.datetime.now().strftime("%Y-%m-%d_%H-%M")

datapath = os.path.join(args.traj_dir, output_type)
# standardized input
in_tensor_train, in_tensor_test, in_tensor_test = preprocess_input_data(
    datapath, action_space, "oneHot", preprocess=args.preprocess
)
label_tensor_train, label_tensor_test, label_tensor_val = preprocess_output_data(
    datapath, action_space
)  # embed type doesn't matter here

dataset_train = TensorDataset(in_tensor_train, label_tensor_train)
dataset_test = TensorDataset(in_tensor_test, label_tensor_test)
dataset_val = TensorDataset(in_tensor_test, label_tensor_val)

# Create a data loader from the dataset
# Type of sampling and batch size are specified at this step
train_loader = torch.utils.data.DataLoader(dataset_train,
                 batch_size=args.batch_size, shuffle=True, **kwargs)
val_loader = torch.utils.data.DataLoader(dataset_test,
                 batch_size=args.batch_size, shuffle=True, **kwargs)
test_loader = torch.utils.data.DataLoader(dataset_val,
                 batch_size=args.batch_size, shuffle=True, **kwargs)

in_size = in_tensor_train.shape[1]
out_size = label_tensor_train.shape[1]
hidden_dim = 128
layer_dim = 2
model = LSTM(in_size, hidden_dim, layer_dim, out_size)
optimizer = optim.Adam(model.parameters(), lr=args.lr, weight_decay=0)


criterion = nn.MSELoss()

pth_end = date_time + "_" + action_space + '_LSTM'

if weight != "":
    pth_end = date_time + "_" + action_space + weight + '_LSTM'

tb_dir = os.path.join(os.getcwd(), 'tensorboard', date, pth_end)
create_dir(tb_dir)

ckpt_dir = os.path.join(os.getcwd(), 'checkpoints', date, pth_end)
create_dir(ckpt_dir)

train_regressor()
