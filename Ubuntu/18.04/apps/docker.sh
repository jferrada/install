#/bin/bash
IFS=$'\n\t'

if [ -n "$SUDO_USER" ]; then
	user="$SUDO_USER"
else
	user='root'
fi

apt remove -y docker docker-engine docker.io containerd runc

apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - &>/dev/null

add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt update -y

apt install -y docker-ce docker-ce-cli containerd.io docker-compose

if ! grep -q 'docker' /etc/group; then
	groupadd docker
fi

if groups "$user" | grep -q docker && [ "$user" != 'root' ]; then
	usermod -aG docker "$user"
fi

systemctl start docker
systemctl enable docker
