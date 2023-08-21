#/bin/bash
IFS=$'\n\t'

if [ -n "$SUDO_USER" ]; then
	user="$SUDO_USER"
else
	user='root'
fi

dnf remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine

dnf -y install dnf-plugins-core

dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

dnf install -y docker-ce docker-ce-cli containerd.io docker-compose

if ! grep -q 'docker' /etc/group; then
	groupadd docker
fi

if groups "$user" | grep -q docker && [ "$user" != 'root' ]; then
	usermod -aG docker "$user"
fi

systemctl start docker
systemctl enable docker
