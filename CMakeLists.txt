cmake_minimum_required(VERSION 3.23)
project(ctui)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
set(CMAKE_TOOLCHAIN_FILE conan_toolchain.cmake)
set(CMAKE_BUILD_TYPE Release)
set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} ${CMAKE_BINARY_DIR})

add_executable(${PROJECT_NAME} src/main.cpp)

# ftxui
find_package(ftxui 5 REQUIRED)
target_link_libraries(${PROJECT_NAME}
  PRIVATE ftxui::screen
  PRIVATE ftxui::dom
  PRIVATE ftxui::component
)

# spdlog
find_package(spdlog REQUIRED)
target_link_libraries(${PROJECT_NAME}
  PRIVATE spdlog::spdlog
)