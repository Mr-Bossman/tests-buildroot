#/bin/bash
modprobe configfs
modprobe nvmet-tcp
modprobe nvme-fabrics
mount -t configfs configfs /sys/kernel/config/
mount -t debugfs none /sys/kernel/debug
mkdir /sys/kernel/config/nvmet/subsystems/mysubsystem
# echo 1 > /sys/kernel/config/nvmet/subsystems/mysubsystem/attr_cqt
echo 1 > /sys/kernel/config/nvmet/subsystems/mysubsystem/attr_allow_any_host
mkdir /sys/kernel/config/nvmet/subsystems/mysubsystem/namespaces/10
echo -n /dev/nvme0n1 > /sys/kernel/config/nvmet/subsystems/mysubsystem/namespaces/10/device_path
echo 1 > /sys/kernel/config/nvmet/subsystems/mysubsystem/namespaces/10/enable

ip a add 192.168.11.22/16 dev eth0
ip a add 192.168.12.22/16 dev eth0

mkdir /sys/kernel/config/nvmet/ports/1
echo 192.168.11.22 > /sys/kernel/config/nvmet/ports/1/addr_traddr
echo tcp > /sys/kernel/config/nvmet/ports/1/addr_trtype
echo 4420 > /sys/kernel/config/nvmet/ports/1/addr_trsvcid
echo ipv4 > /sys/kernel/config/nvmet/ports/1/addr_adrfam
ln -s /sys/kernel/config/nvmet/subsystems/mysubsystem /sys/kernel/config/nvmet/ports/1/subsystems/

mkdir /sys/kernel/config/nvmet/ports/2
echo 192.168.12.22 > /sys/kernel/config/nvmet/ports/2/addr_traddr
echo tcp > /sys/kernel/config/nvmet/ports/2/addr_trtype
echo 4420 > /sys/kernel/config/nvmet/ports/2/addr_trsvcid
echo ipv4 > /sys/kernel/config/nvmet/ports/2/addr_adrfam
ln -s /sys/kernel/config/nvmet/subsystems/mysubsystem /sys/kernel/config/nvmet/ports/2/subsystems/

nvme connect -t tcp -a 192.168.11.22 -s 4420 -n mysubsystem
nvme connect -t tcp -a 192.168.12.22 -s 4420 -n mysubsystem
