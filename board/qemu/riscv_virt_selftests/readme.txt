Run Linux in emulation with:

  qemu-system-riscv64 -M virt -bios buildroot/output/images/fw_jump.bin -kernel buildroot/output/images/Image -append "rootwait root=/dev/vda ro" -drive file=buildroot/output/images/rootfs.ext2,format=raw -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic -cpu rv64,v=on # qemu_riscv64_virt_selftests_defconfig

  qemu-system-riscv32 -M virt -bios buildroot/output/images/fw_jump.bin -kernel buildroot/output/images/Image -append "rootwait root=/dev/vda ro" -drive file=buildroot/output/images/rootfs.ext2,format=raw -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic -cpu rv32,v=on # qemu_riscv32_virt_selftests_defconfig

The login prompt will appear in the terminal that started Qemu
