# linux

This branch contains files for linux building like patches and extra configs, and debian packaging

## Building

For manual building, i recomment ubuntu/fedora and these packages to install:
```
tree build-essential libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf llvm bc gcc-arm-linux-gnueabi dpkg-dev arch-install-scripts device-tree-compiler
```

Then, run `make prepare` to prepare linux source code, dirs and apply patches. To build kernel and package it, run `make`. For menuconfig, run `make menuconfig`

## To Do
 - Make a proper flattened image tree
