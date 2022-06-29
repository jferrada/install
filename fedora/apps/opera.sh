#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ ! -e "/etc/yum.repos.d/opera.repo" ]; then
	rpm --import https://rpm.opera.com/rpmrepo.key
	cat repos/opera.repo > /etc/yum.repos.d/opera.repo
	yum clean all && yum -y makecache && yum -y update
fi

dnf -y install opera
