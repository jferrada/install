#/bin/bash

dnf -y install docker-engine docker-compose
systemctl start docker
systemctl enable docker

