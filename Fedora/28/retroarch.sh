#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ $EUID -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

sh app/kde.sh
sh app/compress.sh
sh app/java.sh
sh app/adobe.sh
sh app/samba.sh
sh app/retroarch.sh
