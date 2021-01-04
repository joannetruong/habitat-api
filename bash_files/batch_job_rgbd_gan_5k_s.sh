#!/bin/bash

#NOISE_TYPE="gaussian_proportional"
#MODEL_PATH="data/checkpoints/rgbd_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_1k_v2_rgbd_act/ckpt.25.8.220981341944743.pth"
NOISE_TYPE="speckle_mb"
MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_rect_nvc_5k_speckle_mb_rgbd_act/ckpt.25.8.157356347193119.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_5k/10_net_G_A.pth"
./batch_evalsim_coda_no_noise_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/pi_r_0.15_25_5k_5k_10/pi_r_0.15_25_5k_5k_10_gan_no_noise.txt 
./batch_evalsim_coda_sensors_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/pi_r_0.15_25_5k_5k_10/pi_r_0.15_25_5k_5k_10_gan_sensor_noise.txt 
./batch_evalsim_coda_actuation_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/pi_r_0.15_25_5k_5k_10/pi_r_0.15_25_5k_5k_10_gan_actuation_noise.txt
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/pi_r_0.15_25_5k_5k_10/pi_r_0.15_25_5k_5k_10_gan_all_noise.txt

#GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_5k/200_net_G_A.pth"
#./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_200.txt

#GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_1k/55_net_G_A.pth"
#./batch_evalsim_coda_no_noise_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_1k_1k_55/pi_r_0.15_25_1k_1k_55_gan_no_noise.txt 
#./batch_evalsim_coda_sensors_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_1k_1k_55/pi_r_0.15_25_1k_1k_55_gan_sensor_noise.txt 
#./batch_evalsim_coda_actuation_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_1k_1k_55/pi_r_0.15_25_1k_1k_55_gan_actuation_noise.txt
#./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_1k_1k_55/pi_r_0.15_25_1k_1k_55_gan_all_noise.txt
