#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

pkg install -y kde5 plasma5-sddm-kcm kio-gdrive sddm xorg
sysrc -f /etc/rc.conf dbus_enable=YES
pgrep -qlf dbus || service dbus start
sysrc -f /etc/rc.conf sddm_enable=YES
pgrep -qlf dbus || service sddm start
