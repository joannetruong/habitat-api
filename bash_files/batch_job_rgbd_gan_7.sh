#!/bin/bash

NOISE_TYPE="gaussian_proportional"
MODEL_PATH="data/checkpoints/rgbd_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_100_v2_rgbd_act/ckpt.25.6.005681818181818.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_100/155_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_100/pi_r_0.15_25_100_100_gan_all_noise_155.txt

MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_100_v2_act/ckpt.25.6.38173284419508.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_100/120_net_G_A.pth"
./batch_evalsim_coda_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/cyc_100/pi_r_0.15_25_100_100_all_noise_120.txt

MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_1k_v2_act/ckpt.25.8.413448509485095.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_1k/100_net_G_A.pth"
./batch_evalsim_coda_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/cyc_1k/pi_r_0.15_25_1k_1k_all_noise_100.txt
