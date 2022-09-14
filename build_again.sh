#!/bin/bash

export PICO_SDK_PATH=~/repos/pico-sdk

make clean
git clean -fdx # can be dangerous!
cmake -DPICO_BOARD=pico .
make -j8
cp pio_blink.uf2 pio_blink_pico.uf2

git clean -fdx # can be dangerous!
make clean
make -f Makefile.PicoW
make -j8
mv pio_blink.uf2 pio_blink_pico_w.uf2
