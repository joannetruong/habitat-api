#!/bin/bash

NOISE_TYPE="poisson_ilqr"
MODEL_PATH="data/checkpoints/rgbd_0.15/ddppo_gibson_no_noise_0.15_rect_rgbd_v2/ckpt.25.8.468102965864578.pth"
#./evalsim_gibson_no_noise_rgbd.sh ${MODEL_PATH} | tee results/rgbd_no_noise_data_gibson.txt
./batch_evalsim_lab_noisy_rgbd_gen.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/data_collection/poisson_ilqr_lab_v10.txt
