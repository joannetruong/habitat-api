#!/bin/bash

#NOISE_TYPE="poisson_ilqr"
#NOISE_TYPE="gaussian_proportional"
NOISE_TYPE="speckle_mb"

MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_rgbd_speckle_mb/ckpt.50.8.219345516813311.pth"
./batch_evalsim_coda_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_t_0.15_50/pi_t_0.15_50_no_noise.txt
./batch_evalsim_coda_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_t_0.15_50/pi_t_0.15_50_sensor_noise.txt
./batch_evalsim_coda_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_t_0.15_50/pi_t_0.15_50_actuation_noise.txt
./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_t_0.15_50/pi_t_0.15_50_all_noise.txt
