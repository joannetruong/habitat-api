#!/bin/bash

MODEL_PATH="data/checkpoints/rgbd_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_500_v2_rgbd_act/ckpt.25.7.4376043557168785.pth"
./evalsim_gibson_sensors_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_500_act_gibson_sensor_noise.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_500_act_gibson_all_noise.txt

MODEL_PATH="data/checkpoints/rgbd_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_250_v2_rgbd_act/ckpt.25.7.6800717793728746.pth"
./evalsim_gibson_no_noise_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_250_act_gibson_no_noise.txt
./evalsim_gibson_actuation_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_250_act_gibson_actuation_noise.txt
./evalsim_gibson_sensors_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_250_act_gibson_sensor_noise.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_250_act_gibson_all_noise.txt

MODEL_PATH="data/checkpoints/rgbd_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_100_v2_rgbd_act/ckpt.25.6.005681818181818.pth"
./evalsim_gibson_no_noise_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_100_act_gibson_no_noise.txt
./evalsim_gibson_actuation_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_100_act_gibson_actuation_noise.txt
./evalsim_gibson_sensors_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_100_act_gibson_sensor_noise.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} | tee results/rgbd_rect_0.15_gibson/pi_r_0.15_25_100_act_gibson_all_noise.txt
