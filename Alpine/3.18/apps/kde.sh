#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

setup-xorg-base

apk add dbus
rc-update add dbus
rc-service dbus start

apk add elogind
rc-update add elogind
rc-service elogind start

apk add polkit-elogind
rc-update add polkit
rc-service polkit start

apk add plasma
setup-devd udev

rc-update add sddm
rc-service sddm start

apk add plasma-extras kde-applications ksysguard

apk add kdeplasma-addons-lang plasma-applet-weather-widget-lang plasma-bigscreen-lang plasma-browser-integration-lang plasma-desktop-lang plasma-dialer-lang plasma-disks-lang plasma-firewall-lang plasma-framework-lang plasma-integration-lang plasma-mobile-lang plasma-nm-lang plasma-pa-lang plasma-pass-lang plasma-phonebook plasma-remotecontrollers-lang plasma-sdk-lang plasma-settings plasma-systemmonitor-lang plasma-thunderbolt-lang plasma-vault-lang plasma-welcome-lang plasma-workspace-lang sddm-lang
