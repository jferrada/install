#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ ! -L /usr/bin/ApacheDirectoryStudio ]; then
	wget -qO- http://www-us.apache.org/dist/directory/studio/2.0.0.v20170904-M13/ApacheDirectoryStudio-2.0.0.v20170904-M13-linux.gtk.x86_64.tar.gz | tar xvz -C /opt/
	ln -s /opt/ApacheDirectoryStudio/ApacheDirectoryStudio /usr/bin/ApacheDirectoryStudio
fi
