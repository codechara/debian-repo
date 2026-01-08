LINUX_TAG := lf-6.6.52-2.2.2
LINUX_GIT := https://github.com/nxp-imx/linux-imx
CROSS_COMPILE := arm-linux-gnueabi-
NPROC := $(shell nproc)

make_linux := make O=out ARCH=arm SUBARCH=arm CROSS_COMPILE=$(CROSS_COMPILE)

.PHONY: all prepare build package defconfig menuconfig fitImage
all: build package

prepare: output source defconfig

output:
	mkdir output
	mkdir output/linux

source: 
	git clone $(LINUX_GIT) --depth=1 -b $(LINUX_TAG) source
	git apply --directory=source files/patches/*

defconfig:
	cd source; $(make_linux) imx_v7_defconfig
	cat files/extra-config >> source/out/.config
	cd source; $(make_linux) olddefconfig

menuconfig:
	cd source; $(make_linux) menuconfig

build:
	cd source; $(make_linux) -j$(NPROC)
	cp source/out/arch/arm/boot/zImage source/out/arch/arm/boot/dts/nxp/imx/imx6ull-gtw360.dtb output

fitImage:
	cp files/fitImage.dts output
	cd output; dtc -I dts -O dtb fitImage.dts -o fitImageA
	cp output/fitImageA output/fitImageB

package: fitImage
	rm -rf output/linux/*
	cp -r files/DEBIAN output/linux
	cd output; mkdir linux/boot; cp fitImage[A-B] linux/boot
	cd source; $(make_linux) INSTALL_MOD_PATH=../../output/linux modules_install
	dpkg-deb --build output/linux output/linux.deb
