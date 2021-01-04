#/bin/bash

export LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu/nvidia-opengl:${LD_LIBRARY_PATH}"
export GLOG_minloglevel=2
export MAGNUM_LOG="quiet"
#export PYTHONPATH="${PYTHONPATH}:/srv/share3/jtruong33/develop/sim2real/map_and_plan_agent"

MODEL_PATH=$1
SENSORS="RGB_SENSOR,DEPTH_SENSOR"
#SENSORS="DEPTH_SENSOR"
BACKBONE="resnet50"
HIDDEN_SIZE=512
NUM_RECURRENT_LAYERS=2
NORMALIZE_VISUAL_INPUTS=1
MAX_COLLISIONS="40"

EPISODE_DATASET_PATH="data/datasets/pointnav/gibson/v1/test/{split}.json.gz"
EPISODE_DATASET_SPLIT=$2

#VIDEO_OPTION="['disk']"
VIDEO_OPTION="[]"
VIDEO_DIR="junk"
NOISE="all"
NOISE_TYPE=$3

python -u evaluation/evaluate_simulation_gibson.py \
    --model-path ${MODEL_PATH} \
    --data-split ${EPISODE_DATASET_SPLIT} \
    --sensors ${SENSORS} \
    --hidden-size ${HIDDEN_SIZE} \
    --normalize-visual-inputs ${NORMALIZE_VISUAL_INPUTS} \
    --backbone ${BACKBONE} \
    --num-recurrent-layers ${NUM_RECURRENT_LAYERS} \
    --noise ${NOISE}\
    --noise-type ${NOISE_TYPE}\
    "TEST_EPISODE_COUNT" "70" \
    "TASK_CONFIG.TASK.SUCCESS.MAX_COLLISIONS" ${MAX_COLLISIONS} \
    "TASK_CONFIG.DATASET.DATA_PATH" ${EPISODE_DATASET_PATH} \
    "TASK_CONFIG.DATASET.SPLIT" ${EPISODE_DATASET_SPLIT} \
    "VIDEO_OPTION" ${VIDEO_OPTION} \
    "VIDEO_DIR" ${VIDEO_DIR} \
