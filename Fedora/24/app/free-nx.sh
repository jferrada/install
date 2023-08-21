#/bin/bash
dnf -y install freenx-server
/usr/libexec/nx/nxsetup --install --setup-nomachine-key
systemctl start freenx-server
systemctl enable freenx-server
