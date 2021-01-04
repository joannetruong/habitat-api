#!/bin/bash

NOISE_TYPE="poisson_ilqr"

MODEL_PATH="data/checkpoints/bda/poisson_ilqr/pi_r/ckpt.25.8.357177307529993.pth"
./batch_evalsim_coda_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_speckle/pi_r_0.15_act/pi_r_0.15_25_no_noise.txt
./batch_evalsim_coda_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_speckle/pi_r_0.15_act/pi_r_0.15_5_sensor_noise.txt
./batch_evalsim_coda_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_speckle/pi_r_0.15_act/pi_r_0.15_25_actuation_noise.txt
./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_speckle/pi_r_0.15_act/pi_r_0.15_25_all_noise.txt
