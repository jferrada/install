#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

dnf -y install libreoffice-writer libreoffice-calc libreoffice-impress libreoffice-draw libreoffice-langpack-es
