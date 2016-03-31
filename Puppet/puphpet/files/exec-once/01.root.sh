#!/bin/sh

touch /root/.hushlogin
ln -svf /var/www /root/www
ln -svf /var/log /root/log
echo "root:123" | chpasswd
sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PermitEmptyPasswords no/PermitEmptyPasswords yes/g' /etc/ssh/sshd_config
service ssh restart
