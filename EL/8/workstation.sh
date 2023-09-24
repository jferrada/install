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

bash apps/libreoffice.sh
bash apps/virtualbox.sh
bash apps/wine.sh

bash apps/Ferdium.sh
bash apps/gstm.sh

#Impresoras/Escáneres
dnf -y install epson-inkjet-printer-escpr simple-scan
bash apps/naps2.sh

dnf -y install podman

dnf -y install subversion git git-crypt moreutils jq bc curl procps-ng which patch libyaml-devel glibc-headers autoconf gcc-c++ glibc-devel patch readline-devel zlib-devel libffi-devel openssl-devel make bzip2 automake libtool bison sqlite-devel sudo

dnf -y install filezilla rclone qmmp qbittorrent keepass remmina 'remmina-plugins-*'

bash apps/google-cloud-cli.sh

reboot
