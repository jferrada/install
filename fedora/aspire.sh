#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ $EUID -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

sh app/kde.sh
sh app/compress.sh
sh app/franz.sh
sh app/multimedia.sh
sh app/java.sh
sh app/libreoffice-kde.sh

#Impresoras/Escáneres
dnf -y install python-qt4 hplip hplip-gui libsane-hpaio simple-scan

sh app/wine.sh
sh app/virtualbox.sh
sh app/google-chrome.sh
sh app/adobe.sh
sh app/samba.sh
sh app/docker.sh
sh app/dropbox.sh
sh app/jsawk.sh

#LAN
dnf -y install tomboy subversion git
dnf -y install https://archive.fedoraproject.org/pub/fedora-secondary/releases/test/25_Alpha/Everything/aarch64/os/Packages/l/luma-3.0.7-7.fc25.noarch.rpm

#Others
dnf -y install keepass ShellCheck
dnf -y install gparted fedora-arm-installer

if rpm -qa | grep ^firefox; then
	dnf -y remove firefox*
fi


