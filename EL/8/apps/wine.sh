#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

dnf -y install wine
dnf -y install cabextract

if [ ! -e "/usr/bin/winetricks" ]; then
	curl -skL http://winetricks.org/winetricks -o /usr/bin/winetricks
	chmod +x /usr/bin/winetricks
fi

if ! rpm -qa | grep msttcore-fonts-installer; then
	rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
fi
