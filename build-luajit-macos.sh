#!/bin/bash

export MACOSX_DEPLOYMENT_TARGET=10.12

host_arch="$1"
if [ -z "$host_arch" ]; then
    host_arch=$(arch)
fi

ljdir="$(pwd)/luajit"

sdkdir="$2"
if [ -z "$host_arch" ]; then
    sdkdir="${HOME}/SDKs/luabot"
fi

prefix="${sdkdir}/macos-${host_arch}"

cd "$ljdir"
set -ex

### Build for host machine
make clean
make amalg CC="clang -arch $host_arch -std=c99" \
    BUILDMODE="static" \
    XCFLAGS="-DLUAJIT_ENABLE_LUA52COMPAT=1" \
    PREFIX="${prefix}"
make install PREFIX="${prefix}"
make clean
