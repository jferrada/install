#!/usr/bin/env bash

curl -ksL https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg > /bin/apt-cyg
chmod +x /bin/apt-cyg

apt-cyg update
apt-cyg install git vim wget zsh chere

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

echo 'aWYgWyAtZiB+Ly5wcm9maWxlIF07IHRoZW4KCS4gfi8ucHJvZmlsZQpmaQo=' | base64 -d > ~/.bashrc

echo 'exec zsh' >> ~/.bashrc

echo 'IyBlZGl0b3IKW1sgLXogJEVESVRPUiBdXSAmJiBleHBvcnQgRURJVE9SPXZpbQoKIyBTU0ggYWdl
bnQKZXhwb3J0IFNTSF9BVVRIX1NPQ0s9fi8uc3NoL3NzaC1hZ2VudC5zb2NrCnNzaC1hZGQgLWwg
Mj4vZGV2L251bGwgPi9kZXYvbnVsbAppZiBbICQ/IC1nZSAyIF07IHRoZW4KICBzc2gtYWdlbnQg
LWEgIiRTU0hfQVVUSF9TT0NLIiA+L2Rldi9udWxsCmZpCgo=' | base64 -d > ~/.profile

echo 'ZXhwb3J0IFpTSD0iJEhPTUUvLm9oLW15LXpzaCIKClpTSF9USEVNRT0iamlzcHdvc28iCgpwbHVn
aW5zPShnaXQpCgpzb3VyY2UgJFpTSC9vaC1teS16c2guc2gKCmlmIFsgLWYgfi8ucHJvZmlsZSBd
OyB0aGVuCgkuIH4vLnByb2ZpbGUKZmkK' | base64 -d > ~/.zshrc

echo 'c2V0IGZvcm1hdG9wdGlvbnMtPWNyCnNldCBjbGlwYm9hcmQ9dW5uYW1lZHBsdXMKc2V0IG1vdXNl
PXIK' | base64 -d > ~/.vimrc
