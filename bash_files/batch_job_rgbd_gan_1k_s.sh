#!/bin/bash

#NOISE_TYPE="gaussian_proportional"
#MODEL_PATH="data/checkpoints/rgbd_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_1k_v2_rgbd_act/ckpt.25.8.220981341944743.pth"
NOISE_TYPE="speckle_mb"
MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_rect_nvc_1k_speckle_mb_rgbd_act/ckpt.25.8.134949132256134.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/5_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_5.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/10_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_10.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/15_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_15.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/20_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_20.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/25_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_25.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/30_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_30.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/35_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_35.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/40_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_40.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/45_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_45.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/50_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_50.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/55_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_55.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/60_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_60.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/65_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_65.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/70_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_70.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/75_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_75.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/80_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_80.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/85_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_85.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/90_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_90.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/95_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_95.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/100_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_100.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/105_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_105.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/110_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_110.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/115_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_115.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/120_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_120.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/125_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_125.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/130_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_130.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/135_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_135.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/140_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_140.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/145_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_145.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/150_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_150.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/155_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_155.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/160_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_160.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/165_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_165.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/170_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_170.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/175_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_175.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/180_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_180.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/185_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_185.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/190_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_190.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/195_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_195.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_speckle_1k/200_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_speckle_mb/cyc_1k/pi_r_0.15_25_1k_1k_gan_all_noise_200.txt

#GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_1k/55_net_G_A.pth"
#./batch_evalsim_coda_no_noise_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_1k_1k_55/pi_r_0.15_25_1k_1k_55_gan_no_noise.txt 
#./batch_evalsim_coda_sensors_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_1k_1k_55/pi_r_0.15_25_1k_1k_55_gan_sensor_noise.txt 
#./batch_evalsim_coda_actuation_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_1k_1k_55/pi_r_0.15_25_1k_1k_55_gan_actuation_noise.txt
#./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_1k_1k_55/pi_r_0.15_25_1k_1k_55_gan_all_noise.txt
