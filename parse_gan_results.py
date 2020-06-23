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
all_successes, all_spls, all_sspls, all_fdg, all_actions, all_collisions, all_stop, all_aed = [], [], [], [], [], [], [], []

txt_files = ["", ""]
for filename in os.listdir(outfile):
    if filename.endswith("sensor_noise.txt"): 
        txt_files[0] = filename
    elif filename.endswith("all_noise.txt"): 
        txt_files[1] = filename
print(txt_files)
for filename in txt_files:
    print(os.path.join(outfile, filename))
    actions, collisions, successes, agent_ep_dists, final_dists, spls, sspls, stops = [], [], [], [], [], [], [], []
    ep_actions, ep_collisions, ep_success, ep_aed, ep_fdg, ep_spl, ep_sspl, ep_stop, ep_ids = [], [], [], [], [], [], [], [], []
    with open(os.path.join(outfile, filename),'r') as f:
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
    all_successes.append(np.mean(successes))
    all_spls.append(np.mean(spls))
    all_sspls.append(np.mean(sspls))
    all_fdg.append(np.mean(final_dists))
    all_actions.append(np.mean(actions))
    all_collisions.append(np.mean(collisions))
    all_stop.append(np.mean(stops))
    all_aed.append(np.mean(agent_ep_dists))

# print('avg successes: ', np.mean(successes))
# print('avg spl: ', np.mean(spls))
# print('avg soft spls: ', np.mean(sspls))
# print('avg final_dists: ', np.mean(final_dists))
# print('avg # actions: ', np.mean(actions))
# print('avg # collisions: ', np.mean(collisions))
# print('avg stop: ', np.mean(stops))
# print('avg agent_ep_dists: ', np.mean(agent_ep_dists))

print('#### success ####' )
for a in all_successes:
    print('')
    print(a)
print('')
print('#### spl ####' )
for a in all_spls:
    print('')
    print(a)
print('')
print('#### soft spl ####' )
for a in all_sspls:
    print('')
    print(a)
print('')
print('#### final dist to goal ####' )
for a in all_fdg:
    print('')
    print(a)
print('')
print('#### actions ####' )
for a in all_actions:
    print('')
    print(a)
print('')
print('#### collisions ####' )
for a in all_collisions:
    print('')
    print(a)
print('')
print('#### stop ####' )
for a in all_stop:
    print('')
    print(a)
print('')
print('#### agent ep dist ####' )
for a in all_aed:
    print('')
    print(a)
