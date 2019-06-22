#/bin/bash
set -euo pipefail
IFS=$'\n\t'

dnf copr enable spoonsauce/RetroArch
dnf install RetroArch
