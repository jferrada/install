#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

ip="$(ip route get 1 | xargs -n 1 | tail -n1)"
fqdn="$(nslookup "$ip" | xargs -n 1 | tail -n1 | tr '[:upper:]' '[:lower:]')"
setup-hostname -n "$fqdn"

release="$(cut -d . -f1,2 < /etc/alpine-release)"
( echo '#/media/cdrom/apks' &&
echo "http://dl-cdn.alpinelinux.org/alpine/v$release/main" &&
echo "http://dl-cdn.alpinelinux.org/alpine/v$release/community" &&
echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" &&
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community") > /etc/apk/repositories

apk update

apk add gcompat btrfs-progs dosfstools e2fsprogs f2fs-tools jfsutils xfsprogs ntfs-3g fuse-exfat fuse-exfat-utils iftop htop vim curl wget sudo jq bash moreutils rsync rclone neofetch

reboot
