#/bin/bash
set -euo pipefail
IFS=$'\n\t'

user='root'

if [ -n "$SUDO_USER" ]; then
	user="$SUDO_USER"
fi

dnf config-manager -y --add-repo=http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo

dnf install -y binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms qt5-qtx11extras libxkbcommon
dnf install -y VirtualBox-6.1

if groups "$user" | grep -q docker && [ "$user" != 'root' ]; then
	usermod -aG vboxusers "$user"
fi

/usr/lib/virtualbox/vboxdrv.sh setup
