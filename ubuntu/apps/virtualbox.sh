#/bin/bash
set -euo pipefail
IFS=$'\n\t'

user='root'

if [ -n "$SUDO_USER" ]; then
	user="$SUDO_USER"
fi

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add - &>/dev/null
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add - &>/dev/null

add-apt-repository -y "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"

apt update
apt install -y gcc make linux-headers-$(uname -r) dkms
apt install -y virtualbox-6.0

if groups "$user" | grep -q docker && [ "$user" != 'root' ]; then
	usermod -aG vboxusers "$user"
fi

/sbin/vboxconfig
