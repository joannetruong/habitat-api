import os
from glob import glob

import cv2
import numpy as np
import torch

from aug import get_normalize

from models.networks import define_G

bad_keys = ["model.1.weight", "model.1.bias", "model.4.weight", "model.4.bias", "model.7.weight", "model.7.bias", "model.10.conv_block.1.weight", "model.10.conv_block.1.bias", "model.10.conv_block.5.weight", "model.10.conv_block.5.bias", "model.11.conv_block.1.weight", "model.11.conv_block.1.bias", "model.11.conv_block.5.weight", "model.11.conv_block.5.bias", "model.12.conv_block.1.weight", "model.12.conv_block.1.bias", "model.12.conv_block.5.weight", "model.12.conv_block.5.bias", "model.13.conv_block.1.weight", "model.13.conv_block.1.bias", "model.13.conv_block.5.weight", "model.13.conv_block.5.bias", "model.14.conv_block.1.weight", "model.14.conv_block.1.bias", "model.14.conv_block.5.weight", "model.14.conv_block.5.bias", "model.15.conv_block.1.weight", "model.15.conv_block.1.bias", "model.15.conv_block.5.weight", "model.15.conv_block.5.bias", "model.16.conv_block.1.weight", "model.16.conv_block.1.bias", "model.16.conv_block.5.weight", "model.16.conv_block.5.bias", "model.17.conv_block.1.weight", "model.17.conv_block.1.bias", "model.17.conv_block.5.weight", "model.17.conv_block.5.bias", "model.18.conv_block.1.weight", "model.18.conv_block.1.bias", "model.18.conv_block.5.weight", "model.18.conv_block.5.bias", "model.19.weight", "model.19.bias", "model.22.weight", "model.22.bias", "model.26.weight", "model.26.bias"]

class Predictor:
    def __init__(self, weights_path):
        model = define_G(4, 4, 64, 'resnet_9blocks', 'instance', False, 'normal', 0.02, [0])
        state_dict = torch.load(weights_path)
        state_dict2 = state_dict.copy()
        for i in state_dict.keys():
            if i in bad_keys:
                state_dict2['module.'+i] = state_dict2.pop(i)
        model.load_state_dict(state_dict2)
        model.eval()
        self.model = model.cuda()
        self.model.train(True)
        self.normalize_fn = get_normalize()

    @staticmethod
    def _array_to_batch(x):
        x = np.transpose(x, (2, 0, 1))
        x = np.expand_dims(x, 0)
        return torch.from_numpy(x)

    def _preprocess(self, x):
        x, _ = self.normalize_fn(x, x)
        mask = np.ones_like(x, dtype=np.float32)

        h, w, _ = x.shape
        block_size = 32
        min_height = (h // block_size + 1) * block_size
        min_width = (w // block_size + 1) * block_size

        pad_params = {'mode': 'constant',
                      'constant_values': 0,
                      'pad_width': ((0, min_height - h), (0, min_width - w), (0, 0))
                      }
        x = np.pad(x, **pad_params)
        mask = np.pad(mask, **pad_params)

        return map(self._array_to_batch, (x, mask)), h, w

    @staticmethod
    def _postprocess(x):
        x, = x
        x = x.detach().cpu().float().numpy()
        x = (np.transpose(x, (1, 2, 0)) + 1) / 2.0 * 255.0
        return x.astype('uint8')

    def __call__(self, img):
        #img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        (img, mask), h, w = self._preprocess(img)
#        img = torch.from_numpy(img)
        with torch.no_grad():
            inputs = [img.cuda()]
            pred = self.model(*inputs)
        pred = self._postprocess(pred)[:h, :w, :]
        #pred = cv2.cvtColor(pred, cv2.COLOR_BGR2RGB)
        return pred
