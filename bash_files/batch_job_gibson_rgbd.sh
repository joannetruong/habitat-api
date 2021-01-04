#!/bin/bash

MODEL_PATH="data/checkpoints/rgbd_0.15/ddppo_gibson_noise_0.15_rect_rgbd_v2/ckpt.25.8.316093982897936.pth"
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_t_0.15_25_gibson_all_noise.txt
