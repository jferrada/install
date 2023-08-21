#/bin/bash
IFS=$'\n\t'

if [ -n "$SUDO_USER" ]; then
	user="$SUDO_USER"
else
	user='root'
fi

yum -y remove docker docker-common docker-selinux docker-engine

yum -y install yum-utils device-mapper-persistent-data lvm2

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yum -y install docker-ce docker-compose

if ! grep -q 'docker' /etc/group; then
	groupadd docker
fi

if groups "$user" | grep -q docker && [ "$user" != 'root' ]; then
	usermod -aG docker "$user"
fi

systemctl start docker
systemctl enable docker
