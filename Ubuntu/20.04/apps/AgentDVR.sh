#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ -n "$SUDO_USER" ]; then
	user="$SUDO_USER"
	dir="/home/$user/AgentDVR"
else
	user='root'
	dir='/root/AgentDVR'
fi

apt install -y curl

if [ ! -d "$dir" ]; then
	su -l "$user" -c "$(curl -fsSL https://raw.githubusercontent.com/ispysoftware/agent-install-scripts/main/v2/install.sh)"
fi
