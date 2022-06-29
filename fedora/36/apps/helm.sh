#/bin/bash
IFS=$'\n\t'
version='3.6.1'

if [ ! -e /usr/local/bin/helm ]; then
	wget "https://get.helm.sh/helm-v$version-linux-amd64.tar.gz"
	tar -zxvf "helm-v$version-linux-amd64.tar.gz"
	mv linux-amd64/helm /usr/local/bin/helm
	rm -rf linux-amd64
fi
