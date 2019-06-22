#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ $EUID -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

bash apps/docker.sh
bash apps/samba.sh
bash apps/sshd.sh
bash apps/virtualbox.sh
bash apps/wine.sh
bash apps/vnc.sh

apt upgrade -y && apt upgrade -y && apt -y autoremove && reboot
