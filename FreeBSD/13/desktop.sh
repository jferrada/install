#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

bash apps/sshd.sh
bash apps/kde.sh

pkg install -y drm-510-kmod
# For amdgpu:
#sysrc -f /etc/rc.conf kld_list+=amdgpu
# For Intel: kld_list="i915kms"
#sysrc -f /etc/rc.conf kld_list+=i915kms
# For radeonkms: kld_list="radeonkms"
#sysrc -f /etc/rc.conf kld_list+=radeonkms

bash apps/compress.sh
bash apps/java.sh
bash apps/libreoffice.sh
bash apps/ohmyz.sh
bash apps/vim.sh
bash apps/samba.sh

pkg install -y moreutils rclone chromium

reboot

