#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ $EUID -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 2
fi

sh app/kde.sh
sh app/compress.sh
sh app/java.sh
sh app/wine.sh
sh app/virtualbox.sh
sh app/google-chrome.sh
sh app/adobe.sh
sh app/samba.sh
sh app/docker.sh
sh app/x2go.sh
sh app/autologin.sh
