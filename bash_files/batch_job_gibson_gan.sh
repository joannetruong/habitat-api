#!/bin/bash

MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_0.15_ft_rect_v2_act/ckpt.25.8.401080505250343.pth"
#./evalsim_gibson_no_noise_rgbd_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_ft_0.15_25_gan_gibson_no_noise.txt
./evalsim_gibson_sensors_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_ft_0.15_25_gan_gibson_sensor_noise.txt
#./evalsim_gibson_actuation_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_ft_0.15_25_gan_gibson_actuation_noise.txt
./evalsim_gibson_noisy_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_ft_0.15_25_gan_gibson_all_noise.txt

MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_5k_v2_act/ckpt.25.8.29572631322067.pth"
#./evalsim_gibson_no_noise_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_5k_gan_gibson_no_noise.txt
./evalsim_gibson_sensors_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_5k_gan_gibson_sensor_noise.txt
#./evalsim_gibson_actuation_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_5k_gan_gibson_actuation_noise.txt
./evalsim_gibson_noisy_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_5k_gan_gibson_all_noise.txt

MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_1k_v2_act/ckpt.25.8.413448509485095.pth"
#./evalsim_gibson_no_noise_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_1k_gan_gibson_no_noise.txt
./evalsim_gibson_sensors_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_1k_gan_gibson_sensor_noise.txt
#./evalsim_gibson_actuation_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_1k_gan_gibson_actuation_noise.txt
./evalsim_gibson_noisy_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_1k_gan_gibson_all_noise.txt

MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_500_v2_act/ckpt.25.7.759786607799853.pth"
#./evalsim_gibson_no_noise_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_500_gan_gibson_no_noise.txt
./evalsim_gibson_sensors_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_500_gan_gibson_sensor_noise.txt
#./evalsim_gibson_actuation_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_500_gan_gibson_actuation_noise.txt
./evalsim_gibson_noisy_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_500_gan_gibson_all_noise.txt

MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_250_v2_act/ckpt.25.7.472275229357798.pth"
#./evalsim_gibson_no_noise_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_250_gan_gibson_no_noise.txt
./evalsim_gibson_sensors_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_250_gan_gibson_sensor_noise.txt
#./evalsim_gibson_actuation_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_250_gan_gibson_actuation_noise.txt
./evalsim_gibson_noisy_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_250_gan_gibson_all_noise.txt

MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_100_v2_act/ckpt.25.6.38173284419508.pth"
#./evalsim_gibson_no_noise_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_100_gan_gibson_no_noise.txt
./evalsim_gibson_sensors_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_100_gan_gibson_sensor_noise.txt
#./evalsim_gibson_actuation_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_100_gan_gibson_actuation_noise.txt
./evalsim_gibson_noisy_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_100_gan_gibson_all_noise.txt

MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_0.15_ft_rect_v2_act/ckpt.25.8.401080505250343.pth"
./evalsim_gibson_no_noise_rgbd_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_ft_0.15_25_gan_gibson_no_noise.txt
./evalsim_gibson_actuation_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_ft_0.15_25_gan_gibson_actuation_noise.txt

MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_5k_v2_act/ckpt.25.8.29572631322067.pth"
./evalsim_gibson_no_noise_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_5k_gan_gibson_no_noise.txt
./evalsim_gibson_actuation_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_5k_gan_gibson_actuation_noise.txt

MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_1k_v2_act/ckpt.25.8.413448509485095.pth"
./evalsim_gibson_no_noise_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_1k_gan_gibson_no_noise.txt
./evalsim_gibson_actuation_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_1k_gan_gibson_actuation_noise.txt

MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_500_v2_act/ckpt.25.7.759786607799853.pth"
./evalsim_gibson_no_noise_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_500_gan_gibson_no_noise.txt
./evalsim_gibson_actuation_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_500_gan_gibson_actuation_noise.txt

MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_250_v2_act/ckpt.25.7.472275229357798.pth"
./evalsim_gibson_no_noise_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_250_gan_gibson_no_noise.txt
./evalsim_gibson_actuation_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_250_gan_gibson_actuation_noise.txt

MODEL_PATH="data/checkpoints/rect_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_100_v2_act/ckpt.25.6.38173284419508.pth"
./evalsim_gibson_no_noise_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_100_gan_gibson_no_noise.txt
./evalsim_gibson_actuation_gan.sh ${MODEL_PATH} | tee results/rect_0.15_gan_gibson/pi_r_0.15_25_100_gan_gibson_actuation_noise.txt
