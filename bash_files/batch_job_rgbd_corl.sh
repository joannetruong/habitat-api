#!/bin/bash

#NOISE_TYPE="poisson_ilqr"
NOISE_TYPE="gaussian_proportional"
#NOISE_TYPE="speckle_mb"

#MODEL_PATH="data/checkpoints/ddppo_gibson_no_noise_0.15_rect_rgbd_v2/ckpt.1.2.856164710214367.pth"
#MODEL_PATH="data/checkpoints/ddppo_gibson_no_noise_0.15_rect_rgbd_v2/ckpt.5.7.668226953493862.pth"
#MODEL_PATH="data/checkpoints/ddppo_gibson_no_noise_0.15_rect_rgbd_v2/ckpt.3.6.913122970476262.pth"
MODEL_PATH="data/checkpoints/ddppo_gibson_no_noise_0.15_rect_rgbd_v2/ckpt.25.8.357177307529993.pth"
./batch_evalsim_coda_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_dr_poisson_speckle/pi_dr_0.15_25/pi_dr_0.15_25_no_noise.txt
#./batch_evalsim_coda_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_dr_poisson_speckle/pi_dr_0.15_5/pi_dr_0.15_5_sensor_noise.txt
./batch_evalsim_coda_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_dr_poisson_speckle/pi_dr_0.15_25/pi_dr_0.15_25_actuation_noise.txt
./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_dr_poisson_speckle/pi_dr_0.15_25/pi_dr_0.15_25_all_noise.txt
