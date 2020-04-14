#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ ! -e /usr/bin/xnview ]; then
	curl -ksL https://download.xnview.com/XnViewMP-linux-x64.tgz | tar xvzf - -C /opt/
	cd /opt/XnView/Plugins
	ln -s /usr/lib64/libbz2.so.1 libbz2.so.1.0
	ln -s /opt/XnView/xnview.sh /usr/bin/xnview
fi
