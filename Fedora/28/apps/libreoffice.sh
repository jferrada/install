#/bin/bash
set -euo pipefail
IFS=$'\n\t'

dnf -y install libreoffice-writer libreoffice-calc libreoffice-impress libreoffice-draw libreoffice-langpack-es
