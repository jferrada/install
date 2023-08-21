#/bin/bash

set -euo pipefail
IFS=$'\n\t'

if [ $EUID -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

apt update -y && apt upgrade -y && apt -y autoremove

apt install -y fuse exfat-fuse exfat-utils ntfs-3g net-tools rsync git iftop iotop htop vim sed curl wget sudo coreutils moreutils screen os-prober net-tools
apt install -y manpages-es manpages-es-extra

bash apps/sshd.sh

reboot
