#/bin/bash
set -euo pipefail
IFS=$'\n\t'

dnf -y group install lxde-desktop
