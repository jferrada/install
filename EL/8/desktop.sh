#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ $EUID -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

bash apps/kde.sh
bash apps/google-chrome.sh
bash apps/compress.sh
bash apps/multimedia.sh
bash apps/java.sh
bash apps/samba.sh
bash apps/ohmyz.sh

dnf -y install podman
dnf -y install filezilla rclone qbittorrent

reboot
