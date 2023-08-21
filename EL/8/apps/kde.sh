#/bin/bash
set -euo pipefail
IFS=$'\n\t'

dnf -y groupinstall "KDE Plasma Workspaces" "base-x"
systemctl set-default graphical
systemctl enable sddm.service

dnf -y install ark
