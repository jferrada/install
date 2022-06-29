#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ -n "$SUDO_USER" ]; then
echo "# GDM configuration storage

[daemon]
AutomaticLogin=$SUDO_USER
AutomaticLoginEnable=True

[security]

[xdmcp]

[chooser]

[debug]
# Uncomment the line below to turn on debugging
#Enable=true

" > /etc/gdm/custom.conf
fi

