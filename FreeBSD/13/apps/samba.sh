#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

pkg install -y samba413

echo "[global]
    workgroup = WORKGROUP
    server string = Samba Server %v
    netbios name = $(hostname -s | tr '[:lower:]' '[:upper:]')
    security = user
    map to guest = bad user
    name resolve order = bcast host
    dns proxy = no
    bind interfaces only = yes

[homes]
   comment = Home Directories
   browseable = no
   read only = no
   create mask = 0700
   directory mask = 0700
   valid users = %S
" > /usr/local/etc/smb4.conf

sysrc -f /etc/rc.conf samba_server_enable=YES
pgrep -qlf smbd || service samba_server start

if ! pdbedit -L | grep -qE "$SUDO_USER:"; then
	pdbedit -a -u "$SUDO_USER"
fi




