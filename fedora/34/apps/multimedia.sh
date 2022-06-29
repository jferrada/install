#/bin/bash
set -euo pipefail
IFS=$'\n\t'

dnf -y install gstreamer1-{libav,plugins-{good,ugly,bad{-free,-nonfree}}} --skip-broken
dnf -y install ffmpeg
dnf -y install mencoder
dnf -y install libdvdread libdvdnav lsdvd
dnf -y install xine-lib-extras xine-lib-extras-freeworld k3b-extras-freeworld
dnf -y install vlc
