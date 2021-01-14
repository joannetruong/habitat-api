train regression model:

`python -u models/train_regressor.py --action-space LRF --traj-dir data/ILQR_1.0_v2/ --num-train 5000 --weighted | tee logs/delta_LRF_weighted_ilqr_5k.txt`

test regression model:

`python test_weights_real.py --ckpt-dir checkpoints/2021-01-12/2021-01-12_11-59_LRF_weighted/ --data-dir data/CODA_real/`
