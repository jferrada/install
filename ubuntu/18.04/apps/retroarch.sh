#/bin/bash
set -euo pipefail
IFS=$'\n\t'

add-apt-repository -y ppa:libretro/testing
apt update -y
apt install -y "retroarch*" "libretro-*"
apt install -y jstest-gtk


#xbox 360
apt-add-repository -y ppa:rael-gc/ubuntu-xboxdrv
apt update -y
apt install -y ubuntu-xboxdrv

#WiiU gamecube adapter
apt install -y libusb-dev libudev-dev
modprobe uinput
git clone https://github.com/ToadKing/wii-u-gc-adapter
cd wii-u-gc-adapter
make
cd..
