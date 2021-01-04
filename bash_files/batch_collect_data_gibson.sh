#!/bin/bash

MODEL_PATH="data/checkpoints/rgbd_0.15/ddppo_gibson_no_noise_0.15_rect_rgbd_v2/ckpt.25.8.468102965864578.pth"
NOISE_TYPE="gaussian_proportional"
TEST_SCENE="Swormville"
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_sworm1.txt
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_sworm2.txt
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_sworm3.txt
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_sworm4.txt
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_sworm5.txt
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_sworm6.txt
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_sworm7.txt
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_sworm8.txt
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_sworm9.txt
#./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_sworm10.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_sworm11.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_sworm12.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_sworm13.txt
./evalsim_gibson_noisy_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE}| tee results/rgbd_noisy_data_gibson_sworm14.txt
#./evalsim_gibson_no_noise_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE} | tee results/rgbd_no_noise_data_gibson_sworm1.txt
#./evalsim_gibson_no_noise_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE} | tee results/rgbd_no_noise_data_gibson_sworm2.txt
#./evalsim_gibson_no_noise_rgbd.sh ${MODEL_PATH} ${TEST_SCENE} ${NOISE_TYPE} | tee results/rgbd_no_noise_data_gibson_sworm3.txt
