import os
from launch import LaunchDescription
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory
import yaml  # Import the YAML library

def load_file_contents(file_path):
    with open(file_path, 'r') as file:
        return file.read()



def generate_launch_description():
    package_share_directory = get_package_share_directory('mycobot_280_description')

    robot_description_file = os.path.join(package_share_directory, 'urdf', 'mycobot_280.urdf')
    robot_description_semantic_file = os.path.join(package_share_directory, 'config', 'mycobot_280.srdf')
    kinematics_file = os.path.join(package_share_directory, 'config', 'kinematics.yaml')

    # Load file contents
    robot_description_content = load_file_contents(robot_description_file)
    robot_description_semantic_content = load_file_contents(robot_description_semantic_file)
    kinematics_content = load_file_contents(kinematics_file)

    # Parse the kinematics.yaml content into a Python dictionary
    kinematics_parameters = yaml.safe_load(kinematics_content)

    moveit_cpp_node = Node(
        package="moveit2_scripts",
        executable="test_trajectory2",
        name="test_trajectory2",
        output="screen",
        parameters=[
            {'robot_description': robot_description_content},
            {'robot_description_semantic': robot_description_semantic_content},
            {'robot_description_kinematics': kinematics_parameters},  # Pass the parsed dictionary
            {'use_sim_time': False},
        ],
    )

    return LaunchDescription([moveit_cpp_node]) # Parse the kinematics.yaml content into a Python dictionary
    