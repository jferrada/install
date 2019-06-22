#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ ! -e "/etc/yum.repos.d/google-chrome.repo" ]; then
	cat repos/google-chrome.repo > /etc/yum.repos.d/google-chrome.repo
	yum clean all && yum makecache && yum -y update
fi
yum -y install google-chrome-stable
