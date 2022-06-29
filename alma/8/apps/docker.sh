#/bin/bash
#set -euo pipefail
IFS=$'\n\t'

dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf -y install docker-ce docker-ce-cli containerd.io

if [ -n "$SUDO_USER" ]; then
	if ! grep -q 'docker' /etc/group; then
		groupadd docker
	fi

	if groups "$SUDO_USER" | grep -q docker; then
		usermod -aG docker "$SUDO_USER"
	fi
fi

