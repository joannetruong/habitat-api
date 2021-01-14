from typing import List, Tuple, Union
import numpy as np
import quaternion
from scipy.spatial.transform import Rotation as R

def quaternion_to_list(q: np.quaternion):
    return q.imag.tolist() + [q.real]

def quaternion_from_coeffs(coeffs: np.ndarray) -> np.quaternion:
    r"""Creates a quaternions from coeffs in [x, y, z, w] format
    """
    quat = np.quaternion(0, 0, 0, 0)
    quat.real = coeffs[3]
    quat.imag = coeffs[0:3]
    return quat

def quaternion_rotate_vector(quat: np.quaternion, v: np.array) -> np.array:
    r"""Rotates a vector by a quaternion
    Args:
        quaternion: The quaternion to rotate by
        v: The vector to rotate
    Returns:
        np.array: The rotated vector
    """
    vq = np.quaternion(0, 0, 0, 0)
    vq.imag = v
    return (quat * vq * quat.inverse()).imag


def agent_state_target2ref() -> List:
    r"""Computes the target agent_state's position and rotation representation
    with respect to the coordinate system defined by reference agent's position and rotation.
    All rotations must be in [x, y, z, w] format.
    :param ref_agent_state: reference agent_state in the format of [position, rotation].
         The position and roation are from a common/global coordinate systems.
         They define a local coordinate system.
    :param target_agent_state: target agent_state in the format of [position, rotation].
        The position and roation are from a common/global coordinate systems.
        and need to be transformed to the local coordinate system defined by ref_agent_state.
    """
    ref_rotation = R.from_rotvec([0, 0, -2.169207457157459]).as_quat()
    target_rotation = R.from_rotvec([0, 0, -2.129207457157459]).as_quat()
    delta_x = 0.223
    delta_y = -0.168

    # convert to all rotation representations to np.quaternion
    if not isinstance(ref_rotation, np.quaternion):
        ref_rotation = quaternion_from_coeffs(ref_rotation)
    ref_rotation = ref_rotation.normalized()

    if not isinstance(target_rotation, np.quaternion):
        target_rotation = quaternion_from_coeffs(target_rotation)
    target_rotation = target_rotation.normalized()

    position_in_ref_coordinate = quaternion_rotate_vector(
        ref_rotation.inverse(), np.array([delta_x, delta_y, 0])
    )

    rotation_in_ref_coordinate = quaternion_to_list(
        ref_rotation.inverse() * target_rotation
    )

    return [position_in_ref_coordinate, rotation_in_ref_coordinate]


print(agent_state_target2ref())

