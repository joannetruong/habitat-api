#!/bin/bash

#NOISE_TYPE="poisson_ilqr"
#NOISE_TYPE="gaussian_proportional"
NOISE_TYPE="speckle_mb"
#MODEL_PATH="data/checkpoints/rgbd_0.15/ddppo_gibson_no_noise_0.15_rect_rgbd_v2/ckpt.50.8.537474189407892.pth"
#./batch_evalsim_coda_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_s_0.15_50_no_noise.txt
#./batch_evalsim_coda_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_s_0.15_50_sensor_noise.txt
#./batch_evalsim_coda_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_s_0.15_50_actuation_noise.txt
#./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_s_0.15_50_all_noise.txt

#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_v2_rgbd_v3/ckpt.0.4.044451395670573.pth"
#./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15/ft/pi_ft_0.15_25_all_noise_0.txt

#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_rect_rgbd_speckle_mb/ckpt.25.8.482794698907231.pth"
#./batch_evalsim_coda_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_t_0.15_25_no_noise.txt
#./batch_evalsim_coda_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_t_0.15_25_sensor_noise.txt
#./batch_evalsim_coda_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_t_0.15_25_actuation_noise.txt
#./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_t_0.15_25_all_noise.txt

#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rgbd_poisson_ilqr/ckpt.25.8.552448141163794.pth"
#./batch_evalsim_coda_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_ft_0.15_25_no_noise.txt
#./batch_evalsim_coda_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_ft_0.15_25_sensor_noise.txt
#./batch_evalsim_coda_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_ft_0.15_25_actuation_noise.txt
#./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_ft_0.15_25_all_noise.txt

#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rgbd_poisson_ilqr_act/ckpt.25.8.404137054182696.pth"
#./batch_evalsim_coda_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_ft_0.15_25_act_no_noise.txt
#./batch_evalsim_coda_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_ft_0.15_25_act_sensor_noise.txt
#./batch_evalsim_coda_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_ft_0.15_25_act_actuation_noise.txt
#./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_ft_0.15_25_act_all_noise.txt

MODEL_PATH="data/checkpoints/rgbd_0.15/ddppo_gibson_no_noise_0.15_rect_rgbd_v2/ckpt.25.8.468102965864578.pth"
./batch_evalsim_coda_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_s_0.15_25/pi_s_0.15_25_no_noise.txt
./batch_evalsim_coda_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_s_0.15_25/pi_s_0.15_25_sensor_noise.txt
./batch_evalsim_coda_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_s_0.15_25/pi_s_0.15_25_actuation_noise.txt
./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_speckle_mb/pi_s_0.15_25/pi_s_0.15_25_all_noise.txt

#MODEL_PATH="data/checkpoints/rgbd_0.15/ddppo_gibson_no_noise_0.15_rect_rgbd_v2/ckpt.50.8.537474189407892.pth"
#./batch_evalsim_coda_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_s_0.15_50_no_noise.txt
#./batch_evalsim_coda_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_s_0.15_50_sensor_noise.txt
#./batch_evalsim_coda_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_s_0.15_50_actuation_noise.txt
#./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_s_0.15_50_all_noise.txt

#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_rect_rgbd_poisson_ilqr/ckpt.25.8.431734891439636.pth"
#./batch_evalsim_coda_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_t_0.15_25_no_noise.txt
#./batch_evalsim_coda_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_t_0.15_25_sensor_noise.txt
#./batch_evalsim_coda_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_t_0.15_25_actuation_noise.txt
#./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_t_0.15_25_all_noise.txt

#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_rect_rgbd_poisson_ilqr/ckpt.50.8.475862947395237.pth"
#./batch_evalsim_coda_no_noise_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_t_0.15_50_no_noise.txt
#./batch_evalsim_coda_sensors_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_t_0.15_50_sensor_noise.txt
#./batch_evalsim_coda_actuation_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_t_0.15_50_actuation_noise.txt
#./batch_evalsim_coda_noisy_rgbd.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rgbd_rect_0.15_poisson_ilqr/pi_t_0.15_50_all_noise.txt
