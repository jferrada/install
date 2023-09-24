#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

bash apps/sshd.sh

pkg install -y desktop-installer

bash apps/kde.sh
bash apps/compress.sh
bash apps/java.sh
bash apps/libreoffice.sh
bash apps/ohmyz.sh
bash apps/samba.sh
bash apps/vim.sh

pkg install -y moreutils rclone chromium

reboot

