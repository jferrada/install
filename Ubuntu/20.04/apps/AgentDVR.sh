#/bin/bash
set -euo pipefail
IFS=$'\n\t'

sudo apt-get install curl
bash <(curl -s "https://raw.githubusercontent.com/ispysoftware/agent-install-scripts/main/v2/install.sh")

apt install -y wine64
apt install -y cabextract
apt install -y ttf-mscorefonts-installer
if [ ! -e "/usr/bin/winetricks" ]; then
	curl -skL http://winetricks.org/winetricks -o /usr/bin/winetricks
	chmod +x /usr/bin/winetricks
fi

if [ -n "$SUDO_USER" ]; then
	user="$SUDO_USER"
else
	user='root'
fi

apt install -y curl

if [ ! -d "/home/$user/.oh-my-zsh" ]; then
	su -l $user -c "$(curl -fsSL https://raw.githubusercontent.com/ispysoftware/agent-install-scripts/main/v2/install.sh)"
fi
