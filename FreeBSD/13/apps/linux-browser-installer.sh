#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

case "$1" in
	brave|chrome|edge|vivaldi|opera|ferdium)
		;;
	*)
		echo "Solo soporta los navegadores brave, chrome, edge, vivaldi, opera y ferdium" 1>&2
		exit 1
		;;
esac

pkg install -y git

sh $(dirname $(readlink -f $0))/ubuntu-install.sh

if [ ! -s "/compat/ubuntu/bin/$1" ]; then
	directory=$(pwd)
	tmp=$(mktemp -d)
	cd "$tmp"
	git clone https://github.com/keschort/linux-browser-installer.git
	cd linux-browser-installer
	sh linux-browser-installer install "$1"
	cd "$directory"
	rm -rf "$tmp"
fi
