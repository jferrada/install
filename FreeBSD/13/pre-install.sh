#!/usr/bin/env sh
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

freebsd-update fetch install

portsnap fetch
portsnap extract

pkg update && pkg upgrade

pkg install -y fusefs-ntfs fusefs-exfat fusefs-ext2 fusefs-lkl git iftop htop vim curl wget sudo jq bash zsh dsbmc-cli dsbmc dsbmd

sysrc -f /etc/rc.conf kld_list+=fusefs
sysrc -f /etc/rc.conf dsbmd_enable=YES
sysrc -f /etc/rc.conf ntpd_flags=-g
sysrc -f /boot/loader.conf autoboot_delay=3
sysrc -f /boot/loader.conf loader_logo=beastie
sysrc -f /boot/loader.conf tmpfs_load=YES
sysrc -f /boot/loader.conf aio_load=YES

sed -i '' '/vfs.usermount=/d' /etc/sysctl.conf
echo 'vfs.usermount=0' >> /etc/sysctl.conf

sed -i '' '/kern.sched.preempt_thresh=/d' /etc/sysctl.conf
echo 'kern.sched.preempt_thresh=224' >> /etc/sysctl.conf

sed -i '' '/hw.syscons.bell=/d' /etc/sysctl.conf
echo 'hw.syscons.bell=0' >> /etc/sysctl.conf

sed -i '' '/kern.ipc.shm_allow_removed=/d' /etc/sysctl.conf
echo 'kern.ipc.shm_allow_removed=1' >> /etc/sysctl.conf

sed -i '' 's/:lang=C.UTF-8:/:lang=es_ES.UTF-8:/' /etc/login.conf
cap_mkdb /etc/login.conf

bash apps/sshd.sh

reboot
