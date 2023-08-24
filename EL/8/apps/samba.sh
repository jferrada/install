#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

dnf -y install samba samba-client cifs-utils

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
" > /etc/samba/smb.conf

systemctl start smb
systemctl enable smb

firewall-cmd --add-service=samba --permanent
firewall-cmd --reload

if ! pdbedit -L | grep -qE "$SUDO_USER:"; then
	smbpasswd -a "$SUDO_USER"
fi




