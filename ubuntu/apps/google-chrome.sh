#/bin/bash
IFS=$'\n\t'

if [ -n "$SUDO_USER" ]; then
	user="$SUDO_USER"
else
	user='root'
fi

curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - &>/dev/null

add-apt-repository -y 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main'

apt update -y

apt install -y google-chrome-stable
