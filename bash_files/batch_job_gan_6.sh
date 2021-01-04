#!/bin/bash

NOISE_TYPE="gaussian_proportional"
MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_100_v2_act/ckpt.25.6.38173284419508.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_100/175_net_G_A.pth"
./batch_evalsim_coda_no_noise_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_100_100_175/pi_r_0.15_25_100_100_no_noise.txt
./batch_evalsim_coda_sensors_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_100_100_175/pi_r_0.15_25_100_100_sensor_noise.txt
./batch_evalsim_coda_actuation_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_100_100_175/pi_r_0.15_25_100_100_actuation_noise.txt
./batch_evalsim_coda_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_100_100_175/pi_r_0.15_25_100_100_all_noise.txt
