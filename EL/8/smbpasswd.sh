#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ $EUID -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

if ! pdbedit -L | grep -qE "$SUDO_USER:"; then
	smbpasswd -a "$SUDO_USER"
fi
