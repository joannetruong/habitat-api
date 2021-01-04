#!/bin/bash

NOISE_TYPE="gaussian_proportional"
MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_1k_v2_act/ckpt.25.8.413448509485095.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_1k/10_net_G_A.pth"
./batch_evalsim_coda_no_noise_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_1k_1k_10/pi_r_0.15_25_1k_1k_no_noise.txt
./batch_evalsim_coda_sensors_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_1k_1k_10/pi_r_0.15_25_1k_1k_sensor_noise.txt
./batch_evalsim_coda_actuation_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_1k_1k_10/pi_r_0.15_25_1k_1k_actuation_noise.txt
./batch_evalsim_coda_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_1k_1k_10/pi_r_0.15_25_1k_1k_all_noise.txt
