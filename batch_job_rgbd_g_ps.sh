#!/bin/bash

NOISE_TYPE="poisson_ilqr"
MODEL_PATH="data/checkpoints/bda/gaussian_proportional/pi_r/ckpt.25.8.423400621118013.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_5k/55_net_G_A.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_5k/20_net_G_A.pth"
./batch_evalsim_coda_no_noise_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_gaussian/pi_r_0.15_bda_poisson_20/pi_r_0.15_25_5k_20_no_noise.txt
./batch_evalsim_coda_sensors_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_gaussian/pi_r_0.15_bda_poisson_20/pi_r_0.15_25_5k_20_sensor_noise.txt
./batch_evalsim_coda_actuation_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_gaussian/pi_r_0.15_bda_poisson_20/pi_r_0.15_25_5k_20_actuation_noise.txt
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_gaussian/pi_r_0.15_bda_poisson_20/pi_r_0.15_25_5k_20_all_noise.txt

NOISE_TYPE="speckle_mb"
MODEL_PATH="data/checkpoints/bda/gaussian_proportional/pi_r/ckpt.25.8.423400621118013.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_5k/20_net_G_A.pth"
./batch_evalsim_coda_no_noise_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_gaussian/pi_r_0.15_bda_speckle_20/pi_r_0.15_25_5k_20_no_noise.txt
./batch_evalsim_coda_sensors_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_gaussian/pi_r_0.15_bda_speckle_20/pi_r_0.15_25_5k_20_sensor_noise.txt
./batch_evalsim_coda_actuation_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_gaussian/pi_r_0.15_bda_speckle_20/pi_r_0.15_25_5k_20_actuation_noise.txt
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_gaussian/pi_r_0.15_bda_speckle_20/pi_r_0.15_25_5k_20_all_noise.txt
