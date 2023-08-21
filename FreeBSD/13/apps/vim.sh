#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

pkg install -y vim

tmp=$(mktemp -d)
echo 'source /usr/local/share/vim/*/defaults.vim

set formatoptions-=cr
set clipboard=unnamedplus
set mouse=r' > "/$tmp/.vimrc"

[ ! -e /root/.vimrc ] && cp "/$tmp/.vimrc" /root/.vimrc

if [ -n "$SUDO_USER" ]; then
	[ ! -e /home/$SUDO_USER/.vimrc ] && cp "/$tmp/.vimrc" "/home/$SUDO_USER/.vimrc"
	chown -R "$SUDO_USER":"$SUDO_USER" "/home/$SUDO_USER/.vimrc"
fi

rm -rf "$tmp"
