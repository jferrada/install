#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ ! -e "/etc/yum.repos.d/dropbox.repo" ]; then
	cat repos/dropbox.repo > /etc/yum.repos.d/dropbox.repo
	dnf clean all && dnf makecache && dnf -y update
fi

dnf -y install nautilus-dropbox python-gpgme
