#/bin/bash
set -euo pipefail
IFS=$'\n\t'

dnf -y install snapd
ln -s /var/lib/snapd/snap /snap

