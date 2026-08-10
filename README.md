# Tests Buildroot
## Simple distro for testing various kernel patches and features.

### How to build:

```bash
git clone https://github.com/Mr-Bossman/tests-buildroot

cd tests-buildroot

git submodule update --init

make -C buildroot BR2_EXTERNAL=$PWD/ qemu_riscv64_virt_selftests_defconfig

make -C buildroot

buildroot/output/images/start-qemu.sh
```

#### Other configs
To list avalibale tests run `ls configs` once you chpuse the config configure and build with
```bash
make -C buildroot BR2_EXTERNAL=$PWD/ your_defconfig

make -C buildroot
```

More information on each config is located in board/qemu/*/readme.txt
