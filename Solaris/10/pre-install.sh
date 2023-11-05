#!/usr/bin/env sh
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

pkgadd -d http://get.opencsw.org/now
/opt/csw/bin/pkgutil -U
/opt/csw/bin/pkgutil -y -i pkgutil

/opt/csw/bin/pkgutil -y -i bash
/opt/csw/bin/pkgutil -y -i curl
/opt/csw/bin/pkgutil -y -i wget
/opt/csw/bin/pkgutil -y -i vim
/opt/csw/bin/pkgutil -y -i rsync
