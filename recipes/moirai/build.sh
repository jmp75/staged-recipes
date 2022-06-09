#!/bin/bash
# Build moirai.

mkdir -v -p build
cd build

# May be needed for unit tests down the track?
export TERM=
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PREFIX/lib

# cmake -DCMAKE_CXX_COMPILER=g++ -DCMAKE_C_COMPILER=gcc -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_PREFIX_PATH=/usr/local -DCMAKE_MODULE_PATH=/usr/local/share/cmake/Modules/ -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON ..
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${PREFIX} -DBUILD_SHARED_LIBS=ON ../
make -j 2 install
# rm -rf ../build/ # not if we want to run the unit tests
