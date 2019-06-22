#/bin/bash
set -euo pipefail
IFS=$'\n\t'

yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel icedtea-web
