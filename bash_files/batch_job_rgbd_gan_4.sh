#!/bin/bash

#NOISE_TYPE="gaussian_proportional"
NOISE_TYPE="poisson_ilqr"
MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_rect_nvc_500_poisson_ilqr_rgbd_act/ckpt.25.6.974184988627749.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/40_net_G_A.pth"
./batch_evalsim_coda_no_noise_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/pi_r_0.15_25_500_500_40/pi_r_0.15_25_500_500_gan_no_noise.txt
./batch_evalsim_coda_sensors_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/pi_r_0.15_25_500_500_40/pi_r_0.15_25_500_500_gan_sensor_noise.txt 
./batch_evalsim_coda_actuation_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/pi_r_0.15_25_500_500_40/pi_r_0.15_25_500_500_gan_actuation_noise.txt
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/pi_r_0.15_25_500_500_40/pi_r_0.15_25_500_500_gan_all_noise.txt
