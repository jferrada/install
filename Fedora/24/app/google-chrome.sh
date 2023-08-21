#/bin/bash

if [ ! -e "/etc/yum.repos.d/google-chrome.repo" ]; then
	cat repos/google-chrome.repo > /etc/yum.repos.d/google-chrome.repo
	dnf clean all && dnf makecache && dnf -y update
fi
dnf -y install google-chrome-stable
