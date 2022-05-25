#!/bin/bash

dirlist="poky/build-zephyr-tools/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-zephyr-qemu/git-r0/git \
poky/build-zephyr-tools/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-zephyr-qemu/git-r0/git/capstone \
poky/build-zephyr-tools/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-zephyr-qemu/git-r0/git/dtc \
poky/build-zephyr-tools/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-zephyr-qemu/git-r0/git/slirp \
poky/build-zephyr-tools/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-zephyr-qemu/git-r0/git/tests/fp/berkeley-softfloat-3 \
poky/build-zephyr-tools/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-zephyr-qemu/git-r0/git/tests/fp/berkeley-testfloat-3 \
poky/build-zephyr-tools/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-zephyr-qemu/git-r0/git/ui/keycodemapdb"

for relativeDir in $dirlist; do
    git config --global --add safe.directory $PWD/$relativeDir
done		   
