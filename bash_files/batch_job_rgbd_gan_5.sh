#!/bin/bash

NOISE_TYPE="gaussian_proportional"
MODEL_PATH="data/checkpoints/rgbd_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_250_v2_rgbd_act/ckpt.25.7.6800717793728746.pth"
#GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/5_net_G_A.pth"
#./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_5.txt
#GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/10_net_G_A.pth"
#./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_10.txt
#GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/15_net_G_A.pth"
#./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_15.txt
#GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/20_net_G_A.pth"
#./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_20.txt
#GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/25_net_G_A.pth"
#./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_25.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/30_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_30.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/35_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_35.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/40_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_40.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/45_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_45.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/50_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_50.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/55_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_55.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/60_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_60.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/65_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_65.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/70_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_70.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/75_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_75.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/80_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_80.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/85_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_85.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/90_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_90.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/95_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_95.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/100_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_100.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/105_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_105.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/110_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_110.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/115_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_115.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/120_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_120.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/125_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_125.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/130_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_130.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/135_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_135.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/140_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_140.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/145_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_145.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/150_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_150.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/155_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_155.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/160_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_160.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/165_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_165.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/170_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_170.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/175_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_175.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/180_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_180.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/185_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_185.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/190_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_190.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/195_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_195.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/200_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/cyc_250/pi_r_0.15_25_250_250_gan_all_noise_200.txt

#GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_250/135_net_G_A.pth"
#./batch_evalsim_coda_no_noise_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_250_250_135/pi_r_0.15_25_250_250_135_gan_no_noise.txt 
#./batch_evalsim_coda_sensors_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_250_250_135/pi_r_0.15_25_250_250_135_gan_sensor_noise.txt 
#./batch_evalsim_coda_actuation_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_250_250_135/pi_r_0.15_25_250_250_135_gan_actuation_noise.txt
#./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_250_250_135/pi_r_0.15_25_250_250_135_gan_all_noise.txt
