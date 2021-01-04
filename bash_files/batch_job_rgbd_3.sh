#!/bin/bash

NOISE_TYPE="poisson_ilqr"
#NOISE_TYPE="gaussian_proportional"
#NOISE_TYPE="speckle_mb"
MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rgbd_poisson_ilqr_v2/ckpt.35.7.65104015853482.pth"
./batch_evalsim_coda_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_ft_35/pi_ft_0.15_35_no_noise.txt
./batch_evalsim_coda_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_ft_35/pi_ft_0.15_35_sensor_noise.txt
./batch_evalsim_coda_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_ft_35/pi_ft_0.15_35_actuation_noise.txt
./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_ft_35/pi_ft_0.15_35_all_noise.txt 

#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_v2_rgbd_v3/ckpt.1.6.087847900390625.pth"
#./batch_evalsim_coda_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15/pi_ft_rgbd_0.15_16k_1/pi_ft_0.15_16k_no_noise.txt
#./batch_evalsim_coda_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15/pi_ft_rgbd_0.15_16k_1/pi_ft_0.15_16k_sensor_noise.txt
#./batch_evalsim_coda_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15/pi_ft_rgbd_0.15_16k_1/pi_ft_0.15_16k_actuation_noise.txt
#./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15/pi_ft_rgbd_0.15_16k_1/pi_ft_0.15_16k_all_noise.txt
