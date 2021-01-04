#!/bin/bash
#SBATCH --job-name=a1k_nvrn_0.15
#SBATCH --output=logs/ddppo/out/ddppo_nvrn_0.15_rect_1k_speckle_mb_rgbd_act.out
#SBATCH --error=logs/ddppo/error/ddppo_nvrn_0.15_rect_1k_speckle_mb_rgbd_act.log
#SBATCH --gpus-per-node 8
#SBATCH --nodes 8
#SBATCH --cpus-per-task 10
#SBATCH --ntasks-per-node 8
#SBATCH --mem-per-cpu 5GB
#SBATCH --time=72:00:00
#SBATCH --signal=USR1@600
#SBATCH --partition=learnfair,scavenge

set -x
module purge
module load cuda/10.1
module load cudnn/v7.6.5.32-cuda.10.1
module load NCCL/2.5.6-1-cuda.10.1
source activate habitat

export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/nvidia-opengl:${LD_LIBRARY_PATH}
export GLOG_minloglevel=2
export MAGNUM_LOG=quiet
export PYTHONPATH=$PYTHONPATH:/private/home/jtruong/repos/habitat-sim/
export MASTER_ADDR=$(srun --ntasks=1 hostname 2>&1 | tail -n1)

srun python -u -m habitat_baselines.run \
    --exp-config habitat_baselines/config/pointnav/ddppo_pointnav_regress_0.15_noisy_nvc_1k_speckle_mb_rgbd_act.yaml \
    --run-type train
