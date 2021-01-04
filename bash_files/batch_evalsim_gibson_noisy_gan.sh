#!/bin/bash
MODEL_PATH=$1
GAN_PATH=$2
NOISE_TYPE=$3

echo "noisy 1: "
./evalsim_gibson_noisy_rgbd_gan.sh Swormville 1 ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}
echo "noisy 2: "
./evalsim_gibson_noisy_rgbd_gan.sh Swormville 2 ${MODEL_PATH} ${GAN_PATH} ${NOISE_TYPE}
