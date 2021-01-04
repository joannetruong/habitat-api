#!/bin/bash

NOISE_TYPE="gaussian_proportional"
MODEL_PATH="data/checkpoints/rgbd_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_100_v2_rgbd_act/ckpt.25.6.005681818181818.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_100/130_net_G_A.pth"
./batch_evalsim_coda_no_noise_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_100_100_130/pi_r_0.15_25_100_100_130_gan_no_noise.txt 
./batch_evalsim_coda_sensors_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_100_100_130/pi_r_0.15_25_100_100_130_gan_sensor_noise.txt 
./batch_evalsim_coda_actuation_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_100_100_130/pi_r_0.15_25_100_100_130_gan_actuation_noise.txt
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_100_100_130/pi_r_0.15_25_100_100_130_gan_all_noise.txt
