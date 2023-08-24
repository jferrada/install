#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

rpm="$(curl -s https://api.github.com/repos/cyanfish/naps2/releases | jq -r '.[].assets[].browser_download_url ' | grep -E '.*-linux-x64\.rpm' | head -n1)"
dnf -y install "$rpm"
