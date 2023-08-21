#/bin/bash
set -euo pipefail
IFS=$'\n\t'

apt install -y wine64
apt install -y cabextract
apt install -y ttf-mscorefonts-installer
if [ ! -e "/usr/bin/winetricks" ]; then
	curl -skL http://winetricks.org/winetricks -o /usr/bin/winetricks
	chmod +x /usr/bin/winetricks
fi
