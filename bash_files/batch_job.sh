#!/bin/bash
NOISE_TYPE="poisson_ilqr"
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr_v2/ckpt.0.4.830571174621582.pth"
#./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/ft/pi_ft_0.15_25_all_noise_0.txt
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr_v2/ckpt.5.4.090893053028681.pth"
#./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/ft/pi_ft_0.15_25_all_noise_5.txt
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr_v2/ckpt.15.4.91467755518922.pth"
#./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/ft/pi_ft_0.15_25_all_noise_15.txt
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr_v2/ckpt.25.5.89995668107612.pth"
#./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/ft/pi_ft_0.15_25_all_noise_25.txt
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr_v2/ckpt.35.6.471321361085662.pth"
#./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/ft/pi_ft_0.15_25_all_noise_35.txt
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr_v2/ckpt.45.6.792858306349708.pth"
#./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/ft/pi_ft_0.15_25_all_noise_45.txt
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr_v2/ckpt.55.7.031342202518554.pth"
#./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/ft/pi_ft_0.15_25_all_noise_55.txt
MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr_v2/ckpt.65.7.398412284830554.pth"
./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/ft/pi_ft_0.15_25_all_noise_65.txt



#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr_v2/ckpt.1.3.4517898559570312.pth"
#./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/ft/pi_ft_0.15_25_all_noise_1.txt
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr_v2/ckpt.10.4.04498408186082.pth"
#./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/ft/pi_ft_0.15_25_all_noise_10.txt
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr_v2/ckpt.20.5.429246295193385.pth"
#./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/ft/pi_ft_0.15_25_all_noise_20.txt
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr_v2/ckpt.30.6.249168113425926.pth"
#./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/ft/pi_ft_0.15_25_all_noise_30.txt
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr_v2/ckpt.40.6.642943463022205.pth"
#./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/ft/pi_ft_0.15_25_all_noise_40.txt
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr_v2/ckpt.50.6.929282043840481.pth"
#./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/ft/pi_ft_0.15_25_all_noise_50.txt
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr_v2/ckpt.60.7.260205364325939.pth"
#./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/ft/pi_ft_0.15_25_all_noise_60.txt
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr_v2/ckpt.70.7.510086305500676.pth"
#./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/ft/pi_ft_0.15_25_all_noise_70.txt

#NOISE_TYPE="poisson_ilqr"
# MODEL_PATH="data/checkpoints/rect_0.15_v2/ddppo_gibson_no_noise_0.15_rect_v2/ckpt.25.8.413801725215652.pth"
# ./batch_evalsim_coda_no_noise.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_s_0.15_25_no_noise.txt
# ./batch_evalsim_coda_actuation.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_s_0.15_25_actuation_noise.txt
# ./batch_evalsim_coda_sensors.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_s_0.15_25_sensor_noise.txt
# ./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_s_0.15_25_all_noise.txt

# MODEL_PATH="data/checkpoints/rect_0.15_v2/ddppo_gibson_no_noise_0.15_rect_v2/ckpt.50.8.541744389802725.pth"
# ./batch_evalsim_coda_no_noise.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_s_0.15_50_no_noise.txt
# ./batch_evalsim_coda_actuation.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_s_0.15_50_actuation_noise.txt
# ./batch_evalsim_coda_sensors.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_s_0.15_50_sensor_noise.txt
# ./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_s_0.15_50_all_noise.txt

# MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_rect_poisson_ilqr/ckpt.25.8.592280578075432.pth"
# ./batch_evalsim_coda_no_noise.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_t_0.15_25_no_noise.txt
# ./batch_evalsim_coda_actuation.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_t_0.15_25_actuation_noise.txt
# ./batch_evalsim_coda_sensors.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_t_0.15_25_sensor_noise.txt
# ./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_t_0.15_25_all_noise.txt

# MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_rect_poisson_ilqr/ckpt.50.8.28192583359302.pth"
# ./batch_evalsim_coda_no_noise.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_t_0.15_50_no_noise.txt
# ./batch_evalsim_coda_actuation.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_t_0.15_50_actuation_noise.txt
# ./batch_evalsim_coda_sensors.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_t_0.15_50_sensor_noise.txt
# ./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_t_0.15_50_all_noise.txt

# MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr/ckpt.25.8.505062630480166.pth"
# ./batch_evalsim_coda_no_noise.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_ft_0.15_25_no_noise.txt
# ./batch_evalsim_coda_actuation.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_ft_0.15_25_actuation_noise.txt
# ./batch_evalsim_coda_sensors.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_ft_0.15_25_sensor_noise.txt
# ./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_ft_0.15_25_all_noise.txt

# MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft_rect_poisson_ilqr_act_2/ckpt.25.8.506537021220682.pth"
# ./batch_evalsim_coda_no_noise.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_ft_0.15_25_act_no_noise.txt
# ./batch_evalsim_coda_actuation.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_ft_0.15_25_act_actuation_noise.txt
# ./batch_evalsim_coda_sensors.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_ft_0.15_25_act_sensor_noise.txt
# ./batch_evalsim_coda_noisy.sh ${MODEL_PATH} ${NOISE_TYPE} | tee results/rect_0.15_poisson_ilqr/pi_ft_0.15_25_act_all_noise.txt
