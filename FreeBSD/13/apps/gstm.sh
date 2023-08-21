#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

pkg install -y git setsid

bash $(dirname $(readlink -f $0))/ubuntu-install.sh

if [ ! -s '/usr/local/bin/gstm' ]; then
	uid="$(id -u "$SUDO_USER")"
	chroot /compat/ubuntu /bin/bash  -c 'apt install -y software-properties-common'
	chroot /compat/ubuntu /bin/bash  -c 'add-apt-repository -y ppa:dallen.wilson/ppa'
	chroot /compat/ubuntu /bin/bash  -c 'apt update'
	chroot /compat/ubuntu /bin/bash  -c 'apt install -y gstm'
	chroot /compat/ubuntu /bin/bash  -c "grep -q $SUDO_USER /etc/passwd || adduser -u $uid --disabled-password --gecos '' $SUDO_USER"
	[ ! -s '/usr/local/bin/gstm' ] && rm -f /usr/local/bin/gstm && ln -s /compat/ubuntu/usr/bin/gstm /usr/local/bin/gstm
	[ ! -s '/usr/local/share/applications/gstm.desktop' ] && cp -f /compat/ubuntu/usr/share/applications/gstm.desktop /usr/local/share/applications/
	mkdir -p /usr/share/pixmaps
	[ ! -s '/usr/share/pixmaps/gSTM.png' ] && cp -f /compat/ubuntu/usr/share/gstm/pixmaps/gSTM.png /usr/share/pixmaps/gSTM.png
	mkdir -p /usr/local/share/gstm/pixmaps/
	[ ! -s '/usr/local/share/gstm/pixmaps/gSTM.png' ] && cp -f /compat/ubuntu/usr/share/gstm/pixmaps/gSTM.png /usr/local/share/gstm/pixmaps/gSTM.png
fi

#if [ ! -s '/compat/ubuntu/usr/local/bin/gstm' ]; then
#	chroot /compat/ubuntu /bin/bash  -c 'apt install -y gcc make intltool libgtk-3-dev libxml2-dev libappindicator3-dev curl jq'
#	chroot /compat/ubuntu /bin/bash  -c 'curl -sL $(curl -sL https://api.github.com/repos/dallenwilson/gstm/releases/latest | jq -r ".assets[].browser_download_url") | tar xz'
#	chroot /compat/ubuntu /bin/bash  -c 'cd gstm-* && ./configure && make && make install'
#	chroot /compat/ubuntu /bin/bash  -c 'cd .. && rm -rf gstm-*'
#	[ ! -s '/usr/local/bin/gstm' ] && rm -f /usr/local/bin/gstm && ln -s /compat/ubuntu/usr/local/bin/gstm /usr/local/bin/gstm
#	[ ! -s '/usr/local/share/applications/gstm.desktop' ] && cp -f /compat/ubuntu/usr/local/share/applications/gstm.desktop /usr/local/share/applications/
#	mkdir -p /usr/share/pixmaps
#	[ ! -s '/usr/share/pixmaps/gSTM.png' ] && cp -f /compat/ubuntu/usr/local/share/pixmaps/gSTM.png /usr/share/pixmaps/gSTM.png
#	mkdir -p /usr/local/share/gstm/pixmaps/
#	[ ! -s '/usr/local/share/gstm/pixmaps/gSTM.png' ] && cp -f /compat/ubuntu/usr/local/share/gstm/pixmaps/gSTM.png /usr/local/share/gstm/pixmaps/gSTM.png
#fi


