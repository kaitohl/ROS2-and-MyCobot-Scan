# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/robotics/ros2_ws_scan/src/fmt

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/robotics/ros2_ws_scan/build/FMT

# Include any dependencies generated for this target.
include test/CMakeFiles/args-test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/args-test.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/args-test.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/args-test.dir/flags.make

test/CMakeFiles/args-test.dir/args-test.cc.o: test/CMakeFiles/args-test.dir/flags.make
test/CMakeFiles/args-test.dir/args-test.cc.o: /home/robotics/ros2_ws_scan/src/fmt/test/args-test.cc
test/CMakeFiles/args-test.dir/args-test.cc.o: test/CMakeFiles/args-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/robotics/ros2_ws_scan/build/FMT/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/args-test.dir/args-test.cc.o"
	cd /home/robotics/ros2_ws_scan/build/FMT/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/args-test.dir/args-test.cc.o -MF CMakeFiles/args-test.dir/args-test.cc.o.d -o CMakeFiles/args-test.dir/args-test.cc.o -c /home/robotics/ros2_ws_scan/src/fmt/test/args-test.cc

test/CMakeFiles/args-test.dir/args-test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/args-test.dir/args-test.cc.i"
	cd /home/robotics/ros2_ws_scan/build/FMT/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/robotics/ros2_ws_scan/src/fmt/test/args-test.cc > CMakeFiles/args-test.dir/args-test.cc.i

test/CMakeFiles/args-test.dir/args-test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/args-test.dir/args-test.cc.s"
	cd /home/robotics/ros2_ws_scan/build/FMT/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/robotics/ros2_ws_scan/src/fmt/test/args-test.cc -o CMakeFiles/args-test.dir/args-test.cc.s

# Object files for target args-test
args__test_OBJECTS = \
"CMakeFiles/args-test.dir/args-test.cc.o"

# External object files for target args-test
args__test_EXTERNAL_OBJECTS =

bin/args-test: test/CMakeFiles/args-test.dir/args-test.cc.o
bin/args-test: test/CMakeFiles/args-test.dir/build.make
bin/args-test: test/libtest-main.a
bin/args-test: libfmt.a
bin/args-test: test/gtest/libgtest.a
bin/args-test: test/CMakeFiles/args-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/robotics/ros2_ws_scan/build/FMT/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/args-test"
	cd /home/robotics/ros2_ws_scan/build/FMT/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/args-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/args-test.dir/build: bin/args-test
.PHONY : test/CMakeFiles/args-test.dir/build

test/CMakeFiles/args-test.dir/clean:
	cd /home/robotics/ros2_ws_scan/build/FMT/test && $(CMAKE_COMMAND) -P CMakeFiles/args-test.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/args-test.dir/clean

test/CMakeFiles/args-test.dir/depend:
	cd /home/robotics/ros2_ws_scan/build/FMT && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/robotics/ros2_ws_scan/src/fmt /home/robotics/ros2_ws_scan/src/fmt/test /home/robotics/ros2_ws_scan/build/FMT /home/robotics/ros2_ws_scan/build/FMT/test /home/robotics/ros2_ws_scan/build/FMT/test/CMakeFiles/args-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/args-test.dir/depend

