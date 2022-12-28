#/bin/bash
set -euo pipefail
IFS=$'\n\t'

dnf install intltool gtk3-devel libxml2-devel
url=$(curl -sL https://api.github.com/repos/dallenwilson/gstm/releases/latest | jq -r '.assets[].browser_download_url')
curl -ksL "$url" | tar xz
cd gstm-*
./configure && make && make install
cd ..
rm -rf gstm-*
