#/bin/bash
#set -euo pipefail
IFS=$'\n\t'

printf "LANG=\"es_CL.utf8\"\nSYSFONT=\"True\"\n" > /etc/sysconfig/i18n
printf "KEYTABLE=\"es\"\nMODEL=\"pc105\"\nLAYOUT=\"es\"\nKEYBOARDENGINE=\"pc\"\nVARIANT=\"intl\"\n" > /etc/sysconfig/keyboard

#Repos
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm
yum -y install https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm

yum clean all && yum makecache && yum -y update

yum -y install yum-plugins-core
yum -y install git iftop iotop htop terminator vim-enhanced sed curl wget sudo
yum -y install aspell aspell-es hunspell hunspell-es

sh app/sshd.sh

reboot
