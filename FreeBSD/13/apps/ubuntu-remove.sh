#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

pkg install -y git

directory=$(pwd)
tmp=$(mktemp -d)
cd "$tmp"
git clone https://github.com/keschort/linux-browser-installer.git
cd linux-browser-installer
sh linux-browser-installer chroot delete
sh linux-browser-installer clean
cd "$directory"
rm -f /usr/local/bin/linux-*
rm -rf "$tmp" /compat/ubuntu
