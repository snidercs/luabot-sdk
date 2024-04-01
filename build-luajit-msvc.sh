#!/bin/bash
set -e

here="$(pwd)"
prefix="${HOME}/SDKs/luabot/msvc"
ljpath="${here}/luajit"

mkdir -p "$prefix/include/luajit-2.1" "$prefix/lib"

# "clean" msvc luajit build
cd "${ljpath}" && \
    rm -rf src && \
    git checkout src
cd "${here}"

set -x

cd "${ljpath}/src"
../../../util/build-luajit-msvc.bat static
cd "${here}"

cp -f "${ljpath}/src/lua51.lib" "${prefix}/lib/"
headers="lua.h lualib.h luajit.h lua.hpp lauxlib.h luaconf.h"
for f in $headers; do
    cp -f "${ljpath}/src/${f}" "$prefix/include/luajit-2.1/"
done

# "clean" msvc luajit build
cd "${ljpath}" && \
    rm -rf src && \
    git checkout src
cd "${here}"
