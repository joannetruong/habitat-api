#!/bin/bash

MODEL_PATH="data/checkpoints/rgbd_0.15/ddppo_gibson_noise_regress_0.15_rect_nvc_1k_v2_rgbd/ckpt.25.8.161110101744185.pth"
./evalsim_gibson_no_noise_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_1k_gibson_no_noise.txt
./evalsim_gibson_actuation_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_1k_gibson_actuation_noise.txt
./evalsim_gibson_sensors_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_1k_gibson_sensor_noise.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_1k_gibson_all_noise.txt

MODEL_PATH="data/checkpoints/rgbd_0.15/ddppo_gibson_noise_regress_0.15_rect_nvc_500_v2_rgbd/ckpt.25.7.623762004801921.pth"
./evalsim_gibson_no_noise_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_500_gibson_no_noise.txt
./evalsim_gibson_actuation_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_500_gibson_actuation_noise.txt
./evalsim_gibson_sensors_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_500_gibson_sensor_noise.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_500_gibson_all_noise.txt

MODEL_PATH="data/checkpoints/rgbd_0.15/ddppo_gibson_noise_regress_0.15_rect_nvc_250_v2_rgbd/ckpt.25.7.439238210399033.pth"
./evalsim_gibson_no_noise_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_250_gibson_no_noise.txt
./evalsim_gibson_actuation_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_250_gibson_actuation_noise.txt
./evalsim_gibson_sensors_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_250_gibson_sensor_noise.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_250_gibson_all_noise.txt

MODEL_PATH="data/checkpoints/rgbd_0.15/ddppo_gibson_noise_regress_0.15_rect_nvc_100_v2_rgbd/ckpt.25.4.739161088967436.pth"
./evalsim_gibson_no_noise_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_100_gibson_no_noise.txt
./evalsim_gibson_actuation_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_100_gibson_actuation_noise.txt
./evalsim_gibson_sensors_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_100_gibson_sensor_noise.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_100_gibson_all_noise.txt
