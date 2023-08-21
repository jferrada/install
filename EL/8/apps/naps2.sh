#/bin/bash
set -euo pipefail
IFS=$'\n\t'

rpm="$(curl -s https://api.github.com/repos/cyanfish/naps2/releases | jq -r '.[].assets[].browser_download_url ' | grep -E '.*-linux-x64\.rpm' | head -n1)"
dnf -y install "$rpm"
