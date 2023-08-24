#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

dnf -y install gstreamer1-{libav,plugins-{good,ugly,bad{-free,-nonfree}}} --skip-broken
dnf -y install ffmpeg
dnf -y install mencoder
dnf -y install libdvdread libdvdnav
dnf -y install xine-lib-extras xine-lib-extras-freeworld
dnf -y install vlc
