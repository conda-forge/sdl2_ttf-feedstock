#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./external/freetype-2.9.1/builds/unix
cp $BUILD_PREFIX/share/gnuconfig/config.* .
sed -i -- "s|@prefix@|${PREFIX}|g" SDL2_ttf.pc.in
./configure --disable-sdltest --disable-dependency-tracking --prefix=${PREFIX} --with-sdl-prefix=${PREFIX}
make 
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
make check
fi
make install
