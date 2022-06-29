#/bin/bash
set -euo pipefail
IFS=$'\n\t'

rsync -av .config/Hamsket "$host:$HOME/.config/"
rsync -av bin .chef .gnupg .gsutil .ssh install docker jd2 kind git opt svn "$host:$HOME/"
