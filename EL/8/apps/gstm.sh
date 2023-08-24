#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

dnf install -y intltool gtk3-devel libxml2-devel libappindicator-gtk3-devel

if [ ! -e '/usr/local/bin/gstm' ]; then
	url=$(curl -sL https://api.github.com/repos/dallenwilson/gstm/releases/latest | jq -r '.assets[].browser_download_url')
	curl -ksL "$url" | tar xz
	cd gstm-*
	./configure && make && make install
	cd ..
	rm -rf gstm-*
fi

