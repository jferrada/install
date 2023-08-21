#/bin/bash
set -euo pipefail
IFS=$'\n\t'

printf "LANG=\"es_CL.utf8\"\nSYSFONT=\"True\"\n" > /etc/sysconfig/i18n
printf "KEYTABLE=\"es\"\nMODEL=\"pc105\"\nLAYOUT=\"es\"\nKEYBOARDENGINE=\"pc\"\nVARIANT=\"intl\"\n" > /etc/sysconfig/keyboard

#Repos
dnf -y install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf -y install http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf clean all && dnf makecache && dnf update -y --best --allowerasing && dnf -y autoremove

dnf -y install dnf-plugins-core
dnf -y install net-tools rsync git iftop iotop htop terminator vim-enhanced sed curl wget sudo
dnf -y install aspell aspell-es hunspell hunspell-es
dnf -y install chromium

if rpm -qa | grep ^firefox; then
	dnf -y remove firefox*
fi

sh apps/sshd.sh

reboot
