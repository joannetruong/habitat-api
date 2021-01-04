#/bin/bash

export LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu/nvidia-opengl:${LD_LIBRARY_PATH}"
export GLOG_minloglevel=2
export MAGNUM_LOG="quiet"
#export PYTHONPATH="${PYTHONPATH}:/srv/share3/jtruong33/develop/sim2real/map_and_plan_agent"

MODEL_PATH=$3
SENSORS="RGB_SENSOR,DEPTH_SENSOR"
#SENSORS="DEPTH_SENSOR"
BACKBONE="resnet50"
HIDDEN_SIZE=512
NUM_RECURRENT_LAYERS=2
NORMALIZE_VISUAL_INPUTS=0
MAX_COLLISIONS="40"

# EPISODE_DATASET_PATH="/srv/share3/jtruong33/develop/sim2real/data/datasets/pointnav/gibson/v1/{split}/{split}.json.gz"
# EPISODE_DATASET_SPLIT="val"

EPISODE_DATASET_PATH="data/datasets/pointnav/coda/{split}/{split}.json.gz"
EPISODE_DATASET_SPLIT=$1
RUN=$2
#VIDEO_OPTION="['disk']"
VIDEO_OPTION="[]"
VIDEO_DIR="videos/test/${EPISODE_DATASET_SPLIT}_${RUN}"
NOISE="no_noise"
NOISE_TYPE=$5
GAN_WEIGHTS=$4

python -u evaluation/evaluate_simulation_coda_gan.py \
    --model-path ${MODEL_PATH} \
    --data-split ${EPISODE_DATASET_SPLIT} \
    --sensors ${SENSORS} \
    --hidden-size ${HIDDEN_SIZE} \
    --normalize-visual-inputs ${NORMALIZE_VISUAL_INPUTS} \
    --backbone ${BACKBONE} \
    --num-recurrent-layers ${NUM_RECURRENT_LAYERS} \
    --noise ${NOISE}\
    --noise-type ${NOISE_TYPE}\
    --depth-only\
    --use-gan\
    --gan-weights ${GAN_WEIGHTS}\
    "TEST_EPISODE_COUNT" "5" \
    "TASK_CONFIG.TASK.SUCCESS.MAX_COLLISIONS" ${MAX_COLLISIONS} \
    "TASK_CONFIG.DATASET.DATA_PATH" ${EPISODE_DATASET_PATH} \
    "TASK_CONFIG.DATASET.SPLIT" ${EPISODE_DATASET_SPLIT} \
    "VIDEO_OPTION" ${VIDEO_OPTION} \
    "VIDEO_DIR" ${VIDEO_DIR} \
