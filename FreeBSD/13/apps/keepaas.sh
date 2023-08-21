#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

pkg install -y keepass curl jq

url="$(curl -s https://api.github.com/repos/kee-org/keepassrpc/releases/latest | jq -r '.assets[].browser_download_url' | grep 'plgx')"
plgx=$(basename $url)
curl -sL $url > /usr/local/share/keepass/$plgx

sed -i '' '/KeePass.exe/d' /usr/local/bin/keepass.sh
echo 'exec /usr/local/bin/mono --verify-all /usr/local/share/keepass/KeePass.exe --minimize "$@"' >> /usr/local/bin/keepass.sh


