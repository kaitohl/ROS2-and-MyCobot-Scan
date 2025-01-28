from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='mycobot_280_description',  # Replace with your package name
            executable='move_robot.py',
            name='move_robot_node',
            output='screen',
        ),
    ])