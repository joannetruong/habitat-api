#!/bin/bash

NOISE_TYPE="gaussian_proportional"
# NOISE_TYPE="poisson_ilqr"
MODEL_PATH="data/checkpoints/rgbd_0.15_act/ddppo_gibson_noise_regress_0.15_rect_nvc_5k_v2_rgbd_act/ckpt.25.8.423400621118013.pth"
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/5_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_5.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/10_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_10.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/15_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_15.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/20_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_20.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/25_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_25.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/30_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_30.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/35_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_35.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/40_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_40.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/45_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_45.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/50_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_50.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/55_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_55.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/60_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_60.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/65_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_65.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/70_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_70.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/75_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_75.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/80_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_80.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/85_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_85.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/90_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_90.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/95_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_95.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/100_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_100.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/105_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_105.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/110_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_110.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/115_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_115.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/120_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_120.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/125_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_125.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/130_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_130.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/135_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_135.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/140_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_140.txt
GAN_PATH="cyclegan_models/sim2real_rgbd_gaussian_gibson_5k/145_net_G_A.pth"
./batch_evalsim_gibson_noisy_gan.sh ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}| tee results/rect_0.15_gaussian_gibson_corl/cyc_5k/pi_r_0.15_25_5k_5k_gan_all_noise_145.txt
