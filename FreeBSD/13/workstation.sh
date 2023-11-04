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
sysrc -f /etc/rc.conf kld_list+=amdgpu
# For Intel: kld_list="i915kms"
#sysrc -f /etc/rc.conf kld_list+=i915kms
# For radeonkms: kld_list="radeonkms"
#sysrc -f /etc/rc.conf kld_list+=radeonkms

bash apps/camera.sh

sed -i '' '/hw.snd.default_unit=/d' /etc/sysctl.conf
echo 'hw.snd.default_unit=7' >> /etc/sysctl.conf

sysrc -f /etc/rc.conf webcamd_0_flags='-d ugen0.5'

bash apps/gstm.sh
bash apps/linux-browser-installer.sh chrome
bash apps/linux-browser-installer.sh ferdium

bash apps/compress.sh
bash apps/java.sh
bash apps/keepaas.sh
bash apps/libreoffice.sh
bash apps/ohmyz.sh
bash apps/samba.sh
bash apps/vim.sh

pkg install -y git-crypt moreutils rclone

if [ -n "$SUDO_USER" ]; then
	tmp=$(mktemp -d)
	crontab -l -u "$SUDO_USER" > "$tmp/crontab"
	sed -i '' '/rclone-dropbox.sh/d' "$tmp/crontab"
	echo "* * * * * /usr/home/$SUDO_USER/scripts/rclone-dropbox.sh >> /tmp/rclone-dropbox.log 2>&1" >> "$tmp/crontab"
	crontab -u "$SUDO_USER" "$tmp/crontab"
	rm -rf "$tmp"
fi

pkg install -y qmmp-qt6

reboot

