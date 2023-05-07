#!/bin/bash
#
export PATH=/opt/toolchains/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin:$PATH
export CROSS_COMPILE=aarch64-none-linux-gnu-
export ARCH=arm64

#make imx_imx8mm_evk_defconfig O=build 
#make imx_v8_defconfig O=build 
#make menuconfig O=build 

#make -j16 O=build

#NOTE: need modify tags.sh, 2 errors:
#1. all_kconfigs
#2. grep -K to sed
make O=build ARCH=arm64 SUBARCH=imx KBUILD_ABS_SRCTREE=1 COMPILED_SOURCE=1 cscope tags


