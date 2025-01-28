#include <chrono>
#include <functional>
#include <memory>
#include <rclcpp/rclcpp.hpp>
#include <std_msgs/msg/string.hpp>

using namespace std::chrono_literals;

class PositionPublisher : public rclcpp::Node {
public:
    PositionPublisher() : Node("position_publisher") {
        // Only create the publisher to advertise the topic
        publisher_ = this->create_publisher<std_msgs::msg::String>("position_topic", 10);
    }

private:

    rclcpp::Publisher<std_msgs::msg::String>::SharedPtr publisher_;
};

int main(int argc, char * argv[]) {
    rclcpp::init(argc, argv);
    rclcpp::spin(std::make_shared<PositionPublisher>());
    rclcpp::shutdown();
    return 0;
}