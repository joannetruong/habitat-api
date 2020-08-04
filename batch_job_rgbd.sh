#!/bin/bash

NOISE_TYPE="gaussian_proportional"

MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_v2_rgbd_v3/ckpt.30.8.027109176569303.pth"
./batch_evalsim_lab_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15/pi_ft_30/pi_ft_0.15_30_no_noise.txt
./batch_evalsim_lab_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15/pi_ft_30/pi_ft_0.15_30_sensor_noise.txt
./batch_evalsim_lab_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15/pi_ft_30/pi_ft_0.15_30_actuation_noise.txt
./batch_evalsim_lab_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15/pi_ft_30/pi_ft_0.15_30_all_noise.txt