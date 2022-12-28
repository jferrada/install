#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if ! rpm -qa | grep -q hamsket; then
	rpm -ivh https://github.com/TheGoddessInari/hamsket/releases/download/0.6.3/hamsket-0.6.3.x86_64.rpm
fi
