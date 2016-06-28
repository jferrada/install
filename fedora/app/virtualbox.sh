#/bin/bash

if [ -n "$SUDO_USER" ]; then
	user="$SUDO_USER"
else
	user='root'
fi

dnf -y install kernel-devel kernel-headers dkms gcc
dnf -y install VirtualBox
usermod -aG vboxusers $user
