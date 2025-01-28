# myCobot on ROS 2

## Fixes

### Fix Compilation
During the compilation of the mycobot_hardware_interfaces package I encountered multiple issues. These problems were solved by modifying the includes, adapting the `CMakeLists.txt`, specifying the namespace of `CallbackReturn`, and changing method signatures of `read` and `write`.

**The error message I encountered:**

```bash
Starting >>> mycobot_hardware_interface
--- stderr: mycobot_hardware_interface                                     
In file included from /home/ra37rok/ros2_ws/src/mycobot/mycobot_hardware_interface/src/hardware_interface.cpp:1:
/home/ra37rok/ros2_ws/src/mycobot/mycobot_hardware_interface/include/mycobot_hardware_interface/hardware_interface.hpp:35:35: error: ‘hardware_interface::return_type mycobot::MyCobotHardwareInterface::read()’ marked ‘final’, but is not virtual
   35 |   hardware_interface::return_type read() final;
      |                                   ^~~~
/home/ra37rok/ros2_ws/src/mycobot/mycobot_hardware_interface/include/mycobot_hardware_interface/hardware_interface.hpp:36:35: error: ‘hardware_interface::return_type mycobot::MyCobotHardwareInterface::write()’ marked ‘final’, but is not virtual
   36 |   hardware_interface::return_type write() final;
      |                                   ^~~~~
/home/ra37rok/ros2_ws/src/mycobot/mycobot_hardware_interface/src/hardware_interface.cpp:37:1: error: ‘CallbackReturn’ does not name a type
   37 | CallbackReturn MyCobotHardwareInterface::on_init(
      | ^~~~~~~~~~~~~~
/home/ra37rok/ros2_ws/src/mycobot/mycobot_hardware_interface/src/hardware_interface.cpp:57:1: error: ‘CallbackReturn’ does not name a type
   57 | CallbackReturn MyCobotHardwareInterface::on_configure(
      | ^~~~~~~~~~~~~~
/home/ra37rok/ros2_ws/src/mycobot/mycobot_hardware_interface/src/hardware_interface.cpp:77:1: error: ‘CallbackReturn’ does not name a type
   77 | CallbackReturn MyCobotHardwareInterface::on_activate(
      | ^~~~~~~~~~~~~~
/home/ra37rok/ros2_ws/src/mycobot/mycobot_hardware_interface/src/hardware_interface.cpp:87:1: error: ‘CallbackReturn’ does not name a type
   87 | CallbackReturn MyCobotHardwareInterface::on_deactivate(
      | ^~~~~~~~~~~~~~
In file included from /opt/ros/humble/include/class_loader/class_loader/class_loader_core.hpp:57,
                 from /opt/ros/humble/include/class_loader/class_loader/class_loader.hpp:55,
                 from /opt/ros/humble/include/pluginlib/pluginlib/class_list_macros.hpp:40,
                 from /home/ra37rok/ros2_ws/src/mycobot/mycobot_hardware_interface/src/hardware_interface.cpp:132:
/opt/ros/humble/include/class_loader/class_loader/meta_object.hpp: In instantiation of ‘B* class_loader::impl::MetaObject<C, B>::create() const [with C = mycobot::MyCobotHardwareInterface; B = hardware_interface::SystemInterface]’:
/opt/ros/humble/include/class_loader/class_loader/meta_object.hpp:216:7:   required from here
/opt/ros/humble/include/class_loader/class_loader/meta_object.hpp:218:12: error: invalid new-expression of abstract class type ‘mycobot::MyCobotHardwareInterface’
  218 |     return new C;
      |            ^~~~~
In file included from /home/ra37rok/ros2_ws/src/mycobot/mycobot_hardware_interface/src/hardware_interface.cpp:1:
/home/ra37rok/ros2_ws/src/mycobot/mycobot_hardware_interface/include/mycobot_hardware_interface/hardware_interface.hpp:15:7: note:   because the following virtual functions are pure within ‘mycobot::MyCobotHardwareInterface’:
   15 | class MyCobotHardwareInterface : public hardware_interface::SystemInterface {
      |       ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/ra37rok/ros2_ws/src/mycobot/mycobot_hardware_interface/include/mycobot_hardware_interface/hardware_interface.hpp:3,
                 from /home/ra37rok/ros2_ws/src/mycobot/mycobot_hardware_interface/src/hardware_interface.cpp:1:
/opt/ros/humble/include/hardware_interface/system_interface.hpp:175:23: note:     ‘virtual hardware_interface::return_type hardware_interface::SystemInterface::read(const rclcpp::Time&, const rclcpp::Duration&)’
  175 |   virtual return_type read(const rclcpp::Time & time, const rclcpp::Duration & period) = 0;
      |                       ^~~~
/opt/ros/humble/include/hardware_interface/system_interface.hpp:186:23: note:     ‘virtual hardware_interface::return_type hardware_interface::SystemInterface::write(const rclcpp::Time&, const rclcpp::Duration&)’
  186 |   virtual return_type write(const rclcpp::Time & time, const rclcpp::Duration & period) = 0;
      |                       ^~~~~
gmake[2]: *** [CMakeFiles/mycobot_hardware_interface.dir/build.make:76: CMakeFiles/mycobot_hardware_interface.dir/src/hardware_interface.cpp.o] Error 1
gmake[1]: *** [CMakeFiles/Makefile2:137: CMakeFiles/mycobot_hardware_interface.dir/all] Error 2
gmake: *** [Makefile:146: all] Error 2
---
Failed   <<< mycobot_hardware_interface [7.43s, exited with code 2]
```

### Fix Port Detection
In the `./mycobot/src/detect.cpp` a hardcoded Vendor ID, Product ID and serial number was used to detect the correct port. These will probably differ from robot to robot so the correct port was not detected when running the `move_group.launch.py` script. Thus, we followed the ElephantRobotics MyCobot [documentation](https://docs.elephantrobotics.com/docs/gitbook-en/12-ApplicationBaseROS/12.1-ROS1/12.1.4-rivz%E4%BB%8B%E7%BB%8D%E5%8F%8A%E4%BD%BF%E7%94%A8/myCobot-280.html) and simply set the port to `/dev/ttyUSB0`. This did the trick and allowed us to launch rviz and moveit without problems.

## Setup
Note that before you can compile the nodes you have to clone these repositories into your `ros2_ws/src` folder:
- [catch2_ros](https://github.com/tylerjw/catch2_ros.git)
- [serial2_ros](https://github.com/tylerjw/serial) use the ros2 branch here!
- [fp](https://github.com/tylerjw/fp)

If you encounter an error when launching with the `move_group.launch.py` script, try fixing the problem by running `sudo chmod 666 /dev/ttyUSB0`. If you still encounter an error try changing `/dev/ttyUSB0` in `./mycobot/src/detect.cpp` to `/dev/ttyACM0`.

## Original Readme
[![CI](https://github.com/tylerjw/mycobot/actions/workflows/ci.yaml/badge.svg?branch=main)](https://github.com/tylerjw/mycobot/actions/workflows/ci.yaml?query=branch%3Amain)
[![Space Metric](https://tylerjw.testspace.com/spaces/163818/badge?token=bd849f419babd4db48503896319f4efc151781e5)](https://tylerjw.testspace.com/spaces/163818?utm_campaign=badge&utm_medium=referral&utm_source=test "Test Cases")
[![Code Coverage](https://codecov.io/gh/tylerjw/mycobot/branch/main/graph/badge.svg?token=W7uHKcY0ly)](https://codecov.io/gh/tylerjw/mycobot)
[![license](https://img.shields.io/github/license/tylerjw/mycobot)](https://github.com/tylerjw/mycobot/blob/main/LICENSE)
[![cpp](https://img.shields.io/badge/C%2B%2B-20-blue)](#)
[![ROS](https://img.shields.io/badge/ROS-galactic-blue)](#)
[![Released](https://img.shields.io/badge/Released-no!-red)](#)

* mycobot - C++ interface to MyCobot
* mycobot_280_description - Configs and launch files for running MoveIt with MyCobot 280
* mycobot_hardware_interface - ros2_control hardware interface for mycobot

```bash
ros2 launch mycobot_280_description move_group.launch.py
```

## References

* [pymocobot](https://github.com/elephantrobotics/pymycobot) - Python interface to MyCobot
* [mycobot_ros](https://github.com/elephantrobotics/mycobot_ros) - ROS 1 MyCobot Packages
* [myCobot Docs](https://docs.elephantrobotics.com/docs/myCobot-en/) - myCobot-Gitbook
* [Purchase a myCobot](https://www.elephantrobotics.com/en/mycobot-en/) - Elephant Robotics
