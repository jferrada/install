#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

dnf -y groupinstall "KDE Plasma Workspaces" "base-x"
systemctl set-default graphical
systemctl enable sddm.service

dnf -y install ark
