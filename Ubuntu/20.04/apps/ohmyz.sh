#/bin/bash
set -euo pipefail
IFS=$'\n\t'

apt install -y zsh git

zsh=$(grep /zsh /etc/shells | tail -n1)

rm -rf /opt/oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git /opt/oh-my-zsh
curl -ksL https://raw.githubusercontent.com/keschort/files/main/ohmyzsh/templates/zshrc.zsh-template > /etc/skel/.zshrc
chmod 644 /etc/skel/.zshrc
mkdir -p /etc/skel/.oh-my-zsh/cache

chsh -s "$zsh" root &> /dev/null

rm -rf /root/.oh-my-zsh
[ ! -e /root/.zshrc ] && cp /etc/skel/.zshrc /root/.zshrc
mkdir -p /root/.oh-my-zsh/{cache,themes}
curl -ksL https://raw.githubusercontent.com/keschort/files/main/ohmyzsh/themes/keschort.zsh-theme > /root/.oh-my-zsh/themes/keschort.zsh-theme
chsh -s "$zsh" &> /dev/null

if [ -n "$SUDO_USER" ]; then
	chsh -s "$zsh" "$SUDO_USER" &> /dev/null
	rm -rf /home/$SUDO_USER/.oh-my-zsh
	[ ! -e /home/$SUDO_USER/.zshrc ] && cp /etc/skel/.zshrc /home/$SUDO_USER/.zshrc
	mkdir -p /home/$SUDO_USER/.oh-my-zsh/{cache,themes}
	cp /root/.oh-my-zsh/themes/keschort.zsh-theme /home/$SUDO_USER/.oh-my-zsh/themes/keschort.zsh-theme
	chown -R "$SUDO_USER":"$SUDO_USER" /home/$SUDO_USER/.oh-my-zsh /home/$SUDO_USER/.zshrc
fi
