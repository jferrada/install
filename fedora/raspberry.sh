#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ $EUID -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

hostnamectl set-hostname raspberry

curl https://raw.githubusercontent.com/RPi-Distro/firmware-nonfree/master/brcm80211/brcm/brcmfmac43430-sdio.txt -o /lib/firmware/brcm/brcmfmac43430-sdio.txt

sh app/x2go.sh
sh app/docker.sh
