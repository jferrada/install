#/bin/bash
set -euo pipefail
IFS=$'\n\t'

dnf -y install fedora-workstation-repositories
dnf -y config-manager --set-enabled google-chrome
dnf -y install google-chrome-stable
