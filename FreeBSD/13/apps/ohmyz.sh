#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

pkg install -y zsh git

zsh=$(grep /zsh /etc/shells | tail -n1)

rm -rf /opt/oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git /opt/oh-my-zsh
curl -ksL https://raw.githubusercontent.com/keschort/files/main/ohmyzsh/templates/zshrc.zsh-template > /usr/share/skel/dot.zshrc
chmod 644 /usr/share/skel/dot.zshrc
mkdir -p /usr/share/skel/dot.oh-my-zsh/cache

touch /etc/adduser.conf
sed -i '' '/defaultshell=/d' /etc/adduser.conf
echo "defaultshell=$zsh" >> /etc/adduser.conf

rm -rf /root/.oh-my-zsh
[ ! -e /root/.zshrc ] && cp /usr/share/skel/dot.zshrc /root/.zshrc
mkdir -p /root/.oh-my-zsh/cache /root/.oh-my-zsh/themes
curl -ksL https://raw.githubusercontent.com/keschort/files/main/ohmyzsh/themes/keschort.zsh-theme > /root/.oh-my-zsh/themes/keschort.zsh-theme
chsh -s "$zsh" root &> /dev/null

if [ -n "$SUDO_USER" ]; then
	chsh -s "$zsh" "$SUDO_USER" &> /dev/null
	rm -rf /home/$SUDO_USER/.oh-my-zsh
	[ ! -e /home/$SUDO_USER/.zshrc ] && cp /usr/share/skel/dot.zshrc /home/$SUDO_USER/.zshrc
	mkdir -p /home/$SUDO_USER/.oh-my-zsh/cache /home/$SUDO_USER/.oh-my-zsh/themes
	cp /root/.oh-my-zsh/themes/keschort.zsh-theme /home/$SUDO_USER/.oh-my-zsh/themes/keschort.zsh-theme
	chown -R "$SUDO_USER":"$SUDO_USER" /home/$SUDO_USER/.oh-my-zsh /home/$SUDO_USER/.zshrc
fi
