import torch
import torch.nn as nn

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
