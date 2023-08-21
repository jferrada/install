#/bin/bash
IFS=$'\n\t'

if [ ! -e /usr/bin/kind ]; then
	curl -sLo /usr/bin/kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
	chmod +x /usr/bin/kind
fi
