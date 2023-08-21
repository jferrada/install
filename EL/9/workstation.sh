#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ $EUID -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

sh apps/kde.sh
sh apps/google-chrome.sh
sh apps/hamsket.sh
sh apps/compress.sh
sh apps/multimedia.sh
sh apps/java.sh
sh apps/libreoffice.sh
sh apps/virtualbox.sh
sh apps/samba.sh

dnf -y install podman

sh apps/jq.sh

dnf -y install subversion git

dnf -y install git-crypt moreutils jq bc curl procps-ng which patch libyaml-devel glibc-headers autoconf gcc-c++ glibc-devel patch readline-devel zlib-devel libffi-devel openssl-devel make bzip2 automake libtool bison sqlite-devel sudo

sh apps/gstm.sh

dnf -y install filezilla zsh qmmp qbittorrent keepass remmina 'remmina-plugins-*'
