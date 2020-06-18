import torch
import torch.nn as nn


class BidirectionalLSTM(nn.Module):

    def __init__(self, input_size, hidden_size, output_size):
        super(BidirectionalLSTM, self).__init__()
        self.rnn = nn.LSTM(input_size, hidden_size, bidirectional=True, batch_first=True)
        self.linear = nn.Linear(hidden_size * 2, output_size)

    def forward(self, input):
        """
        input : visual feature [batch_size x T x input_size]
        output : contextual feature [batch_size x T x output_size]
        """
        self.rnn.flatten_parameters()
        recurrent, _ = self.rnn(input)  # batch_size x T x input_size -> batch_size x T x (2*hidden_size)
        output = self.linear(recurrent)  # batch_size x T x output_size
        return output

class SelfAttention(nn.Module):

    def __init__(self, input_size, hidden_size, output_size):
        super(SelfAttention, self).__init__()
        self.fc = nn.Linear(input_size, hidden_size)

    def forward(self, input):
        x = self.fc(input)
        attn = torch.softmax(torch.matmul(x, x.transpose(1, 2)), 2)
        output = torch.matmul(attn, input)
        return output

