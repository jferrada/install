#/bin/bash
set -euo pipefail
IFS=$'\n\t'

dnf install -y tigervnc-server coreutils

if ! grep 'x0vncserver' "/home/$SUDO_USER/.profile"; then
	{
		echo ''
		echo '#VNC'
		echo 'if ! ps aux | grep -v grep | grep -q x0vncserver; then'
		echo '	nohup x0vncserver -display :0 -passwordfile ~/.vnc/passwd &> /tmp/x0vncserver.log &'
		echo 'fi'
	} >> /home/"$SUDO_USER"/.profile
fi

if [ -n "$SUDO_USER" ] && [ ! -e "/home/$SUDO_USER/.vnc/passwd" ]; then
	mkdir -p /home/"$SUDO_USER"/.vnc
	vncpasswd /home/"$SUDO_USER"/.vnc/passwd
	chmod 700 /home/"$SUDO_USER"/.vnc
	chmod 600 /home/"$SUDO_USER"/.vnc/*
	chown "$SUDO_USER.$SUDO_USER" -R /home/"$SUDO_USER"/.vnc
fi

