#/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ $EUID -ne 0  ]; then
	echo "Este script debe ser ejecutado como root" 1>&2
	exit 2
fi

#sysdig
curl -skL https://s3.amazonaws.com/download.draios.com/stable/install-sysdig | bash

#iptables
systemctl stop firewalld
systemctl mask firewalld
yum -y install iptables-services
systemctl enable iptables
systemctl start mysqld.service
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
service iptables save

#mysql
yum -y install httpdlocalinstall https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yum -y install mysql-community-server
systemctl start mysqld.service
systemctl enable mysqld.service

mysqladmin -u root password c4mb14m3!
mysql -uroot -pc4mb14m3! -N -e "CREATE USER 'webdb_user'@'127.0.0.1' IDENTIFIED BY 'c4mb14m3!';" 2>/dev/null
mysql -uroot -pc4mb14m3! -N -e "CREATE DATABASE webdb" 2>/dev/null
mysql -uroot -pc4mb14m3! -N -e "GRANT ALL ON webdb.* TO 'webdb_user'@'127.0.0.1'" 2>/dev/null
mysql -uroot -pc4mb14m3! -N -e "FLUSH PRIVILEGES;" 2>/dev/null

#xinetd
yum -y install install xinetd

#apache
yum -y install httpd
systemctl start httpd.service
systemctl enable httpd.service

