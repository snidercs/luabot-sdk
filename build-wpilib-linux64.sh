#!/bin/bash

set -e

prefix="$1"
if [ -z "$1" ]; then
    prefix="$HOME/SDKs/luabot/linux64"
fi

builddir="allwpilib/build-cmake"
rm -rf "${builddir}"
mkdir -p "${builddir}"

cd "${builddir}"

set -x
cmake -DWITH_JAVA=NO -DCMAKE_INSTALL_PREFIX="${prefix}" ..
make -j4 && make install
