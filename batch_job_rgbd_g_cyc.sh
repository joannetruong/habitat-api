#!/bin/bash

NOISE_TYPE="gaussian_proportional"
MODEL_PATH="data/checkpoints/bda/no_noise/ckpt.25.8.468102965864578.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_5k/55_net_G_A.pth"
./batch_evalsim_coda_no_noise_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_gaussian/pi_s_0.15_cyc/pi_s_0.15_25_55_no_noise.txt
./batch_evalsim_coda_sensors_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_gaussian/pi_s_0.15_cyc/pi_s_0.15_25_55_sensor_noise.txt
./batch_evalsim_coda_actuation_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_gaussian/pi_s_0.15_cyc/pi_s_0.15_25_55_actuation_noise.txt
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_gaussian/pi_s_0.15_cyc/pi_s_0.15_25_55_all_noise.txt
