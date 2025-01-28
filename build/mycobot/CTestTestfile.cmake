# CMake generated Testfile for 
# Source directory: /home/robotics/ros2_ws_scan/src/mycobot-ros2-fix/mycobot
# Build directory: /home/robotics/ros2_ws_scan/build/mycobot
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_mycobot "/usr/bin/python3" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/robotics/ros2_ws_scan/build/mycobot/test_results/mycobot/test_mycobot.catch2.xml" "--package-name" "mycobot" "--output-file" "/home/robotics/ros2_ws_scan/build/mycobot/ament_cmake_catch2/test_mycobot.txt" "--command" "/home/robotics/ros2_ws_scan/build/mycobot/test_mycobot" "-r junit" "-o /home/robotics/ros2_ws_scan/build/mycobot/test_results/mycobot/test_mycobot.catch2.xml")
set_tests_properties(test_mycobot PROPERTIES  LABELS "catch2" REQUIRED_FILES "/home/robotics/ros2_ws_scan/build/mycobot/test_mycobot" TIMEOUT "300" WORKING_DIRECTORY "/home/robotics/ros2_ws_scan/build/mycobot" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_catch2/cmake/ament_add_catch2_test.cmake;87;ament_add_test;/opt/ros/humble/share/ament_cmake_catch2/cmake/ament_add_catch2.cmake;84;ament_add_catch2_test;/home/robotics/ros2_ws_scan/src/mycobot-ros2-fix/mycobot/CMakeLists.txt;59;ament_add_catch2;/home/robotics/ros2_ws_scan/src/mycobot-ros2-fix/mycobot/CMakeLists.txt;0;")
