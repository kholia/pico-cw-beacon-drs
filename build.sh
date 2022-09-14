#!/bin/bash

pushd .
mkdir -p ~/repos
cd ~/repos
git clone --recursive https://github.com/raspberrypi/pico-sdk.git

export PICO_SDK_PATH=~/repos/pico-sdk

popd

make clean
cmake -DPICO_BOARD=pico .
make
cp pio_blink.uf2 pio_blink_pico.uf2

make clean
make -f Makefile.PicoW
make -j8
mv pio_blink.uf2 pio_blink_pico_w.uf2
