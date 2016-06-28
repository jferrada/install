#/bin/bash

if [ $EUID -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

sh app/kde.sh
sh app/compress.sh
sh app/multimedia.sh
sh app/java.sh
sh app/libreoffice-kde.sh
sh app/chat.sh

#Impresoras/Escáneres
dnf -y install python-qt4 hplip hplip-gui libsane-hpaio simple-scan

sh app/internet.sh
sh app/wine.sh
sh app/virtualbox.sh
sh app/google-chrome.sh
sh app/adobe.sh
sh app/samba.sh
sh app/sshd.sh
sh app/docker.sh
sh app/rvm.sh
sh app/telegram.sh
sh app/ohmyz.sh
sh app/dropbox.sh

#Chef
gem install chef chefspec chefspec-coveragereports foodcritic knife-spec knife-softlayer knife-spork rubocop

#RPM
#dnf -y install /home/jferrada/RPM/nxclient-*

#LAN
dnf -y install luma tomboy subversion

#Others
dnf -y install keepass ShellCheck
