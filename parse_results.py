import gzip
import json
import math
import os
from collections import OrderedDict
import argparse

import numpy as np
parser = argparse.ArgumentParser()
parser.add_argument("--outfile", type=str, required=True)
args = parser.parse_args()

outfile = args.outfile
# outfile = 'lab_eval_txt/eval_kadian/kadian_noisy_actuation.txt'

#outfile = 'sim_sensor_imgs/lab_eval_txt/finetune/regression_nn_9.txt'
#outfile = 'results/pi_t_0.15_159_sensors.txt'
# outfile = 'sim_sensor_imgs/lab_eval_txt/eval_depth_no_noise_vary_0.2/noisy_depth_0.1_gaussian_redwood_0.2_dist_lab_eval_202_sensors.txt'
# outfile = 'sim_sensor_imgs/lab_eval_txt/eval_depth_no_noise_vary_0.1/noisy_depth_0.1_gaussian_redwood_0.1_dist_lab_eval_341_all.txt'
actions, collisions, successes, agent_ep_dists, final_dists, spls, sspls, stops = [], [], [], [], [], [], [], []
ep_actions, ep_collisions, ep_success, ep_aed, ep_fdg, ep_spl, ep_sspl, ep_stop, ep_ids = [], [], [], [], [], [], [], [], []

with open(outfile,'r') as f:
    for line in f:
        if line.startswith("Average episode spl:"):
            actions.append([a for _,a in sorted(zip(ep_ids,ep_actions))])
            collisions.append([a for _,a in sorted(zip(ep_ids,ep_collisions))])
            successes.append([a for _,a in sorted(zip(ep_ids,ep_success))])
            agent_ep_dists.append([a for _,a in sorted(zip(ep_ids,ep_aed))])
            final_dists.append([a for _,a in sorted(zip(ep_ids,ep_fdg))])
            spls.append([a for _,a in sorted(zip(ep_ids,ep_spl))])
            sspls.append([a for _,a in sorted(zip(ep_ids,ep_sspl))])
            stops.append([a for _,a in sorted(zip(ep_ids,ep_stop))])
            ep_ids, ep_actions, ep_collisions, ep_success, ep_aed, ep_fdg, ep_spl, ep_sspl, ep_stop  = [], [], [], [], [], [], [], [], []
        elif line.startswith("Ep_id:"):
            ep_ids.append(float(line.split(':')[1].split('S')[0]))
        elif line.startswith('# Actions:'):
            ep_actions.append(float(line.split(':')[-1]))
        elif line.startswith('# Collisions:'):
            ep_collisions.append(float(line.split(':')[-1]))
        elif line.startswith('Success:'):
            ep_success.append(float(line.split(':')[-1]))
        elif line.startswith('Agent Episode Distance:'):
            ep_aed.append(float(line.split(':')[-1]))
        elif line.startswith('Final Distance to Goal:'):
            ep_fdg.append(float(line.split(':')[-1]))
        elif line.startswith('SPL:'):
            ep_spl.append(float(line.split(':')[-1]))
        elif line.startswith('Soft SPL:'):
            ep_sspl.append(float(line.split(':')[-1]))
        elif line.startswith('Called Stop:'):
            called_stop = line.split(':')[-1]
            ep_stop.append(called_stop == " True\n")

for idx, ai in enumerate(actions):
    for a in ai:
        print(a)
    print('#### actions break ' + str(idx) + '####' )

for idx, ai in enumerate(collisions):
    for a in ai:
        print(a)
    print('#### collisions break ' + str(idx) + '####' )

for idx, ai in enumerate(successes):
    for a in ai:
        print(a)
    print('#### successes break ' + str(idx) + '####' )

for idx, ai in enumerate(agent_ep_dists):
    for a in ai:
        print(a)
    print('#### agent_ep_dists break ' + str(idx) + '####' )

for idx, ai in enumerate(final_dists):
    for a in ai:
        print(a)
    print('#### final_dists break ' + str(idx) + '####' )

for idx, ai in enumerate(spls):
    for a in ai:
        print(a)
    print('#### spls break ' + str(idx) + '####' )

for idx, ai in enumerate(sspls):
    for a in ai:
        print(a)
    print('#### softspl break ' + str(idx) + '####' )

for idx, ai in enumerate(stops):
    for a in ai:
        print(a)
    print('#### called_stop break ' + str(idx) + '####' )

print('avg successes: ', np.mean(successes))
print('avg spl: ', np.mean(spls))
print('avg soft spls: ', np.mean(sspls))
print('avg final_dists: ', np.mean(final_dists))
print('avg # actions: ', np.mean(actions))
print('avg # collisions: ', np.mean(collisions))
print('avg stop: ', np.mean(stops))
print('avg agent_ep_dists: ', np.mean(agent_ep_dists))

#print(np.mean(successes))
#print(np.mean(spls))
#print(np.mean(sspls))
#print(np.mean(final_dists))
#print(np.mean(actions))
#print(np.mean(collisions))
#print(np.mean(stops))
#print(np.mean(agent_ep_dists))
