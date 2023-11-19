#/bin/bash
set -euo pipefail
IFS=$'\n\t'

printf "LANG=\"es_CL.utf8\"\nSYSFONT=\"True\"\n" > /etc/sysconfig/i18n
printf "KEYTABLE=\"es\"\nMODEL=\"pc105\"\nLAYOUT=\"es\"\nKEYBOARDENGINE=\"pc\"\nVARIANT=\"intl\"\n" > /etc/sysconfig/keyboard

#Repos
dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

dnf -y install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm
dnf -y install https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm

dnf config-manager --set-enabled powertools

dnf clean all && dnf makecache && dnf update -y --allowerasing && dnf -y autoremove

dnf -y install dnf-plugins-core
dnf -y install exfat-utils fuse fuse-exfat ntfs-3g ntfsprogs net-tools rsync git iftop iotop htop vim-enhanced sed curl wget sudo coreutils moreutils screen os-prober net-tools lm_sensors
dnf -y install aspell hunspell-es

grub2-mkconfig -o /boot/grub2/grub.cfg

reboot
