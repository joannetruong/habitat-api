#!/bin/bash

NOISE_TYPE="poisson_ilqr"
MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_rect_nvc_500_poisson_ilqr_rgbd_act/ckpt.25.6.974184988627749.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/5_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_5.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/10_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_10.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/15_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_15.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/20_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_20.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/25_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_25.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/30_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_30.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/35_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_35.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/40_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_40.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/45_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_45.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/50_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_50.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/55_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_55.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/60_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_60.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/65_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_65.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/70_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_70.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/75_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_75.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/80_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_80.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/85_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_85.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/90_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_90.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/95_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_95.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/100_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_100.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/105_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_105.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/110_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_110.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/115_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_115.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/120_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_120.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/125_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_125.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/130_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_130.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/135_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_135.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/140_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_140.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/145_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_145.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/150_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_150.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/155_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_155.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/160_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_160.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/165_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_165.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/170_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_170.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/175_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_175.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/180_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_180.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/185_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_185.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/190_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_190.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/195_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_195.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_poisson_500/200_net_G_A.pth"
./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_poisson_ilqr/cyc_500/pi_r_0.15_25_500_500_gan_all_noise_200.txt

#GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_500/5_net_G_A.pth"
#./batch_evalsim_coda_no_noise_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_500_500_5/pi_r_0.15_25_500_500_5_gan_no_noise.txt 
#./batch_evalsim_coda_sensors_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_500_500_5/pi_r_0.15_25_500_500_5_gan_sensor_noise.txt 
#./batch_evalsim_coda_actuation_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_500_500_5/pi_r_0.15_25_500_500_5_gan_actuation_noise.txt
#./batch_evalsim_coda_noisy_rgbd_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rgbd_rect_0.15_gan/pi_r_0.15_25_500_500_5/pi_r_0.15_25_500_500_5_gan_all_noise.txt
