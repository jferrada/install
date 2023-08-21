#/bin/bash
set -euo pipefail
IFS=$'\n\t'

rpm="$(curl -s https://api.github.com/repos/ferdium/ferdium-app/releases/latest | jq -r '.assets[].browser_download_url' | grep -E 'Ferdium-linux-.*\.rpm')"
dnf -y install "$rpm"
