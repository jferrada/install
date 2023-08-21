#/bin/bash
set -euo pipefail
IFS=$'\n\t'

user='root'

if [ -n "$SUDO_USER" ]; then
	user="$SUDO_USER"
fi

if [ ! -e "/etc/yum.repos.d/virtualbox.repo" ]; then
	cat repos/virtualbox.repo > /etc/yum.repos.d/virtualbox.repo
	yum clean all && yum -y makecache && yum -y update
fi

dnf install -y binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms qt5-qtx11extras libxkbcommon
dnf install -y VirtualBox-6.0

if groups "$user" | grep -q docker && [ "$user" != 'root' ]; then
	usermod -aG vboxusers "$user"
fi

/usr/lib/virtualbox/vboxdrv.sh setup
