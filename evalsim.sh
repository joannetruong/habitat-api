#/bin/bash

# set -x

#module purge
#module load cuda/10.0
#module load cudnn/v7.6-cuda.10.0
#module load NCCL/2.4.7-1-cuda.10.0

#source activate sim2real-19
# source activate sim2real-sliding-on

export LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu/nvidia-opengl:${LD_LIBRARY_PATH}"
export GLOG_minloglevel=2
export MAGNUM_LOG="quiet"
export PYTHONPATH="${PYTHONPATH}:sim2real/map_and_plan_agent"
#export PYTHONPATH="habitat-sim/:${PYTHONPATH}"
# export PYTHONPATH="/private/home/akadian/sim2real/habitat-sim-sliding-on:${PYTHONPATH}"

#MODEL_PATH="sim2real/models/eval-model-deployment-nov-4-2019/job_19633798.sensor_DEPTH_SENSOR.train_data_gibson.noise_multiplier_0.5.noise_model_controller_Proportional.agent_radius_0.20.success_reward_10.0.slack_reward_-0.01.collision_reward_0.0.spl_max_collisions_500_ckpt.000000059.pth"
MODEL_PATH="sim2real/data/new_checkpoints/ddppo_pointnav_no_noise/ckpt.000000399.pth"
SENSORS="RGB_SENSOR,DEPTH_SENSOR"
#SENSORS="DEPTH_SENSOR"
# NOISE_MULTIPLIER="0.0"
# NOISE_MODEL_CONTROLLER="Proportional"
AGENT_RADIUS="0.20"
SENSOR_POSITION="[0,0.6096,0]"
BACKBONE="resnet50"
HIDDEN_SIZE=512
NUM_RECURRENT_LAYERS=2
NORMALIZE_VISUAL_INPUTS=1

#VIDEO_OPTION="['disk']"
VIDEO_DIR="video_dir/no_noise"
VIDEO_OPTION="[]"

# EPISODE_DATASET_PATH="sim2real/data/datasets/pointnav/gibson/v1/{split}/{split}.json.gz"
# EPISODE_DATASET_SPLIT="val"

EPISODE_DATASET_PATH="sim2real/data/datasets/pointnav/lab/{split}/{split}.json.gz"
EPISODE_DATASET_SPLIT=$1

RGB_NOISE=$2
RGB_NOISE_MULTIPLIER=$3
DEPTH_NOISE=$4
TRAJ_NOISE=$5
TRAJ_NOISE_MULTIPLIER=$6

python -u evaluation/evaluate_simulation.py \
    --model-path ${MODEL_PATH} \
    --data-split ${EPISODE_DATASET_SPLIT} \
    --rgb-noise ${RGB_NOISE} \
    --rgb-noise-multiplier ${RGB_NOISE_MULTIPLIER} \
    --depth-noise ${DEPTH_NOISE} \
    --sensors ${SENSORS} \
    --hidden-size ${HIDDEN_SIZE} \
    --normalize-visual-inputs ${NORMALIZE_VISUAL_INPUTS} \
    --backbone ${BACKBONE} \
    --num-recurrent-layers ${NUM_RECURRENT_LAYERS} \
#    --depth-only\
    "TEST_EPISODE_COUNT" "20" \
    "TASK_CONFIG.SIMULATOR.ACTION_SPACE_CONFIG" "pyrobotnoisy" \
    "TASK_CONFIG.SIMULATOR.NOISE_MODEL.CONTROLLER" ${TRAJ_NOISE} \
    "TASK_CONFIG.SIMULATOR.NOISE_MODEL.NOISE_MULTIPLIER" ${TRAJ_NOISE_MULTIPLIER} \
    "TASK_CONFIG.SIMULATOR.RGB_SENSOR.HFOV" "45" \
    "TASK_CONFIG.SIMULATOR.RGB_SENSOR.VFOV" "45" \
    "TASK_CONFIG.SIMULATOR.DEPTH_SENSOR.HFOV" "45" \
    "TASK_CONFIG.SIMULATOR.DEPTH_SENSOR.VFOV" "45" \
    "TASK_CONFIG.SIMULATOR.TURN_ANGLE" "30" \
    "TASK_CONFIG.SIMULATOR.AGENT_0.RADIUS" ${AGENT_RADIUS} \
    "TASK_CONFIG.DATASET.DATA_PATH" ${EPISODE_DATASET_PATH} \
    "TASK_CONFIG.DATASET.SPLIT" ${EPISODE_DATASET_SPLIT} \
    "TASK_CONFIG.ENVIRONMENT.GENERATE_ON_FLY" "False" \
    "TASK_CONFIG.SIMULATOR.RGB_SENSOR.POSITION" ${SENSOR_POSITION} \
    "TASK_CONFIG.SIMULATOR.DEPTH_SENSOR.POSITION" ${SENSOR_POSITION} \
    "VIDEO_OPTION" ${VIDEO_OPTION} \
    "TASK_CONFIG.TASK.TOP_DOWN_MAP.MAP_RESOLUTION" "5000" \
