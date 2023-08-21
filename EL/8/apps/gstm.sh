#/bin/bash
set -euo pipefail
IFS=$'\n\t'

dnf install -y intltool gtk3-devel libxml2-devel libappindicator-gtk3-devel

if [ ! -e '/usr/local/bin/gstm' ]; then
	url=$(curl -sL https://api.github.com/repos/dallenwilson/gstm/releases/latest | jq -r '.assets[].browser_download_url')
	curl -ksL "$url" | tar xz
	cd gstm-*
	./configure && make && make install
	cd ..
	rm -rf gstm-*
fi
