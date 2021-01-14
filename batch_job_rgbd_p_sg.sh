#!/bin/bash

NOISE_TYPE="gaussian_proportional"
MODEL_PATH="data/checkpoints/bda/poisson_ilqr/pi_r/ckpt.25.8.57833594976452.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_5k/20_net_G_A.pth"
./batch_evalsim_coda_no_noise_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson/pi_r_0.15_bda_gaussian_20/pi_r_0.15_25_5k_20_no_noise.txt
./batch_evalsim_coda_sensors_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson/pi_r_0.15_bda_gaussian_20/pi_r_0.15_25_5k_20_sensor_noise.txt
./batch_evalsim_coda_actuation_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson/pi_r_0.15_bda_gaussian_20/pi_r_0.15_25_5k_20_actuation_noise.txt
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson/pi_r_0.15_bda_gaussian_20/pi_r_0.15_25_5k_20_all_noise.txt

NOISE_TYPE="speckle_mb"
MODEL_PATH="data/checkpoints/bda/poisson_ilqr/pi_r/ckpt.25.8.57833594976452.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_5k/100_net_G_A.pth"
./batch_evalsim_coda_no_noise_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson/pi_r_0.15_bda_speckle_100/pi_r_0.15_25_5k_100_no_noise.txt
./batch_evalsim_coda_sensors_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson/pi_r_0.15_bda_speckle_100/pi_r_0.15_25_5k_100_sensor_noise.txt
./batch_evalsim_coda_actuation_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson/pi_r_0.15_bda_speckle_100/pi_r_0.15_25_5k_100_actuation_noise.txt
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson/pi_r_0.15_bda_speckle_100/pi_r_0.15_25_5k_100_all_noise.txt

