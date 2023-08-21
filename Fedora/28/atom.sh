#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ $EUID -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

sh app/lxde.sh
sh app/compress.sh
sh app/java.sh
sh app/google-chrome.sh
sh app/adobe.sh
sh app/docker.sh
sh app/x2go.sh
