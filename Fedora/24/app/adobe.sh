#/bin/bash

if ! rpm -qa | grep adobe-release; then
	dnf -y install --nogpgcheck http://linuxdownload.adobe.com/adobe-release/adobe-release-$(uname -i)-1.0-1.noarch.rpm
	dnf clean all && dnf makecache && dnf -y update
fi
dnf -y install flash-plugin alsa-plugins-pulseaudio libcurl
