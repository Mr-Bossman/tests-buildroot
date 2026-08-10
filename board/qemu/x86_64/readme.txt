Run Linux in emulation with:

  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0" -serial stdio -net nic,model=virtio -net user -blockdev driver=null-co,node-name=nvm -device nvme,drive=nvm,serial=deadbeef # qemu_x86_64_ccr_defconfig

The login prompt will appear in the terminal that started Qemu
