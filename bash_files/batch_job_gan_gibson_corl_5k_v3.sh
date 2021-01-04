#!/bin/bash

NOISE_TYPE="gaussian_proportional"
# NOISE_TYPE="poisson_ilqr"
MODEL_PATH="data/checkpoints/rgbd_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_5k_v2_rgbd_act/ckpt.25.8.423400621118013.pth"

GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/120_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_120.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/115_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_115.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/110_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_110.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/105_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_105.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/100_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_100.txt
