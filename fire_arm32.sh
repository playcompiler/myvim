#!/bin/bash
#

export ARCH=arm
export CROSS_COMPILE=arm-none-linux-gnueabihf-
export PATH=/opt/tools/gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf/bin:$PATH

#make imx_v6_v7_defconfig
#make olddefconfig
#make MENUCONFIG_COLOR=mono menuconfig
#make imx6ull-14x14-evk-bak.dtb

#make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabihf- menuconfig
#make O=build -j32 zImage 
#make imx6ull-14x14-evk.dtb O=build
make modules O=build


#make O=build KBUILD_ABS_SRCTREE=1 ARCH=arm SUBARCH=imx COMPILED_SOURCE=1 cscope tags

