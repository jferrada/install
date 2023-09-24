#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

dnf install -y keepass curl jq

url="$(curl -s https://api.github.com/repos/kee-org/keepassrpc/releases/latest | jq -r '.assets[].browser_download_url' | grep 'plgx')"
plgx=$(basename $url)
curl -sL https://github.com/kee-org/keepassrpc/releases/download/v1.13.0/KeePassRPC.plgx > /usr/lib/keepass/$plgx

sed -i '/KeePass.exe/d' /bin/keepass
echo 'exec /usr/bin/mono --verify-all /usr/lib/keepass/KeePass.exe --minimize "$@"' >> /bin/keepass


