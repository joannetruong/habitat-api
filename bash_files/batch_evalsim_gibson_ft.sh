#!/bin/bash

NOISE_TYPE="gaussian_proportional"
# NOISE_TYPE="poisson_ilqr"
MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_v2_rgbd_v3/ckpt.30.8.027109176569303.pth"
#MODEL_PATH="data/checkpoints/rgbd_0.15/ddppo_gibson_no_noise_0.15_rect_rgbd_v2/ckpt.25.8.468102965864578.pth"
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} Swormville ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/ft_30_1.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} Swormville ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/ft_30_2.txt

# NOISE_TYPE="gaussian_proportional"
# MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_5k_v2_act/ckpt.25.8.29572631322067.pth"
# GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_5k/40_net_G_A.pth"
# ./batch_evalsim_coda_no_noise_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_5k_5k_40/pi_r_0.15_25_5k_5k_no_noise.txt
# ./batch_evalsim_coda_sensors_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_5k_5k_40/pi_r_0.15_25_5k_5k_sensor_noise.txt 
# ./batch_evalsim_coda_actuation_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_5k_5k_40/pi_r_0.15_25_5k_5k_actuation_noise.txt 
# ./batch_evalsim_coda_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_5k_5k_40/pi_r_0.15_25_5k_5k_all_noise.txt 

# MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_1k_v2_act/ckpt.25.8.413448509485095.pth"
# GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_1k/55_net_G_A.pth"
# ./batch_evalsim_coda_no_noise_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_1k_1k_55/pi_r_0.15_25_1k_1k_no_noise.txt 
# ./batch_evalsim_coda_sensors_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_1k_1k_55/pi_r_0.15_25_1k_1k_sensor_noise.txt 
# ./batch_evalsim_coda_actuation_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_1k_1k_55/pi_r_0.15_25_1k_1k_actuation_noise.txt
# ./batch_evalsim_coda_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_1k_1k_55/pi_r_0.15_25_1k_1k_all_noise.txt

# MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_500_v2_act/ckpt.25.7.759786607799853.pth"
# GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_500/35_net_G_A.pth"
# ./batch_evalsim_coda_no_noise_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_500_500_35/pi_r_0.15_25_500_500_no_noise.txt
# ./batch_evalsim_coda_sensors_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_500_500_35/pi_r_0.15_25_500_500_sensor_noise.txt
# ./batch_evalsim_coda_actuation_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_500_500_35/pi_r_0.15_25_500_500_actuation_noise.txt
# ./batch_evalsim_coda_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_500_500_35/pi_r_0.15_25_500_500_all_noise.txt

# MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_250_v2_act/ckpt.25.7.472275229357798.pth"
# GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/20_net_G_A.pth"
# ./batch_evalsim_coda_no_noise_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_250_250_20/pi_r_0.15_25_250_250_no_noise.txt
# ./batch_evalsim_coda_sensors_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_250_250_20/pi_r_0.15_25_250_250_sensor_noise.txt
# ./batch_evalsim_coda_actuation_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_250_250_20/pi_r_0.15_25_250_250_actuation_noise.txt
# ./batch_evalsim_coda_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_250_250_20/pi_r_0.15_25_250_250_all_noise.txt

# MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_100_v2_act/ckpt.25.6.38173284419508.pth"
# GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_100/130_net_G_A.pth"
# ./batch_evalsim_coda_no_noise_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_100_100_130/pi_r_0.15_25_100_100_no_noise.txt
# ./batch_evalsim_coda_sensors_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_100_100_130/pi_r_0.15_25_100_100_sensor_noise.txt
# ./batch_evalsim_coda_actuation_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_100_100_130/pi_r_0.15_25_100_100_actuation_noise.txt
# ./batch_evalsim_coda_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE} | tee results/rect_0.15_gan/pi_r_0.15_25_100_100_130/pi_r_0.15_25_100_100_all_noise.txt
