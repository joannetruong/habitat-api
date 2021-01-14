#!/bin/bash
#SBATCH --job-name=aftn_0.15
#SBATCH --output=logs/ddppo/out/ddppo_0.15_ft_rgbd_poisson_ilqr_act.out
#SBATCH --error=logs/ddppo/error/ddppo_0.15_ft_rgbd_poisson_ilqr_act.log
#SBATCH --gres gpu:1
#SBATCH --nodes 1
#SBATCH --cpus-per-task 6
#SBATCH --ntasks-per-node 1
#SBATCH --partition=long

source ~/.bashrc
conda activate habitat-bda

#export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/nvidia-opengl:${LD_LIBRARY_PATH}
#export GLOG_minloglevel=2
#export MAGNUM_LOG=quiet
export PYTHONPATH=$PYTHONPATH:/srv/share3/jtruong33/develop/habitat-sim/
#export MASTER_ADDR=$(srun --ntasks=1 hostname 2>&1 | tail -n1)

cd /srv/share3/jtruong33/develop/habitat-api
srun python -u -m habitat_baselines.run \
    --exp-config habitat_baselines/config/pointnav/ddppo_pointnav_0.15_rgbd.yaml \
    --run-type train

