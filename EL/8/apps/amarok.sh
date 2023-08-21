#/bin/bash
set -euo pipefail
IFS=$'\n\t'

dnf install -y cmake extra-cmake-modules qt5-qtbase-devel libqt5quickwidgets-devel qt5-qtdeclarative-devel qt5-qtsvg-devel taglib-devel phonon-qt5-devel mariadb-devel fftw-devel

dnf install -y kf5-karchive-devel kf5-attica-devel kf5-kcodecs-devel  kf5-kconfig-devel kf5-kconfigwidgets-devel kf5-kcoreaddons-devel kf5-kcrash-devel kf5-kdbusaddons-devel  kf5-kdeclarative-devel kf5-kdnssd-devel  kf5-kdoctools-devel kf5-kglobalaccel-devel kf5-kguiaddons-devel kf5-ki18n-devel kf5-kiconthemes-devel kf5-kcmutils-devel kf5-kio-devel kf5-knewstuff-devel kf5-knotifications-devel kf5-knotifyconfig-devel kf5-kpackage-devel kf5-solid-devel kf5-ktexteditor-devel kf5-threadweaver-devel kf5-kwidgetsaddons-devel kf5-kwindowsystem-devel

