#/bin/bash
set -euo pipefail
IFS=$'\n\t'

user='root'

if [ -n "$SUDO_USER" ]; then
	user="$SUDO_USER"
fi

dnf config-manager -y --add-repo=https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo

dnf install -y binutils kernel-devel kernel-headers libgomp make patch gcc glibc-headers glibc-devel dkms
dnf install -y VirtualBox-7.0

if groups "$user" | grep -q docker && [ "$user" != 'root' ]; then
	usermod -aG vboxusers "$user"
fi

/usr/lib/virtualbox/vboxdrv.sh setup
