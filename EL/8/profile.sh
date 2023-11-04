#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ $EUID -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 1
fi

if [ -n "$SUDO_USER" ]; then
	echo 'aWYgWyAtZiB+Ly5wcm9maWxlIF07IHRoZW4KCS4gfi8ucHJvZmlsZQpmaQo=' | base64 -d > "/home/$SUDO_USER/.bashrc"
	echo 'IyBlZGl0b3IKW1sgLXogJEVESVRPUiBdXSAmJiBleHBvcnQgRURJVE9SPXZpbQoKIyBTU0ggYWdlbnQKZXhwb3J0IFNTSF9BVVRIX1NPQ0s9fi8uc3NoL3NzaC1hZ2VudC5zb2NrCnNzaC1hZGQgLWwgMj4vZGV2L251bGwgPi9kZXYvbnVsbAppZiBbICQ/IC1nZSAyIF07IHRoZW4KICBybSAtZiAiJFNTSF9BVVRIX1NPQ0siICYmIHNzaC1hZ2VudCAtYSAiJFNTSF9BVVRIX1NPQ0siID4vZGV2L251bGwKZmkK' | base64 -d > "/home/$SUDO_USER/.profile"
	echo 'ZXhwb3J0IFpTSD0iJEhPTUUvLm9oLW15LXpzaCIKClpTSF9USEVNRT0iamlzcHdvc28iCgpwbHVnaW5zPShnaXQpCgpzb3VyY2UgJFpTSC9vaC1teS16c2guc2gKCmlmIFsgLWYgfi8ucHJvZmlsZSBdOyB0aGVuCgkuIH4vLnByb2ZpbGUKZmkK' | base64 -d > "/home/$SUDO_USER/.zshrc"
	echo 'c2V0IGZvcm1hdG9wdGlvbnMtPWNyCnNldCBjbGlwYm9hcmQ9dW5uYW1lZHBsdXMKc2V0IG1vdXNlPXIK' | base64 -d > "/home/$SUDO_USER/.vimrc"
	chown "$SUDO_USER":"$SUDO_USER" "/home/$SUDO_USER/.bashrc" "/home/$SUDO_USER/.profile" "/home/$SUDO_USER/.zshrc" "/home/$SUDO_USER/.vimrc"
fi
