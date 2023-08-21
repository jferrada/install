#/bin/bash
dnf -y install wine
dnf -y install cabextract
if [ ! -e "/usr/bin/winetricks" ]; then
	curl -skL http://winetricks.org/winetricks -o /usr/bin/winetricks
	chmod +x /usr/bin/winetricks
fi
