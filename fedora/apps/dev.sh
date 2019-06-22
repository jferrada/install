#/bin/bash
set -euo pipefail
IFS=$'\n\t'

dnf -y install kernel-headers
dnf -y install kernel-devel
dnf -y groupinstall "Development Tools"
dnf -y groupinstall "Development Libraries"
