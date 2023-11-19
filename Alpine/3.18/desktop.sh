#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

bash apps/kde.sh
bash apps/compress.sh
bash apps/java.sh
bash apps/libreoffice.sh
bash apps/ohmyz.sh
bash apps/vim.sh
bash apps/samba.sh

pkg install -y chromium vlc

reboot

