#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ $EUID -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

sh apps/kde.sh
sh apps/compress.sh
sh apps/multimedia.sh
sh apps/java.sh
sh apps/libreoffice.sh

#Impresoras/Escáneres
dnf -y install simple-scan

sh apps/wine.sh
sh apps/virtualbox.sh
sh apps/adobe.sh
sh apps/samba.sh
sh apps/docker.sh
sh apps/jq.sh

dnf -y install subversion git terminator
dnf -y install keepass
dnf -y install remmina 'remmina-plugins-*'

sh apps/gstm.sh
