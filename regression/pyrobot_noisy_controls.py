#!/usr/bin/env python3

# Copyright (c) Facebook, Inc. and its affiliates.
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.


import attr
import habitat_sim.bindings as hsim
import magnum as mn
import numpy as np
import scipy.stats
from habitat_sim.agent.controls.controls import ActuationSpec, SceneNodeControl
from habitat_sim.registry import registry


@attr.s(auto_attribs=True)
class _TruncatedMultivariateGaussian:
    mean: np.array
    cov: np.array

    def __attrs_post_init__(self):
        self.mean = np.array(self.mean)
        self.cov = np.array(self.cov)
        if len(self.cov.shape) == 1:
            self.cov = np.diag(self.cov)

        assert (
            np.count_nonzero(self.cov - np.diag(np.diagonal(self.cov))) == 0
        ), "Only supports diagonal covariance"

    def sample(self, truncation=None):
        if truncation is not None:
            assert len(truncation) == len(self.mean)

        sample = np.zeros_like(self.mean)
        for i in range(len(self.mean)):
            stdev = np.sqrt(self.cov[i, i])
            mean = self.mean[i]
            # Always truncate to 3 standard deviations
            a, b = -3, 3

            if truncation is not None and truncation[i] is not None:
                trunc = truncation[i]
                if trunc[0] is not None:
                    a = max((trunc[0] - mean) / stdev, a)
                if trunc[1] is not None:
                    b = min((trunc[1] - mean) / stdev, b)

            sample[i] = scipy.stats.truncnorm.rvs(a, b, mean, stdev)

        return sample


@attr.s(auto_attribs=True)
class MotionNoiseModel:
    linear: _TruncatedMultivariateGaussian
    rotation: _TruncatedMultivariateGaussian


@attr.s(auto_attribs=True)
class ControllerNoiseModel:
    linear_motion: MotionNoiseModel
    rotational_motion: MotionNoiseModel


@attr.s(auto_attribs=True)
class RobotNoiseModel:
    ILQR: ControllerNoiseModel
    Proportional: ControllerNoiseModel
    Movebase: ControllerNoiseModel

    def __getitem__(self, key):
        return getattr(self, key)


r"""
Parameters contributed from PyRobot
https://pyrobot.org/
https://github.com/facebookresearch/pyrobot

Please cite PyRobot if you use this noise model
"""
pyrobot_noise_models = {
    "LoCoBot": RobotNoiseModel(
        ILQR=ControllerNoiseModel(
            linear_motion=MotionNoiseModel(
                _TruncatedMultivariateGaussian([0.014, 0.009], [0.006, 0.005]),
                _TruncatedMultivariateGaussian([0.008], [0.004]),
            ),
            rotational_motion=MotionNoiseModel(
                _TruncatedMultivariateGaussian([0.003, 0.003], [0.002, 0.003]),
                _TruncatedMultivariateGaussian([0.023], [0.012]),
            ),
        ),
        Proportional=ControllerNoiseModel(
            linear_motion=MotionNoiseModel(
                _TruncatedMultivariateGaussian([0.017, 0.042], [0.007, 0.023]),
                _TruncatedMultivariateGaussian([0.031], [0.026]),
            ),
            rotational_motion=MotionNoiseModel(
                _TruncatedMultivariateGaussian([0.001, 0.005], [0.001, 0.004]),
                _TruncatedMultivariateGaussian([0.043], [0.017]),
            ),
        ),
        Movebase=ControllerNoiseModel(
            linear_motion=MotionNoiseModel(
                _TruncatedMultivariateGaussian([0.074, 0.036], [0.019, 0.033]),
                _TruncatedMultivariateGaussian([0.189], [0.038]),
            ),
            rotational_motion=MotionNoiseModel(
                _TruncatedMultivariateGaussian([0.002, 0.003], [0.0, 0.002]),
                _TruncatedMultivariateGaussian([0.219], [0.019]),
            ),
        ),
    ),
    "LoCoBot-Lite": RobotNoiseModel(
        ILQR=ControllerNoiseModel(
            linear_motion=MotionNoiseModel(
                _TruncatedMultivariateGaussian([0.142, 0.023], [0.008, 0.008]),
                _TruncatedMultivariateGaussian([0.031], [0.028]),
            ),
            rotational_motion=MotionNoiseModel(
                _TruncatedMultivariateGaussian([0.002, 0.002], [0.001, 0.002]),
                _TruncatedMultivariateGaussian([0.122], [0.03]),
            ),
        ),
        Proportional=ControllerNoiseModel(
            linear_motion=MotionNoiseModel(
                _TruncatedMultivariateGaussian([0.135, 0.043], [0.007, 0.009]),
                _TruncatedMultivariateGaussian([0.049], [0.009]),
            ),
            rotational_motion=MotionNoiseModel(
                _TruncatedMultivariateGaussian([0.002, 0.002], [0.002, 0.001]),
                _TruncatedMultivariateGaussian([0.054], [0.061]),
            ),
        ),
        Movebase=ControllerNoiseModel(
            linear_motion=MotionNoiseModel(
                _TruncatedMultivariateGaussian([0.192, 0.117], [0.055, 0.144]),
                _TruncatedMultivariateGaussian([0.128], [0.143]),
            ),
            rotational_motion=MotionNoiseModel(
                _TruncatedMultivariateGaussian([0.002, 0.001], [0.001, 0.001]),
                _TruncatedMultivariateGaussian([0.173], [0.025]),
            ),
        ),
    ),
}


# @attr.s(auto_attribs=True)
# class PyRobotNoisyActuationSpec(ActuationSpec):
#     r"""Struct to hold parameters for pyrobot noise model

#     :property robot: Which robot to simulate noise for. Valid values are
#         ``LoCoBot`` and ``LoCoBot-Lite``.
#     :property controller: Which controller to simulate noise models for. Valid
#         values are ``ILQR``, ``Proportional``; ``Movebase ILQR`` is the
#         default.
#     :property noise_multiplier: Multiplier on the noise amount, useful for
#         ablating the effect of noise.

#     -   https://pyrobot.org/
#     -   https://github.com/facebookresearch/pyrobot

#     Please cite PyRobot if you use this noise model.
#     """
#     robot: str = attr.ib(default="LoCoBot")

#     @robot.validator
#     def check(self, attribute, value):
#         assert value in pyrobot_noise_models.keys(), f"{value} not a known robot"

#     controller: str = attr.ib(default="ILQR")

#     @controller.validator
#     def check(self, attribute, value):
#         assert value in [
#             "ILQR",
#             "Proportional",
#             "Movebase",
#         ], f"{value} not a known controller"

#     noise_multiplier: float = 1.0


_X_AXIS = 0
_Y_AXIS = 1
_Z_AXIS = 2


motion_type = "linear"
translate_amount= 0.25
rotate_amount = 0
multiplier = 1.0
model = pyrobot_noise_models["LoCoBot"]["Proportional"].linear_motion
# pyrobot_noise_models["Locobot"]["Proportional"].linear_motion

# scene_node = hsim.SceneNode
# transform = scene_node.transformation
# move_ax = -transform[_Z_AXIS].xyz
# perp_ax = transform[_X_AXIS].xyz

t_noise = []
r_noise = []
d_trav = []
for i in range(1000):
    if motion_type == "rotational":
        translation_noise = multiplier * model.linear.sample()
    else:
        # The robot will always move a little bit.  This has to be defined based on the intended actuation
        # as otherwise small rotation amounts would be invalid.  However, pretty quickly, we'll
        # get to the truncation of 3 sigma
        trunc = [(-0.95 * np.abs(translate_amount), None), None]

        translation_noise = multiplier * model.linear.sample(trunc)

    # + EPS to make sure 0 is positive.  We multiply by the sign of the translation
    # as otherwise forward would overshoot on average and backward would undershoot, while
    # both should overshoot
    translation_noise *= np.sign(translate_amount + 1e-8)
    #translation_noise[0] += translate_amount
    # scene_node.translate_local(
    #         move_ax * (translate_amount + translation_noise[0])
    #         + perp_ax * translation_noise[1]
    #     )

    if motion_type == "linear":
        rot_noise = multiplier * model.rotation.sample()
    else:
        # The robot will always turn a little bit.  This has to be defined based on the intended actuation
        # as otherwise small rotation amounts would be invalid.  However, pretty quickly, we'll
        # get to the truncation of 3 sigma
        trunc = [(-0.95 * np.abs(np.deg2rad(rotate_amount)), None)]

        rot_noise = multiplier * model.rotation.sample(trunc)

    # Same deal with rotation about + EPS and why we multiply by the sign
    rot_noise *= np.sign(rotate_amount + 1e-8)

    # scene_node.rotate_y_local(mn.Deg(rotate_amount) + mn.Rad(rot_noise))
    # scene_node.rotation = scene_node.rotation.normalized()
    t_noise.append(translation_noise)
    r_noise.append(rot_noise)
    d = np.sqrt((translate_amount + translation_noise[0])**2 + translation_noise[1]**2)
    d_trav.append(d)
    print(translation_noise, d, rot_noise)
t_noise_arr = np.array(t_noise)
r_noise_arr = np.array(r_noise)
d_trav_arr = np.array(d_trav)
avg_t = np.mean(t_noise_arr, axis=0)
avg_d = np.mean(d_trav_arr, axis=0)
avg_r = np.mean(r_noise_arr, axis=0)
max_d = np.amax(d_trav_arr, axis=0)
max_t = np.amax(t_noise_arr, axis=0)
min_t = np.amin(t_noise_arr, axis=0)
min_d = np.amin(d_trav_arr, axis=0)
max_r = np.amax(r_noise_arr, axis=0)
min_r = np.amin(r_noise_arr, axis=0)
print('avg: ', avg_t, max_t, min_t, avg_d, max_d, min_d, avg_r, max_r, min_r)
 

# @registry.register_move_fn(body_action=True)
# class PyrobotNoisyMoveBackward(SceneNodeControl):
#     def __call__(
#         self, scene_node: hsim.SceneNode, actuation_spec: PyRobotNoisyActuationSpec
#     ):
#         _noisy_action_impl(
#             scene_node,
#             -actuation_spec.amount,
#             0.0,
#             actuation_spec.noise_multiplier,
#             pyrobot_noise_models[actuation_spec.robot][
#                 actuation_spec.controller
#             ].linear_motion,
#             "linear",
#         )


# @registry.register_move_fn(body_action=True)
# class PyrobotNoisyMoveForward(SceneNodeControl):
#     def __call__(
#         self, scene_node: hsim.SceneNode, actuation_spec: PyRobotNoisyActuationSpec
#     ):
#         _noisy_action_impl(
#             scene_node,
#             actuation_spec.amount,
#             0.0,
#             actuation_spec.noise_multiplier,
#             pyrobot_noise_models[actuation_spec.robot][
#                 actuation_spec.controller
#             ].linear_motion,
#             "linear",
#         )


# @registry.register_move_fn(body_action=True)
# class PyrobotNoisyTurnLeft(SceneNodeControl):
#     def __call__(
#         self, scene_node: hsim.SceneNode, actuation_spec: PyRobotNoisyActuationSpec
#     ):
#         _noisy_action_impl(
#             scene_node,
#             0.0,
#             actuation_spec.amount,
#             actuation_spec.noise_multiplier,
#             pyrobot_noise_models[actuation_spec.robot][
#                 actuation_spec.controller
#             ].rotational_motion,
#             "rotational",
#         )


# @registry.register_move_fn(body_action=True)
# class PyrobotNoisyTurnRight(SceneNodeControl):
#     def __call__(
#         self, scene_node: hsim.SceneNode, actuation_spec: PyRobotNoisyActuationSpec
#     ):
#         _noisy_action_impl(
#             scene_node,
#             0.0,
#             -actuation_spec.amount,
#             actuation_spec.noise_multiplier,
#             pyrobot_noise_models[actuation_spec.robot][
#                 actuation_spec.controller
#             ].rotational_motion,
#             "rotational",
#         )

