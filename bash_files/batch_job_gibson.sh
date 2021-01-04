#!/bin/bash

MODEL_PATH="data/checkpoints/rect_0.15_v2/ddppo_gibson_no_noise_0.15_rect_v2/ckpt.25.8.413801725215652.pth"
#./evalsim_gibson_no_noise.sh ${MODEL_PATH} | tee results/rect_0.15_v2_gibson/pi_s_0.15_25_v2_gibson_no_noise.txt
./evalsim_gibson_sensors.sh ${MODEL_PATH} | tee results/rect_0.15_v2_gibson/pi_s_0.15_25_v2_gibson_sensor_noise.txt
./evalsim_gibson_actuation.sh ${MODEL_PATH} | tee results/rect_0.15_v2_gibson/pi_s_0.15_25_v2_gibson_actuation_noise.txt
#./evalsim_gibson_noisy.sh ${MODEL_PATH} | tee results/rect_0.15_v2_gibson/pi_s_0.15_25_v2_gibson_all_noise.txt

MODEL_PATH="data/checkpoints/rect_0.15_v2/ddppo_gibson_no_noise_0.15_rect_v2/ckpt.50.8.541744389802725.pth"
#./evalsim_gibson_no_noise.sh ${MODEL_PATH} | tee results/rect_0.15_v2_gibson/pi_s_0.15_50_v2_gibson_no_noise.txt
./evalsim_gibson_sensors.sh ${MODEL_PATH} | tee results/rect_0.15_v2_gibson/pi_s_0.15_50_v2_gibson_sensor_noise.txt
./evalsim_gibson_actuation.sh ${MODEL_PATH} | tee results/rect_0.15_v2_gibson/pi_s_0.15_50_v2_gibson_actuation_noise.txt
#./evalsim_gibson_noisy.sh ${MODEL_PATH} | tee results/rect_0.15_v2_gibson/pi_s_0.15_50_v2_gibson_all_noise.txt

MODEL_PATH="data/checkpoints/rect_0.15_v2/ddppo_gibson_noise_0.15_rect_v2/ckpt.25.8.241663457835964.pth"
#./evalsim_gibson_no_noise.sh ${MODEL_PATH} | tee results/rect_0.15_v2_gibson/pi_t_0.15_25_v2_gibson_no_noise.txt
./evalsim_gibson_sensors.sh ${MODEL_PATH} | tee results/rect_0.15_v2_gibson/pi_t_0.15_25_v2_gibson_sensor_noise.txt
./evalsim_gibson_actuation.sh ${MODEL_PATH} | tee results/rect_0.15_v2_gibson/pi_t_0.15_25_v2_gibson_actuation_noise.txt
#./evalsim_gibson_noisy.sh ${MODEL_PATH} | tee results/rect_0.15_v2_gibson/pi_t_0.15_25_v2_gibson_all_noise.txt

MODEL_PATH="data/checkpoints/rect_0.15_v2/ddppo_gibson_noise_0.15_rect_v2/ckpt.50.8.331351111767747.pth"
#./evalsim_gibson_no_noise.sh ${MODEL_PATH} | tee results/rect_0.15_v2_gibson/pi_t_0.15_50_v2_gibson_no_noise.txt
./evalsim_gibson_sensors.sh ${MODEL_PATH} | tee results/rect_0.15_v2_gibson/pi_t_0.15_50_v2_gibson_sensor_noise.txt
./evalsim_gibson_actuation.sh ${MODEL_PATH} | tee results/rect_0.15_v2_gibson/pi_t_0.15_50_v2_gibson_actuation_noise.txt
#./evalsim_gibson_noisy.sh ${MODEL_PATH} | tee results/rect_0.15_v2_gibson/pi_t_0.15_50_v2_gibson_all_noise.txt
