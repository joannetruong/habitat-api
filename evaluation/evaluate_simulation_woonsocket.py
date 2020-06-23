import matplotlib.pyplot as plt
import argparse
import os
from collections import defaultdict

import habitat
import numpy as np
import quaternion
import torch
from evaluate_reality import load_model
from gym.spaces.dict_space import Dict as SpaceDict
from habitat.tasks.utils import cartesian_to_polar
from habitat.utils.geometry_utils import quaternion_rotate_vector
from habitat.utils.visualizations.utils import (images_to_video,
                                                observations_to_image)
from habitat_baselines.common.baseline_registry import baseline_registry
from habitat_baselines.common.env_utils import construct_envs
from habitat_baselines.common.environments import get_env_class
from habitat_baselines.common.utils import batch_obs, generate_video
from habitat_baselines.config.default import get_config
from habitat_sim import geo
from habitat_sim.utils.common import quat_from_two_vectors, quat_rotate_vector
from PIL import Image


def quat_to_rad(rotation):
    heading_vector = quaternion_rotate_vector(
        rotation.inverse(), np.array([0, 0, -1])
    )

    phi = cartesian_to_polar(-heading_vector[2], heading_vector[0])[1]
    return phi

def create_state(position, rotation):
    rotation_mp3d_habitat = quat_from_two_vectors(geo.GRAVITY, np.array([0, 0, -1]))
    pt_mp3d = quat_rotate_vector(rotation_mp3d_habitat, position) # That point in the mp3d scene mesh coordinate frame.
    state_xyt = [pt_mp3d[0], pt_mp3d[1]]
    theta = quat_to_rad(rotation)
    state_xyt.append(theta)
    return state_xyt

def create_traj_labels(input_arr):
    r, c = input_arr.shape
    # labels: d_x, d_y, cos_d_t, sin_d_t
    diff = np.diff(input_arr, axis=0)
    labels_arr = np.zeros((r-1, 4))
    labels_arr[:, :2] = diff[:, :2]
    labels_arr[:, 2] = np.cos(diff[:, 2])
    labels_arr[:, 3] = np.sin(diff[:, 2])
    return labels_arr

def convert_embedding(input_arr_embed):
    # SIMULATOR_REALITY_ACTIONS = {"stop": 0, "forward": 1 , "left": 2 , "right": 3}
    ONE_HOT_ACTIONS = {"0": [0, 0, 0], "1": [0, 0, 1] , "2": [0, 1, 0] , "3": [1, 0, 0]}
    r, c = input_arr_embed.shape
    input_arr_oneHot = np.zeros((r, c+2))
    input_arr_oneHot[:, :4] = input_arr_embed[:, :4]
    for row in range(r):
        input_arr_oneHot[row, 4:] = ONE_HOT_ACTIONS[str(int(input_arr_embed[row, 4]))]
        ## if logging collisions
        # input_arr_oneHot[row, 4:7] = ONE_HOT_ACTIONS[str(int(input_arr_embed[row, 4]))]
    # input_arr_embed[:, -1] = input_arr_embed[:, 5]

    return input_arr_oneHot

def save_trajectory(data, datasplit, traj_dir, traj_ctr, datatype, embed_type=""):
    pathend = datasplit + '_' + '%03d'%traj_ctr
    if embed_type != "":
        embed_type += "_"
    filename = os.path.join(traj_dir,  datatype + '_LRF_' + embed_type + pathend)
    print('saving: ', filename)
    np.save(filename, data[:, :])    
    np.savetxt(filename + '.csv', data[:, :], delimiter=",")

def create_labels_trajectory(labels_arr):
    r, c = labels_arr.shape
    # input embed: x, y, cost, sint, a
    final_labels_arr = np.zeros((r, c+1))
    ## if logging collisions
    # input_arr_embed = np.zeros((r, c+2))
    final_labels_arr[:, :2] = labels_arr[:, :2]
    final_labels_arr[:, 2] = np.cos(labels_arr[:, 2])
    final_labels_arr[:, 3] = np.sin(labels_arr[:, 2])
    return final_labels_arr

def create_input_trajectory(final_input_arr):
    r, c = final_input_arr.shape
    # input embed: x, y, cost, sint, a
    input_arr_embed = np.zeros((r, c+1))
    ## if logging collisions
    # input_arr_embed = np.zeros((r, c+2))
    input_arr_embed[:, :2] = final_input_arr[:, :2]
    input_arr_embed[:, 2] = np.cos(final_input_arr[:, 2])
    input_arr_embed[:, 3] = np.sin(final_input_arr[:, 2])
    input_arr_embed[:, 4] = final_input_arr[:, 3]
    ## if logging collisions
    # input_arr_embed[:, 5] = final_input_arr[:, 4]

    # input oneHot: x, y, cost, sint, a1, a2, a3
    input_arr_oneHot = convert_embedding(input_arr_embed)
    
    return input_arr_embed, input_arr_oneHot

def create_dir(dir_path):
    if not os.path.exists(dir_path):
        os.makedirs(dir_path)
    return

def get_last_idx(dir_path):
    f = sorted(os.listdir(dir_path))
    if not f:
        ctr = 0
    else:
        ctr = int(f[-1].split('.')[0].split('_')[-1]) +1
    return ctr

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--model-path", type=str, required=True)
#    parser.add_argument("--noisy", action="store_true")
    parser.add_argument("--noise", type=str, required=True)
    parser.add_argument("--save-imgs", action="store_true")
    parser.add_argument("--save-traj", action="store_true")
    parser.add_argument("--data-split", type=str, required=True)
    parser.add_argument("--sensors", type=str, required=True)
    parser.add_argument("--hidden-size", type=int, required=True)
    parser.add_argument(
        "--normalize-visual-inputs", type=int, required=True, choices=[0, 1]
    )
    parser.add_argument("--depth-only", action="store_true")
    parser.add_argument(
        "--backbone",
        type=str,
        required=True,
        choices=["resnet50", "se_resneXt50"],
    )
    parser.add_argument("--num-recurrent-layers", type=int, required=True)
    parser.add_argument(
        "opts",
        default=None,
        nargs=argparse.REMAINDER,
        help="Modify config options from command line",
    )
    args = parser.parse_args()

    # Check torch version
#    vtorch = "1.2.0"
#x    assert torch.__version__ == vtorch, "Please use torch {}".format(vtorch)

    if args.noise == 'all':
        cfg_file = "habitat_baselines/config/pointnav/ddppo_pointnav_coda_noisy.yaml"
    elif args.noise == 'actuation':
        cfg_file = "habitat_baselines/config/pointnav/ddppo_pointnav_coda_actuation.yaml"
    elif args.noise == 'sensors':
        cfg_file = "habitat_baselines/config/pointnav/ddppo_pointnav_coda_sensors.yaml"
    elif args.noise == 'no_noise':
        cfg_file = "habitat_baselines/config/pointnav/ddppo_pointnav_coda_no_noise.yaml"
    else:
        print('no noise specified. using all noise')
        cfg_file = "habitat_baselines/config/pointnav/ddppo_pointnav_coda_noisy.yaml"
    config = get_config(
        cfg_file, args.opts
    )
    datasplit = args.data_split.split('_')[1]
    split = 'train'
    if datasplit == 'med':
        split = 'test'
    if args.save_imgs:
        if args.noise!="no_noise":
            depth_save_path = 'depth_' + config.TASK_CONFIG.SIMULATOR.DEPTH_SENSOR.NOISE_MODEL + '_' + split
            rgb_save_path = 'rgb_' + config.TASK_CONFIG.SIMULATOR.RGB_SENSOR.NOISE_MODEL + '_' + str(config.TASK_CONFIG.SIMULATOR.RGB_SENSOR.NOISE_MODEL_KWARGS.intensity_constant) + '_' + split
        else:
            depth_save_path = 'depth_no_noise_' + split
            rgb_save_path = 'rgb_no_noise_' + split
    if args.save_traj:
        if args.noise!="no_noise":
            traj_save_path = 'traj_' + config.TASK_CONFIG.SIMULATOR.NOISE_MODEL.CONTROLLER + '_' + str(config.TASK_CONFIG.SIMULATOR.NOISE_MODEL.NOISE_MULTIPLIER) + '_' + split
        else:
            traj_save_path = 'traj_no_noise_' + split

    config.defrost()
    config.TASK_CONFIG.TASK.BASE_STATE = habitat.Config()
    config.TASK_CONFIG.TASK.BASE_STATE.TYPE = "BaseState"
    # Add the measure to the list of measures in use
    config.TASK_CONFIG.TASK.MEASUREMENTS.append("BASE_STATE")

    if args.sensors == "":
        config.SENSORS = []
    else:
        config.SENSORS = args.sensors.split(",")
    config.TASK_CONFIG.TASK.MEASUREMENTS.append("COLLISIONS")
    config.TASK_CONFIG.TASK.MEASUREMENTS.append("SOFT_SPL")
    config.TASK_CONFIG.TASK.MEASUREMENTS.append("TOP_DOWN_MAP")
    config.TASK_CONFIG.TASK.MEASUREMENTS.append("EPISODE_DISTANCE")
    config.freeze()

    envs = construct_envs(config, get_env_class(config.ENV_NAME))
    sensors_obs = envs.observation_spaces[0]

    if args.depth_only:
        config.defrost()
        config.SENSORS=["DEPTH_SENSOR"]
        config.freeze()
        envs2 = construct_envs(config, get_env_class(config.ENV_NAME))
        sensors_obs = envs2.observation_spaces[0]

    device = (
        torch.device("cuda:{}".format(config.TORCH_GPU_ID))
        if torch.cuda.is_available()
        else torch.device("cpu")
    )
    model = load_model(
        path=args.model_path,
        observation_space=sensors_obs,
        # observation_space=envs.observation_spaces[0],
        action_space=envs.action_spaces[0],
        hidden_size=args.hidden_size,
        normalize_visual_inputs=bool(args.normalize_visual_inputs),
        backbone=args.backbone,
        num_recurrent_layers=args.num_recurrent_layers,
        device=device,
    )
    model.eval()
    print('METRICS: ', config.TASK_CONFIG.TASK.MEASUREMENTS)

    metric_name = "SPL"
    metric_cfg = getattr(config.TASK_CONFIG.TASK, metric_name)
    measure_type = baseline_registry.get_measure(metric_cfg.TYPE)
    assert measure_type is not None, "invalid measurement type {}".format(
        metric_cfg.TYPE
    )
    metric_uuid = measure_type(None, None)._get_uuid()

    print('METRIC UUID: ', metric_uuid)
    observations = envs.reset()
    batch = batch_obs(observations, device)

    current_episode_reward = torch.zeros(envs.num_envs, 1, device=device)

    test_recurrent_hidden_states = torch.zeros(
        model.net.num_recurrent_layers,
        config.NUM_PROCESSES,
        args.hidden_size,
        device=device,
    )
    prev_actions = torch.zeros(
        config.NUM_PROCESSES, 1, device=device, dtype=torch.long
    )
    not_done_masks = torch.zeros(config.NUM_PROCESSES, 1, device=device)

    stats_episodes = dict()  # dict of dicts that stores stats per episode

    stats_actions = defaultdict(int)

    rgb_frames = [
        [] for _ in range(config.NUM_PROCESSES)
    ]  # type: List[List[np.ndarray]]
    if len(config.VIDEO_OPTION) > 0:
        os.makedirs(config.VIDEO_DIR, exist_ok=True)

    sensor_path = 'sim_sensor_imgs'
    traj_path = 'sim_traj'
    if args.save_imgs:
        depth_dir = os.path.join(sensor_path, depth_save_path)
        rgb_dir = os.path.join(sensor_path, rgb_save_path)
        create_dir(depth_dir)
        create_dir(rgb_dir)
        img_ctr = get_last_idx(depth_dir)
    if args.save_traj:
        traj_dir = os.path.join(traj_path, traj_save_path)
        create_dir(traj_dir)
        traj_ctr = get_last_idx(traj_dir)

    ## not logging collisions
    final_input_arr = np.array([0, 0, 0, 0])
    ## if logging collisions
    # input_arr = np.array([0, 0, 0, 0, 0])
    # final_input_arr = np.array([0, 0, 0, 0, 0])
    tmp_labels_arr = np.array([0, 0, 0])
    prev_base_state = [0, 0, 0]
    num_actions = 0
    datasplit = args.data_split.split('_')[1]
    print_once = True
    called_stop = False

    while (
        len(stats_episodes) < config.TEST_EPISODE_COUNT and envs.num_envs > 0
    ):
        current_episodes = envs.current_episodes()
        if print_once:
            print("Ep_id: ", current_episodes[0].episode_id, "Start_pos: ", current_episodes[0].start_position, current_episodes[0].start_rotation, "Goal_pos: ", current_episodes[0].goals[0].position)
            print_once = False

        with torch.no_grad():
            _, actions, _, test_recurrent_hidden_states = model.act(
                batch,
                test_recurrent_hidden_states,
                prev_actions,
                not_done_masks,
                deterministic=False,
            )

            prev_actions.copy_(actions)

        outputs = envs.step([a[0].item() for a in actions])
        num_actions +=1
        for a in actions:
            stats_actions[a[0].item()] += 1

        observations, rewards, dones, infos = [list(x) for x in zip(*outputs)]
        batch = batch_obs(observations, device)
        not_done_masks = torch.tensor(
            [[0.0] if done else [1.0] for done in dones],
            dtype=torch.float,
            device=device,
        )

        rewards = torch.tensor(
            rewards, dtype=torch.float, device=device
        ).unsqueeze(1)
        current_episode_reward += rewards
        next_episodes = envs.current_episodes()
        envs_to_pause = []
        n_envs = envs.num_envs
        for i in range(n_envs):
            if (
                next_episodes[i].scene_id,
                next_episodes[i].episode_id,
            ) in stats_episodes:
                envs_to_pause.append(i)
            # x, y, t, a
            input_row = prev_base_state + [actions[i][0].cpu().detach().tolist()]
            #input_row = prev_base_state + [actions[i][0].cpu().detach().tolist()] + [int(infos[i]["collisions"]["is_collision"])]
            curr_state = create_state(infos[i]["base_state"]['position'], infos[i]["base_state"]['rotation'])
            delta_row = np.subtract(curr_state, prev_base_state)
            prev_base_state = curr_state

            print(input_row + [int(infos[i]["collisions"]["is_collision"])])
            if int(infos[i]["collisions"]["is_collision"]) == 0:
                final_input_arr = np.vstack((final_input_arr, input_row))
                tmp_labels_arr = np.vstack((tmp_labels_arr, delta_row))

#            plt.ioff()
#            _ = plt.hist(observations[i]["depth"].flatten(), bins='auto')
#            plt.savefig('hist.jpg')
            # TODO: save only good trajectories
            if args.save_imgs:
                obz = observations[i]
                depth_obs = obz["depth"]    
                depth_obs = np.squeeze(depth_obs)
                depth_img = Image.fromarray((depth_obs * 255).astype(np.uint8), mode="L")
                depth_img.save(os.path.join(depth_dir, "depth_" + "%05d"%img_ctr + ".jpg"), "JPEG")

                rgb_obs = obz["rgb"]
                rgb_img = Image.fromarray(rgb_obs, mode="RGB")
                rgb_img.save(os.path.join(rgb_dir, "rgb_" + "%05d"%img_ctr + ".jpg"), "JPEG")
                img_ctr +=1

            # episode ended
            if not_done_masks[i].item() == 0:
                episode_stats = dict()
                episode_stats[metric_uuid] = infos[i][metric_uuid]
                episode_stats["success"] = int(infos[i][metric_uuid] > 0)
                episode_stats["reward"] = current_episode_reward[i].item()
                if actions[i][0].cpu().detach().tolist() == 0:
                    called_stop = True

                # if infos[i]["collisions"] == 0:
                    # final_input_arr = np.vstack((final_input_arr, input_arr[2:-1, :]))
                    # final_labels_arr = np.vstack((final_labels_arr, labels_arr[2:-1,:]))
                # final_input_arr = np.vstack((final_input_arr, input_arr[2:-1, :]))
                # final_labels_arr = np.vstack((final_labels_arr, create_traj_labels(input_arr[2:, :])))

                print(final_input_arr.ndim)
                if final_input_arr.ndim > 1:
                    print("Final Shape: {}".format(final_input_arr[2:-1, :].shape))
                    input_arr_embed, input_arr_oneHot = create_input_trajectory(final_input_arr[2:-1, :])
                    final_labels_arr = create_labels_trajectory(tmp_labels_arr[2:-1, :])
                    if args.save_traj:
                        save_trajectory(input_arr_embed, datasplit, traj_dir, traj_ctr, 'input', embed_type="embed")
                        save_trajectory(input_arr_oneHot, datasplit, traj_dir, traj_ctr, 'input', embed_type="oneHot")
                        save_trajectory(final_labels_arr, datasplit, traj_dir, traj_ctr, 'labels', embed_type="")
                        traj_ctr +=1

                print("# Actions: {}".format(num_actions))
                print("# Collisions: {}".format(infos[i]["collisions"]["count"]))
                print("Success: {}".format(episode_stats["success"]))
                print("Agent Episode Distance: {}".format(infos[i]['episode_distance']['agent_episode_distance'])) #TODO
                print("Final Distance to Goal: {}".format(infos[i]['episode_distance']['goal_distance'])) #TODO
                print("SPL: {}".format(episode_stats[metric_uuid]))
                print("Soft SPL: {}".format(infos[i]["softspl"]))
                print("Called Stop: {}".format(called_stop))

                current_episode_reward[i] = 0
                ## not logging collisions
                final_input_arr = np.array([0, 0, 0, 0])
                ## if logging collisions
                # input_arr = np.array([0, 0, 0, 0, 0])
                # final_input_arr = np.array([0, 0, 0, 0, 0])
                tmp_labels_arr = np.array([0, 0, 0])
                prev_base_state = [0, 0, 0]
                num_actions = 0
                print_once = True
                called_stop = False

                # use scene_id + episode_id as unique id for storing stats
                stats_episodes[
                    (
                        current_episodes[i].scene_id,
                        current_episodes[i].episode_id,
                    )
                ] = episode_stats

                if len(config.VIDEO_OPTION) > 0:
                    metric_value = episode_stats[metric_uuid]
                    video_name = (
                        f"episode_{current_episodes[i].episode_id}"
                        f"_{metric_name}_{metric_value:.2f}"
                    )
                    images_to_video(
                        rgb_frames[i], config.VIDEO_DIR, video_name
                    )

                    rgb_frames[i] = []

                print("Episodes finished: {}".format(len(stats_episodes)))

            # episode continues
            elif len(config.VIDEO_OPTION) > 0:
                frame = observations_to_image(observations[i], infos[i])
                rgb_frames[i].append(frame)

        # pausing self.envs with no new episode
        if len(envs_to_pause) > 0:
            state_index = list(range(envs.num_envs))
            for idx in reversed(envs_to_pause):
                state_index.pop(idx)
                envs.pause_at(idx)

            # indexing along the batch dimensions
            test_recurrent_hidden_states = test_recurrent_hidden_states[
                :, state_index
            ]
            not_done_masks = not_done_masks[state_index]
            current_episode_reward = current_episode_reward[state_index]
            prev_actions = prev_actions[state_index]

            for k, v in batch.items():
                batch[k] = v[state_index]

            if len(config.VIDEO_OPTION) > 0:
                rgb_frames = [rgb_frames[i] for i in state_index]

    aggregated_stats = dict()
    for stat_key in next(iter(stats_episodes.values())).keys():
        aggregated_stats[stat_key] = sum(
            [v[stat_key] for v in stats_episodes.values()]
        )
    num_episodes = len(stats_episodes)

    episode_reward_mean = aggregated_stats["reward"] / num_episodes
    episode_metric_mean = aggregated_stats[metric_uuid] / num_episodes
    episode_success_mean = aggregated_stats["success"] / num_episodes

    print(f"Number of episodes: {num_episodes}")
    print(f"Average episode reward: {episode_reward_mean:.6f}")
    print(f"Average episode success: {episode_success_mean:.6f}")
    print(f"Average episode {metric_uuid}: {episode_metric_mean:.6f}")

    print("Stats actions:", stats_actions)

    envs.close()


if __name__ == "__main__":
    main()
