#/bin/bash
set -euo pipefail
IFS=$'\n\t'

#dnf groupinstall -y "KDE Plasma Workspaces"

if rpm -qa | grep ^calligra; then
	dnf -y remove calligra*
fi

if rpm -qa | grep ^ktorrent; then
	dnf -y remove ktorrent*
fi

dnf -y install kde-i18n-Spanish kde-l10n-es
dnf -y install kate kate-plugins kdiff3 krename
