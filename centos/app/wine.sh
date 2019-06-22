#/bin/bash
set -euo pipefail
IFS=$'\n\t'

yum -y install wine
yum -y install cabextract
if [ ! -e "/usr/bin/winetricks" ]; then
	curl -skL http://winetricks.org/winetricks -o /usr/bin/winetricks
	chmod +x /usr/bin/winetricks
fi
