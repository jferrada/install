#/bin/bash

if [ -n "$SUDO_USER" ]; then
	user="$SUDO_USER"
else
	user='root'
fi

dnf -y install zsh git
if [ ! -d "/home/$user/.oh-my-zsh" ]; then
	su -l $user -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi


