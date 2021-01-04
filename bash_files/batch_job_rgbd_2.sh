#!/bin/bash

NOISE_TYPE="gaussian_proportional"

MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_v2_rgbd_v3/ckpt.30.8.027109176569303.pth"
./batch_evalsim_coda_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15/pi_ft_30/pi_ft_0.15_30_no_noise.txt
./batch_evalsim_coda_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15/pi_ft_30/pi_ft_0.15_30_sensor_noise.txt
./batch_evalsim_coda_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15/pi_ft_30/pi_ft_0.15_30_actuation_noise.txt
./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15/pi_ft_30/pi_ft_0.15_30_all_noise.txt

#NOISE_TYPE="poisson_ilqr"
#NOISE_TYPE="gaussian_proportional"
#NOISE_TYPE="speckle_mb"
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_rgbd_speckle_mb_v1/ckpt.0.4.561675262451172.pth"
#./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/ft/pi_ft_0.15_0_all_noise_0.txt

#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_rgbd_speckle_mb_v1/ckpt.55.7.416364856568085.pth"
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_rgbd_speckle_mb_v1/ckpt.65.7.5971908406219635.pth"
#./batch_evalsim_coda_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_ft/pi_ft_0.15_55_no_noise.txt
#./batch_evalsim_coda_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_ft/pi_ft_0.15_55_sensor_noise.txt
#./batch_evalsim_coda_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_ft/pi_ft_0.15_55_actuation_noise.txt
#./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_ft/pi_ft_0.15_55_all_noise.txt

#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_v2_rgbd_v3/ckpt.1.6.087847900390625.pth"
#./batch_evalsim_coda_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15/pi_ft_rgbd_0.15_16k_1/pi_ft_0.15_16k_no_noise.txt
#./batch_evalsim_coda_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15/pi_ft_rgbd_0.15_16k_1/pi_ft_0.15_16k_sensor_noise.txt
#./batch_evalsim_coda_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15/pi_ft_rgbd_0.15_16k_1/pi_ft_0.15_16k_actuation_noise.txt
#./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15/pi_ft_rgbd_0.15_16k_1/pi_ft_0.15_16k_all_noise.txt
