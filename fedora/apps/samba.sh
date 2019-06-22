#/bin/bash
set -euo pipefail
IFS=$'\n\t'

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

smbpasswd -a "$SUDO_USER"
