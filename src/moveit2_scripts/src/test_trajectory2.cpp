#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"
#include <vector>
#include <string>
#include <sstream>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <moveit_msgs/msg/display_robot_state.hpp>
#include <moveit_msgs/msg/display_trajectory.hpp>
#include <geometry_msgs/msg/pose.hpp>

static const rclcpp::Logger LOGGER = rclcpp::get_logger("move_group_demo");

class RobotController : public rclcpp::Node {
private:
  std::unique_ptr<moveit::planning_interface::MoveGroupInterface> move_group;
  rclcpp::Subscription<std_msgs::msg::String>::SharedPtr subscription_;

public:
  RobotController() : Node("robot_controller", rclcpp::NodeOptions().automatically_declare_parameters_from_overrides(true)) {
    subscription_ = this->create_subscription<std_msgs::msg::String>(
      "position_topic", 10, std::bind(&RobotController::positionCallback, this, std::placeholders::_1));
  }

  void initialize() {
    std::string PLANNING_GROUP = "arm_group";
    move_group = std::make_unique<moveit::planning_interface::MoveGroupInterface>(shared_from_this(), PLANNING_GROUP);
  }

  void positionCallback(const std_msgs::msg::String::SharedPtr msg) {
    RCLCPP_INFO(this->get_logger(), "Received message: '%s'", msg->data.c_str());

    std::vector<float> position = parsePosition(msg->data);
    if (position.size() == 3) {
      RCLCPP_INFO(this->get_logger(), "Moving to position - X: %f, Y: %f, Z: %f", position[0], position[1], position[2]);
      moveToPosition(position);
    } else {
      RCLCPP_ERROR(this->get_logger(), "Received position string in incorrect format");
    }
  }

  std::vector<float> parsePosition(const std::string& position_str) const {
    std::vector<float> position;
    std::stringstream ss(position_str);
    std::string item;
    while (std::getline(ss, item, ',')) {
      try {
        position.push_back(std::stof(item));
      } catch (const std::invalid_argument& e) {
        RCLCPP_ERROR(this->get_logger(), "Invalid argument: %s", e.what());
        return {};
      } catch (const std::out_of_range& e) {
        RCLCPP_ERROR(this->get_logger(), "Out of range: %s", e.what());
        return {};
      }
    }
    return position;
  }

  void moveToPosition(const std::vector<float>& position) {
    geometry_msgs::msg::Pose target_pose;
    target_pose.orientation.w = 0.0;
    target_pose.orientation.x = -0.2128;
    target_pose.orientation.y = 0.976;
    target_pose.orientation.z = 0.0;
    target_pose.position.x = position[0];
    target_pose.position.y = position[1];
    target_pose.position.z = position[2];
    move_group->setPoseTarget(target_pose);

    moveit::planning_interface::MoveGroupInterface::Plan my_plan;
    bool success = (move_group->plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);
    if (success) {
      RCLCPP_INFO(this->get_logger(), "Plan successful, moving to position.");
      move_group->move(); // Execute the plan
    } else {
      RCLCPP_ERROR(this->get_logger(), "Failed to plan to the position.");
    }
  }
};

int main(int argc, char* argv[]) {
  rclcpp::init(argc, argv);
  auto robot_controller = std::make_shared<RobotController>();
  robot_controller->initialize(); // Ensure MoveGroup is initialized after construction
  rclcpp::spin(robot_controller);
  rclcpp::shutdown();
  return 0;
}