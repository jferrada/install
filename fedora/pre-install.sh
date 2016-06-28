#/bin/bash
printf "LANG=\"es_CL.utf8\"\nSYSFONT=\"True\"\n" > /etc/sysconfig/i18n
dnf clean all && dnf makecache && dnf -y update

#Repos
dnf -y install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf -y install http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf clean all && dnf makecache && dnf -y update
dnf -y install dnf-plugins-core
dnf -y install fuse-sshfs htop terminator vim-enhanced sed curl wget sudo
dnf -y install aspell aspell-es hunspell hunspell-es
dnf -y install man-pages-es man-pages-es-extra
dnf -y install openssh-server
systemctl start sshd
systemctl enable sshd
