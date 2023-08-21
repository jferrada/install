#/bin/bash
set -euo pipefail
IFS=$'\n\t'

dnf -y install unrar unzip zip p7zip p7zip-plugins dpkg lzma arj
