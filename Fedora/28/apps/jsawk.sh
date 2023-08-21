#/bin/bash
set -euo pipefail
IFS=$'\n\t'

dnf -y install js jq

if [ ! -e "/usr/bin/jsawk" ]; then
	curl -skL http://github.com/micha/jsawk/raw/master/jsawk > /usr/bin/jsawk
	chmod +x /usr/bin/jsawk
fi
