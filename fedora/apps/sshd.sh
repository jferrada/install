#/bin/bash
set -euo pipefail
IFS=$'\n\t'

dnf -y install openssh-server
systemctl start sshd
systemctl enable sshd

if [ -n "$SUDO_USER" ]; then
	mkdir -p /home/"$SUDO_USER"/.ssh
	cat ../common/ssh/key >  /home/"$SUDO_USER"/.ssh/authorized_keys
	chmod 700 /home/"$SUDO_USER"/.ssh
	chmod 600 /home/"$SUDO_USER"/.ssh/*
	chown "$SUDO_USER.$SUDO_USER" -R /home/"$SUDO_USER"/.ssh
fi
