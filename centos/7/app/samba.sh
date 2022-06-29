#/bin/bash
set -euo pipefail
IFS=$'\n\t'

yum -y install samba samba-client cifs-utils
