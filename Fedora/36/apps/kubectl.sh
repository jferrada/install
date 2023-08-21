#/bin/bash
IFS=$'\n\t'

if [ ! -e /etc/yum.repos.d/kubernetes.repo ]; then
	cat repos/kubernetes.repo > /etc/yum.repos.d/kubernetes.repo
	yum clean all && yum -y makecache && yum -y update
fi

yum install -y kubectl
