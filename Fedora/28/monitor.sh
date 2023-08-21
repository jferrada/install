#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ $EUID -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

sh app/kde.sh
sh app/compress.sh
sh app/java.sh
dnf install chromium
sh app/adobe.sh

if rpm -qa | grep ^firefox; then
	dnf -y remove firefox*
fi

if grep 'x0vncserver' "/home/$SUDO_USER/.bash_profile"; then
	echo '#VNC' >> "/home/$SUDO_USER/.bash_profile"
	echo 'nohup x0vncserver -display :0 -passwordfile ~/.vnc/passwd &> /tmp/x0vncserver.log &' >> "/home/$SUDO_USER/.bash_profile"
fi
