#/bin/bash
set -euo pipefail
IFS=$'\n\t'

apt install -y cifs-utils python-glade2 samba-common system-config-samba samba winbind

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

systemctl enable smbd.service
systemctl restart smbd.service

if ! pdbedit -L | grep -qE "$SUDO_USER:"; then
	smbpasswd -a "$SUDO_USER"
fi
