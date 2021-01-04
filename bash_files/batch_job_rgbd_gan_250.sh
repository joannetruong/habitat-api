#!/bin/bash

NOISE_TYPE="gaussian_proportional"
MODEL_PATH="data/checkpoints/rgbd_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_250_v2_rgbd_act/ckpt.25.7.6800717793728746.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/20_net_G_A.pth"
./batch_evalsim_coda_no_noise_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_250_250_20/pi_r_0.15_25_250_250_gan_no_noise_20.txt 
./batch_evalsim_coda_sensors_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_250_250_20/pi_r_0.15_25_250_250_gan_sensor_noise_20.txt 
./batch_evalsim_coda_actuation_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_250_250_20/pi_r_0.15_25_250_250_gan_actuation_noise_20.txt 
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_250_250_20/pi_r_0.15_25_250_250_gan_all_noise_20.txt
