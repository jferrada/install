#/bin/bash
set -euo pipefail
IFS=$'\n\t'

apt install -y openssh-server
systemctl start ssh
systemctl enable ssh

if [ -n "$SUDO_USER" ]; then
	mkdir -p /home/"$SUDO_USER"/.ssh
	echo 'c3NoLXJzYSBBQUFBQjNOemFDMXljMkVBQUFBREFRQUJBQUFDQVFERFE1L0xqU1h1RXFrWUQzRW1ySGdnRnA5YlU4cXdxN3RqZVF5OUNZY0czTWwvZllPK0RPUStGbXBvRCtaUElXYTFzRTV4TWRYNjgxRXI2N2VjQzZRbjVIM3owcDJaSFhMMXFnTnpyTEFmVWJLMHhZbkYrajlEUFh2V1hqb0NjQVFpZG92N1lqNys0a3d4QkZFV0s5TWYwaG1neEp3UmJEWmMrM3FPUDU1bTN5aENPVVBvc0tDRk1JR1o1c0JkWE5xUGZWUCtJMFZqd3R3WWtETSs2OTRFOGxCR1NCZk0rNTZNd213S3BLbW52eDdxazI4SWNoT0ZGOFcxVzgyblFrdVVFQ1BwVWtVb2w1Q0JmYWJZQW5mbEdBRGZFSHIxNmlOY2Jra013NkZmUUtDWWpWMVF4Y0xnMnJEMGNtYXlLMlN6NFA3NCtTWUwxczd1aEFMUU5sZmtKaTBOajVET1JDOXhMeXZoYmlFZEJEZCtBbFdZTmp5ZUl5aVFWTFRKQzlPQTdEK2RjZkY4dWJjbVEzKzdIUmVpZTlRTmFURlcwSjBRMFVUcUNKV1RYazVETTN2UHdOR3BWU1hKdWRVTll3Y0FNL0g4Vng0aUpsYUdmbkNBNVpUTyt5QjdLalBSYU1lenBodi9mempHaUJIdkpydGphVk5hZGJGODhEWFpoZEYvOFNwVlhXN0RsdU04UThWbnZMdGgzOFEzcXJXMjd3dnVPNzViQ200bS9YRUlwOU5rRVVxRXh5QTdqTEFMUmZFQU1kUmZXb1lsaHFkUHpoMzFqNkkyTGtGL2tpZ3dNK25aUys5WFNXdk1LNmkvQUZ6T29nT1FXVnRlQVdTZTFwcGthRG8zYVY1WDRvVThjOHVBaVlMcHd4aVQ3b1lEbUlGYXIzcjJkalo0WlE9PSAvaG9tZS9qZmVycmFkYS8uc3NoL2lkX3JzYQo=' | base64 -d >  /home/"$SUDO_USER"/.ssh/authorized_keys
	chmod 700 /home/"$SUDO_USER"/.ssh
	chmod 600 /home/"$SUDO_USER"/.ssh/*
	chown "$SUDO_USER.$SUDO_USER" -R /home/"$SUDO_USER"/.ssh
fi
