#!/bin/bash

NOISE_TYPE="speckle_mb"
MODEL_PATH="data/checkpoints/bda/no_noise/ckpt.25.8.468102965864578.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_5k/10_net_G_A.pth"
./batch_evalsim_coda_no_noise_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle/pi_s_0.15_cyc/pi_s_0.15_25_10_no_noise.txt
./batch_evalsim_coda_sensors_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle/pi_s_0.15_cyc/pi_s_0.15_25_10_sensor_noise.txt
./batch_evalsim_coda_actuation_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle/pi_s_0.15_cyc/pi_s_0.15_25_10_actuation_noise.txt
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle/pi_s_0.15_cyc/pi_s_0.15_25_10_all_noise.txt
