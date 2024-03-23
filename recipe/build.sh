#!/bin/bash
set -ex

mkdir build
cd build

cmake -G Ninja \
    ${CMAKE_ARGS} \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DSDL2TTF_HARFBUZZ=ON \
    -DSDL2TTF_VENDORED=OFF \
    ..

cmake --build .
cmake --install .

# For backward compatibility with old builds of sdl2_ttf that linked with strangly-named
# version of the libraries, we define some symlinks, remove once the library is updated to sdl3
if [[ "${target_platform}" == osx-* ]]; then
    ln -s ${PREFIX}/lib/libSDL2_ttf-2.0.0.dylib ${PREFIX}/lib/libSDL2_ttf-2.0.2201.0.0.dylib
    ln -s ${PREFIX}/lib/libSDL2_ttf-2.0.0.dylib ${PREFIX}/lib/libSDL2_ttf-2.0.2001.2.0.dylib
    ln -s ${PREFIX}/lib/libSDL2_ttf-2.0.0.dylib ${PREFIX}/lib/libSDL2_ttf-2.0.2001.1.0.dylib
    ln -s ${PREFIX}/lib/libSDL2_ttf-2.0.0.dylib ${PREFIX}/lib/libSDL2_ttf-2.0.15.0.0.dylib
fi
