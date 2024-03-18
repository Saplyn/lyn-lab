#!/bin/bash

# if not in root dir, exit
if [ ! -f "CMakeLists.txt" ]; then
  echo "Run this script from the root directory of the project"
  echo "current directory: $(pwd)"
  exit 1
fi

# if `--fresh`, remove build dir
for arg in "$@"; do
  if [ "$arg" == "-f" ] || [ "$arg" == "--fresh" ]; then
    rm -rf build
  fi
done

# ensure build dir exists
if [ ! -d "build" ]; then
  mkdir build
fi

# actual build commands
conan install . --output-folder=build --build=missing
cmake -S . -B build

# if `--build`, build the project
for arg in "$@"; do
  if [ "$arg" == "-b" ] || [ "$arg" == "--build" ]; then
    cmake --build build
  fi
done
