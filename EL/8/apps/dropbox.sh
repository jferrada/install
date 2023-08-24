#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

user='root'
if [ -n "$SUDO_USER" ]; then
	user="$SUDO_USER"
fi


if [ ! -s "/home/$SUDO_USER/.dropbox-dist/dropboxd" ]; then
	case "$user" in
		root )
			directory=$(pwd)
			cd "/root/" && curl -sL "https://www.dropbox.com/download?plat=lnx.$(uname -m)" | tar -xz
			cd "$directory"
			;;
		* )
			su -l "$SUDO_USER" -c "$(cd "/home/$SUDO_USER/" && curl -sL "https://www.dropbox.com/download?plat=lnx.$(uname -m)" | tar -xz)"
			;;
	esac
fi


[ ! -s '/usr/local/bin/dropbox' ] && curl -sL https://www.dropbox.com/download?dl=packages/dropbox.py > /usr/local/bin/dropbox && chmod +x /usr/local/bin/dropbox
