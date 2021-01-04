#/bin/bash

export LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu/nvidia-opengl:${LD_LIBRARY_PATH}"
export GLOG_minloglevel=2
export MAGNUM_LOG="quiet"
#export PYTHONPATH="${PYTHONPATH}:/srv/share3/jtruong33/develop/sim2real/map_and_plan_agent"

MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_rect_rgbd_poisson_ilqr/ckpt.50.8.475862947395237.pth"
SENSORS="RGB_SENSOR,DEPTH_SENSOR"
#SENSORS="DEPTH_SENSOR"
BACKBONE="resnet50"
HIDDEN_SIZE=512
NUM_RECURRENT_LAYERS=2
NORMALIZE_VISUAL_INPUTS=1
MAX_COLLISIONS="40"

EPISODE_DATASET_PATH="data/datasets/pointnav/gibson/v1/Stokes_p1.json.gz"
#EPISODE_DATASET_PATH="data/datasets/pointnav/gibson/v1/{split}/{split}.json.gz"
#EPISODE_DATASET_PATH="data/datasets/pointnav/gibson/v1/Denmark_p1.json.gz"
#EPISODE_DATASET_PATH="data/datasets/pointnav/gibson/v1/Woonsocket_p1.json.gz"
#EPISODE_DATASET_PATH="data/datasets/pointnav/coda/{split}/{split}.json.gz"
#EPISODE_DATASET_PATH="data/datasets/pointnav/coda/{split}.json.gz"
#EPISODE_DATASET_SPLIT="val"
EPISODE_DATASET_SPLIT="train"
#EPISODE_DATASET_SPLIT="coda_hard_px"


VIDEO_OPTION="[]"
VIDEO_DIR="tmp"
#NOISE="no_noise"
NOISE="all"
#NOISE_TYPE="gaussian_proportional"
#NOISE_TYPE="speckle_mb"
NOISE_TYPE="poisson_ilqr"

python -u evaluation/evaluate_simulation_coda_scene.py \
    --model-path ${MODEL_PATH} \
    --data-split ${EPISODE_DATASET_SPLIT} \
    --sensors ${SENSORS} \
    --hidden-size ${HIDDEN_SIZE} \
    --normalize-visual-inputs ${NORMALIZE_VISUAL_INPUTS} \
    --backbone ${BACKBONE} \
    --num-recurrent-layers ${NUM_RECURRENT_LAYERS} \
    --noise ${NOISE}\
    --noise-type ${NOISE_TYPE}\
    --save-imgs\
    "TEST_EPISODE_COUNT" "994" \
    "TASK_CONFIG.TASK.SUCCESS.MAX_COLLISIONS" ${MAX_COLLISIONS} \
    "TASK_CONFIG.DATASET.DATA_PATH" ${EPISODE_DATASET_PATH} \
    "TASK_CONFIG.DATASET.SPLIT" ${EPISODE_DATASET_SPLIT} \
    "VIDEO_OPTION" ${VIDEO_OPTION} \
    "VIDEO_DIR" ${VIDEO_DIR} \
