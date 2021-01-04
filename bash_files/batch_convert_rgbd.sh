#!/bin/bash

python convert_to_rgbd.py --rgb-dir sim_sensor_imgs_gibson_corl/rgb_GaussianNoiseModel_train --depth-dir sim_sensor_imgs_gibson_corl/depth_RedwoodDepthNoiseModel_train --rgbd-dir sim_sensor_imgs_gibson_corl_gaussian/trainA
python convert_to_rgbd.py --rgb-dir sim_sensor_imgs_gibson_corl/rgb_no_noise_train --depth-dir sim_sensor_imgs_gibson_corl/depth_no_noise_train --rgbd-dir sim_sensor_imgs_gibson_corl_gaussian/trainB
#python convert_to_rgbd.py --rgb-dir sim_sensor_imgs/rgb_SpeckleNoiseModel_train --depth-dir sim_sensor_imgs/depth_RedwoodDepthNoiseModel_train --rgbd-dir sim_sensor_imgs_speckle/trainA
#python convert_to_rgbd.py --rgb-dir sim_sensor_imgs/rgb_SpeckleNoiseModel_test --depth-dir sim_sensor_imgs/depth_RedwoodDepthNoiseModel_test --rgbd-dir sim_sensor_imgs_speckle/testA
#python convert_to_rgbd.py --rgb-dir sim_sensor_imgs_gen/rgb_no_noise_train --depth-dir sim_sensor_imgs_gen/depth_no_noise_train --rgbd-dir sim2real_rgbd_gibson/trainB
#python convert_to_rgbd.py --rgb-dir sim_sensor_imgs_gen/rgb_no_noise_test --depth-dir sim_sensor_imgs_gen/depth_no_noise_test --rgbd-dir sim2real_rgbd_gibson/testB
