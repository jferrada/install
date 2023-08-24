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
bash apps/libreoffice.sh
bash apps/naps2.sh

#Impresoras/Escáneres
dnf -y install simple-scan

bash apps/wine.sh
bash apps/virtualbox.sh
bash apps/samba.sh
bash apps/Ferdium.sh

dnf -y install podman

dnf -y install subversion git

dnf -y install git-crypt moreutils jq bc curl procps-ng which patch libyaml-devel glibc-headers autoconf gcc-c++ glibc-devel patch readline-devel zlib-devel libffi-devel openssl-devel make bzip2 automake libtool bison sqlite-devel sudo

bash apps/gstm.sh

dnf -y install filezilla zsh rclone epson-inkjet-printer-escpr qmmp qbittorrent keepass remmina 'remmina-plugins-*'

reboot
