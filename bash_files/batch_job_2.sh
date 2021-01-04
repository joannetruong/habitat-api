#!/bin/bash

MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_rect_nvc_100_v2/ckpt.25.5.947293829812627.pth"
./batch_evalsim_coda_no_noise_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_25_100_no_noise.txt
./batch_evalsim_coda_sensors_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_25_100_sensor_noise.txt
./batch_evalsim_coda_actuation_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_25_100_actuation_noise.txt
./batch_evalsim_coda_noisy_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_25_100_all_noise.txt

MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_rect_nvc_100_v2/ckpt.50.6.128699589167435.pth"
./batch_evalsim_coda_no_noise_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_50_100_no_noise.txt
./batch_evalsim_coda_sensors_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_50_100_sensor_noise.txt
./batch_evalsim_coda_actuation_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_50_100_actuation_noise.txt
./batch_evalsim_coda_noisy_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_50_100_all_noise.txt

MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_rect_nvc_250_v2/ckpt.25.7.097930509967177.pth"
./batch_evalsim_coda_no_noise_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_25_250_no_noise.txt
./batch_evalsim_coda_sensors_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_25_250_sensor_noise.txt
./batch_evalsim_coda_actuation_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_25_250_actuation_noise.txt
./batch_evalsim_coda_noisy_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_25_250_all_noise.txt

MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_rect_nvc_250_v2/ckpt.50.7.473763283253939.pth"
./batch_evalsim_coda_no_noise_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_50_250_no_noise.txt
./batch_evalsim_coda_sensors_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_50_250_sensor_noise.txt
./batch_evalsim_coda_actuation_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_50_250_actuation_noise.txt
./batch_evalsim_coda_noisy_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_50_250_all_noise.txt

MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_rect_nvc_500_v2/ckpt.25.7.458229175066527.pth"
./batch_evalsim_coda_no_noise_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_25_500_no_noise.txt
./batch_evalsim_coda_sensors_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_25_500_sensor_noise.txt
./batch_evalsim_coda_actuation_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_25_500_actuation_noise.txt
./batch_evalsim_coda_noisy_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_25_500_all_noise.txt

MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_rect_nvc_500_v2/ckpt.50.7.73326412257464.pth"
./batch_evalsim_coda_no_noise_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_50_500_no_noise.txt
./batch_evalsim_coda_sensors_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_50_500_sensor_noise.txt
./batch_evalsim_coda_actuation_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_50_500_actuation_noise.txt
./batch_evalsim_coda_noisy_2.sh ${MODEL_PATH} | tee results/rect_0.15_v2/pi_r_0.15_50_500_all_noise.txt
