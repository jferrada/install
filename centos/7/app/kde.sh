#/bin/bash
set -euo pipefail
IFS=$'\n\t'

yum -y groupinstall "KDE Plasma Workspaces"

if rpm -qa | grep ^calligra; then
	yum -y remove calligra*
fi

if rpm -qa | grep ^ktorrent; then
	yum -y remove ktorrent*
fi

yum -y install kate kdiff3 krename
