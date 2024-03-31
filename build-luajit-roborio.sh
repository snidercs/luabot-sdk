export PATH="$HOME/wpilib/2024/roborio/bin:$PATH"

prefix="$1"
if [ -z "$1" ]; then
    prefix="$HOME/SDKs/luabot/roborio"
fi

cd luajit
make clean
make amalg HOST_CC="gcc -m32 -std=c99" \
    CROSS=arm-frc2024-linux-gnueabi- \
    XCFLAGS="-DLUAJIT_ENABLE_LUA52COMPAT=1" \
    BUILDMODE="static" \
    PREFIX="${prefix}"
make install PREFIX="${prefix}"
