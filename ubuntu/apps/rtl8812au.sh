#/bin/bash
set -euo pipefail
IFS=$'\n\t'

apt install -y gcc make linux-headers-$(uname -r) dkms

git clone https://github.com/abperiasamy/rtl8812AU_8821AU_linux.git
cd rtl8812AU_8821AU_linux
sudo make -f Makefile.dkms install
rm -fr rtl8812AU_8821AU_linux
