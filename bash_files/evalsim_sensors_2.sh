#/bin/bash

export LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu/nvidia-opengl:${LD_LIBRARY_PATH}"
export GLOG_minloglevel=2
export MAGNUM_LOG="quiet"
#export PYTHONPATH="${PYTHONPATH}:/srv/share3/jtruong33/develop/sim2real/map_and_plan_agent"

############SQUARE############
### PI_S_0.15 ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_no_noise_0.15/ckpt.25.8.100274725274724.pth"
#MODEL_PATH="data/checkpoints/ddppo_gibson_no_noise_0.15/ckpt.58.8.63442521631644.pth"
### PI_T_0.15 ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15/ckpt.25.8.325761386500822.pth"
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15/ckpt.36.8.315774970323893.pth"
### PI_R_0.15 ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15/ckpt.25.8.338498111680604.pth"
### PI_R_0.15_NVC ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_nvc/ckpt.25.8.33525452853154.pth"
### PI_S_0.2 ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_no_noise_0.2/ckpt.25.8.038873259584207.pth"
#MODEL_PATH="data/checkpoints/ddppo_gibson_no_noise_0.2/ckpt.55.8.357340372046254.pth"
### PI_T_0.2 ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.2/ckpt.25.8.380372676104383.pth"
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.2/ckpt.55.8.520117416829745.pth"
### PI_R_0.2_NVC ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.2_nvc/ckpt.25.8.118314783807742.pth"
### PI_FT_0.15 ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_ft/ckpt.25.8.18478442513369.pth"
#MODEL_PATH="../habitat-api-v2/data/checkpoints/ddppo_gibson_no_noise_0.30/ckpt.47.8.317802024968053.pth"
#MODEL_PATH="../habitat-api-v2/data/checkpoints/ddppo_gibson_no_noise_0.30_v3/ckpt.2.-7.489095677792548.pth"
#MODEL_PATH="data/checkpoints/ddppo_gibson_no_noise_0.15_d2/ckpt.25.8.363398572131954.pth"

### PI_S_0.15 ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_no_noise_0.15_d3/ckpt.25.8.450630886259358.pth"
#MODEL_PATH="data/checkpoints/ddppo_gibson_no_noise_0.15_d3/ckpt.50.8.459777504472273.pth"

### PI_T_0.15 ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_d3/ckpt.25.8.393886516669404.pth"
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_d3/ckpt.50.8.381465517241379.pth"

### PI_FT_0.15 ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.15_d3_ft/ckpt.25.8.329265000771247.pth"

### PI_R_0.15_NVC_5k ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_d3_nvc_5k/ckpt.25.8.330395282116672.pth"

### PI_R_0.15_NVC_1k ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_d3_nvc_1k/ckpt.25.8.32167279530353.pth"

### PI_R_0.15_NVC_250 ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_d3_nvc_250/ckpt.25.7.235939538095604.pth"

### PI_R_0.15_NVC_1k ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_rect_nvc_1k/ckpt.25.8.514018848872434.pth"

### PI_R_0.15_NVC_250 ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_rect_nvc_250/ckpt.25.7.2537708539651105.pth"

### PI_S_0.15 ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_no_noise_0.15_rect/ckpt.25.8.40831539630286.pth"
#MODEL_PATH="data/checkpoints/ddppo_gibson_no_noise_0.15_rect/ckpt.45.8.665258434823146.pth"

### PI_T_0.2 ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.2_rect/ckpt.25.8.378726494419814.pth"
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_0.2_rect/ckpt.50.8.239308109631509.pth"

### PI_R_0.2_NVC_1k ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.2_rect_nvc_1k/ckpt.25.8.364811555501609.pth"

### PI_R_0.2_NVC_250 ###
#MODEL_PATH="data/checkpoints/ddppo_gibson_noise_regress_0.15_rect_nvc_250/ckpt.25.7.2537708539651105.pth"

MODEL_PATH=$3
#SENSORS="RGB_SENSOR,DEPTH_SENSOR"
SENSORS="DEPTH_SENSOR"
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
NOISE="sensors"

python -u evaluation/evaluate_simulation_coda.py \
    --model-path ${MODEL_PATH} \
    --data-split ${EPISODE_DATASET_SPLIT} \
    --sensors ${SENSORS} \
    --hidden-size ${HIDDEN_SIZE} \
    --normalize-visual-inputs ${NORMALIZE_VISUAL_INPUTS} \
    --backbone ${BACKBONE} \
    --num-recurrent-layers ${NUM_RECURRENT_LAYERS} \
    --noise ${NOISE}\
    "TEST_EPISODE_COUNT" "5" \
    "TASK_CONFIG.TASK.SUCCESS.MAX_COLLISIONS" ${MAX_COLLISIONS} \
    "TASK_CONFIG.DATASET.DATA_PATH" ${EPISODE_DATASET_PATH} \
    "TASK_CONFIG.DATASET.SPLIT" ${EPISODE_DATASET_SPLIT} \
    "VIDEO_OPTION" ${VIDEO_OPTION} \
    "VIDEO_DIR" ${VIDEO_DIR} \
