# Custom builds of the [limine bootloader](https://github.com/limine-bootloader/limine)

This repository contains the files used to build limine releases for x86_64 uefi and aarch64 uefi,
the latest binary can be found at:
`https://ddn.stateprisma.com/limine.tar.gz`

# Building

First make sure you have podman installed, then just run `mkdir out && make run` to build, the output limine.tar.gz will be placed in the out folder.
