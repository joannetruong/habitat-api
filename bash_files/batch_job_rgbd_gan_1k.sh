#!/bin/bash

#NOISE_TYPE="gaussian_proportional"
#MODEL_PATH="data/checkpoints/rgbd_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_1k_v2_rgbd_act/ckpt.25.8.220981341944743.pth"
NOISE_TYPE="poisson_ilqr"
MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_rect_nvc_1k_poisson_ilqr_rgbd_act/ckpt.25.8.27260348583878.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_1k_v2/195_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_1k_v2/pi_r_0.15_25_1k_1k_gan_all_noise_195.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_1k_v2/200_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_1k_v2/pi_r_0.15_25_1k_1k_gan_all_noise_200.txt

GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_1k_v2/100_net_G_A.pth"
./batch_evalsim_coda_no_noise_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/pi_r_0.15_25_1k_1k_100/pi_r_0.15_25_1k_1k_100_gan_no_noise.txt 
./batch_evalsim_coda_sensors_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/pi_r_0.15_25_1k_1k_100/pi_r_0.15_25_1k_1k_100_gan_sensor_noise.txt 
./batch_evalsim_coda_actuation_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/pi_r_0.15_25_1k_1k_100/pi_r_0.15_25_1k_1k_100_gan_actuation_noise.txt
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/pi_r_0.15_25_1k_1k_100/pi_r_0.15_25_1k_1k_100_gan_all_noise.txt


#GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_1k/55_net_G_A.pth"
#./batch_evalsim_coda_no_noise_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_1k_1k_55/pi_r_0.15_25_1k_1k_55_gan_no_noise.txt 
#./batch_evalsim_coda_sensors_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_1k_1k_55/pi_r_0.15_25_1k_1k_55_gan_sensor_noise.txt 
#./batch_evalsim_coda_actuation_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_1k_1k_55/pi_r_0.15_25_1k_1k_55_gan_actuation_noise.txt
#./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_1k_1k_55/pi_r_0.15_25_1k_1k_55_gan_all_noise.txt
