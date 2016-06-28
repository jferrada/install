#/bin/bash

if [ ! -e "/etc/yum.repos.d/kde.repo" ]; then
	curl -skL http://apt.kde-redhat.org/apt/kde-redhat/fedora/kde.repo -o /etc/yum.repos.d/kde.repo
	dnf clean all && dnf makecache && dnf -y update
fi
dnf -y install @kde-desktop-environment
dnf -y remove calligra* ktorrent*
dnf -y install kde-i18n-Spanish kde-l10n-es
dnf -y install kate kate-plugins kdiff3 krename
