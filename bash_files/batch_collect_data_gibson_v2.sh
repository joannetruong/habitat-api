#!/bin/bash

MODEL_PATH="data/checkpoints/rgbd_0.15/ddppo_gibson_no_noise_0.15_rect_rgbd_v2/ckpt.25.8.468102965864578.pth"
NOISE_TYPE="gaussian_proportional"
TEST_SCENE="Denmark"
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d1.txt 
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d2.txt 
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d3.txt 
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d4.txt 
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d5.txt 
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d6.txt 
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d7.txt 
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d8.txt 
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d9.txt 
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d10.txt 
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d11.txt
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d12.txt
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d13.txt
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d14.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d15.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d16.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d17.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d18.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d19.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_d20.txt
#./evalsim_gibson_no_noise_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE} | tee results/rgbd_no_noise_data_gibson_d1.txt 
#./evalsim_gibson_no_noise_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE} | tee results/rgbd_no_noise_data_gibson_d2.txt
#./evalsim_gibson_no_noise_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE} | tee results/rgbd_no_noise_data_gibson_d3.txt
