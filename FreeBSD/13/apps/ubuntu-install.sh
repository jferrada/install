#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

pkg install -y git

if [ ! -f /compat/ubuntu/etc/os-release ]; then
	directory=$(pwd)
	tmp=$(mktemp -d)
	cd "$tmp"
	git clone https://github.com/keschort/linux-browser-installer.git
	cd linux-browser-installer
	sh linux-browser-installer chroot create
	sh linux-browser-installer chroot upgrade
	cd "$directory"
	rm -rf "$tmp"
fi



