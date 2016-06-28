#/bin/bash
dnf -y install openssh-server
systemctl start sshd
systemctl enable sshd
