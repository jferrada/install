#/bin/bash
#set -euo pipefail
IFS=$'\n\t'

dnf -y groupinstall "KDE Plasma Workspaces" --nobest
