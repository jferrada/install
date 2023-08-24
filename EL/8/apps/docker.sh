#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

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
