# linux

This branch contains files for linux building like patches and extra configs, and debian packaging

## Building

For manual building, i recomment ubuntu/fedora and these packages to install:
```
tree build-essential libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf llvm bc gcc-arm-linux-gnueabi dpkg-dev arch-install-scripts device-tree-compiler
```

Then, you can use followed commands to do some things:
```sh
make prepare # Make some dirs, download sources, apply patches
make build # or just make, !!!root needed!!!. Builds kernel and package it to the deb. Also, you can set number of jobs used by kernel building through NPROC= (by default all jobs selected)
make menuconfig # to open kernel's menuconfig
make defconfig # reset config
make package # makes package. !!!Need root!!!
```

## To Do
 - Make a proper flattened image tree
