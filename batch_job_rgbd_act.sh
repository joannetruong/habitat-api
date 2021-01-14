#!/bin/bash

#NOISE_TYPE="poisson_ilqr"
NOISE_TYPE="speckle_mb"

#MODEL_PATH="data/checkpoints/bda/poisson_ilqr/pi_r/ckpt.25.8.57833594976452.pth"
MODEL_PATH="data/checkpoints/bda/speckle_movebase/pi_r/ckpt.25.8.157356347193119.pth"

./batch_evalsim_coda_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle/pi_r_0.15_act/pi_r_0.15_25_no_noise.txt
./batch_evalsim_coda_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle/pi_r_0.15_act/pi_r_0.15_5_sensor_noise.txt
./batch_evalsim_coda_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle/pi_r_0.15_act/pi_r_0.15_25_actuation_noise.txt
./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle/pi_r_0.15_act/pi_r_0.15_25_all_noise.txt
