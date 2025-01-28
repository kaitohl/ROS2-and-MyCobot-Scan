from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='moveit2_scripts',  # Replace with your package name
            executable='position_publisher',  # Replace with the executable name, if different
            name='position_publisher'
        )
    ])