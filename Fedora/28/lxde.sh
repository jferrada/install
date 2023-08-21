#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ $EUID -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

sh apps/lxde.sh
sh apps/compress.sh
sh apps/java.sh
sh apps/adobe.sh
sh apps/vnc.sh
