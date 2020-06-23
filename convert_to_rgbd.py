import argparse
import glob
import os

import cv2
import numpy as np
from PIL import Image


#### SAVE AS RGBD
def create_rgbd(rgb_dir, depth_dir, rgbd_dir):
    rgb_imgs = sorted(os.listdir(rgb_dir))
    depth_imgs = sorted(os.listdir(depth_dir))
    for r,d in zip(rgb_imgs, depth_imgs):
        img_num = r.split('_')[-1].split('.')[0]
        rgb_img = cv2.imread(os.path.join(rgb_dir, r), cv2.IMREAD_UNCHANGED)
        depth_img = cv2.imread(os.path.join(depth_dir, d), cv2.IMREAD_UNCHANGED)
        rgbd_img = np.dstack((rgb_img, depth_img))
        np.save(os.path.join(rgbd_dir,'rgbd_' + img_num), rgbd_img)

def split_rgbd(rgb_dir, depth_dir, rgbd_dir):
    rgbd_imgs = sorted(os.listdir(rgbd_dir))
    for rgbd in rgbd_imgs:
        rgbd_img = np.load(os.path.join(rgbd_dir, rgbd))
        img_num = rgbd.split('_')[-1].split('.')[0]
        rgb = Image.fromarray(rgbd_img[:,:,:3][...,::-1], mode="RGB")
        rgb.save(os.path.join(rgbd_dir, 'rgb_' + img_num + '.jpg'))
        d = Image.fromarray((rgbd_img[:,:,-1]).astype(np.uint8), mode="L")
        d.save(os.path.join(rgbd_dir, 'depth_' + img_num + '.jpg'))

def create_dir(dir_path):
    if not os.path.exists(dir_path):
        os.makedirs(dir_path)
    return

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--rgb-dir", type=str, required=True)
    parser.add_argument("--depth-dir", type=str, required=True)
    parser.add_argument("--rgbd-dir", type=str, required=True)
    args = parser.parse_args()

    rgb_dir = os.path.join("sim_sensor_imgs", args.rgb_dir)
    depth_dir = os.path.join("sim_sensor_imgs", args.depth_dir)
    rgbd_dir = args.rgbd_dir
    # rgbd_dir = os.path.join("../cycada/cyclegan/datasets", args.rgbd_dir)

    #rgb_dir = os.path.join("sim_sensor_imgs", 'rgb_GaussianNoiseModel_0.1')
    #depth_dir = os.path.join("sim_sensor_imgs", 'depth_RedwoodDepthNoiseModel')
    #rgbd_dir = os.path.join("sim_sensor_imgs", 'rgbd_temp')

    create_dir(rgbd_dir)
    create_rgbd(rgb_dir, depth_dir, rgbd_dir)
    #split_rgbd(rgb_dir, depth_dir, rgbd_dir)
