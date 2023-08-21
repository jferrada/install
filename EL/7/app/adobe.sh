#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if ! rpm -qa | grep adobe-release; then
	yum -y install --nogpgcheck http://linuxdownload.adobe.com/adobe-release/adobe-release-$(uname -i)-1.0-1.noarch.rpm
	yum clean all && yum makecache && yum -y update
fi
yum -y install flash-plugin alsa-plugins-pulseaudio libcurl
