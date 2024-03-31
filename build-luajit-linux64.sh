
prefix="$1"
if [ -z "$1" ]; then
    prefix="$HOME/SDKs/luabot/linux64"
fi

cd luajit
make clean
make amalg \
    BUILDMODE="static" \
    XCFLAGS="-DLUAJIT_ENABLE_LUA52COMPAT=1" \
    PREFIX="${prefix}"
make install PREFIX="${prefix}"
