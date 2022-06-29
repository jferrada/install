#/bin/bash
set -euo pipefail
IFS=$'\n\t'

dnf -y install wine
dnf -y install cabextract

if [ ! -e "/usr/bin/winetricks" ]; then
	curl -skL http://winetricks.org/winetricks -o /usr/bin/winetricks
	chmod +x /usr/bin/winetricks
fi

if ! rpm -qa | grep msttcore-fonts-installer; then
	rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
fi
