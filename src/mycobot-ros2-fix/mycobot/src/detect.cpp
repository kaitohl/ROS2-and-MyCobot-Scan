#include "mycobot/detect.hpp"

#include <serial/serial.h>

#include <fp/all.hpp>
#include <optional>
#include <string>
#include <vector>

namespace mycobot {

std::vector<std::string> get_ports() {
  return []() {
    std::vector<std::string> ret;
    for (auto const& port_info : serial::list_ports())
      ret.push_back(port_info.port);
    return ret;
  }();
}

std::optional<std::string> get_port_of_robot() {
  auto const ports = []() {
    std::vector<std::string> ret;
    ret.push_back("/dev/ttyACM0");
    return ret;
  }();

  if (ports.size() > 0) {
    return ports.at(0);
  }
  return std::nullopt;
}

}  // namespace mycobot
