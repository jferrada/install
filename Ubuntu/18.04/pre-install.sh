#/bin/bash

set -euo pipefail
IFS=$'\n\t'

if [ $EUID -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

apt upgrade -y && apt upgrade -y && apt -y autoremove

apt install -y net-tools git iftop iotop htop terminator vim sed curl wget sudo rtl8812au-dkms
apt install -y manpages-es manpages-es-extra

bash apps/sshd.sh

reboot
