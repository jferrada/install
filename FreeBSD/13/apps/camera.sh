#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

pkg install -y v4l-utils v4l_compat webcamd pwcview

if [ -n "$SUDO_USER" ]; then
	pw groupmod operator -m "$SUDO_USER"
fi

sysrc -f /etc/rc.conf kld_list+=cuse
sysrc -f /etc/rc.conf webcamd_enable=YES
