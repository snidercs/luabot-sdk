#!/bin/bash
set -e
./build-luajit-linux64.sh
./build-luajit-roborio.sh
./build-wpilib-linux64.sh
