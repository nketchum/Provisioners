#!/bin/sh

sed -i 's/bind-address = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/my.cnf
mysql -uroot -p123 -e "CREATE USER 'root'@'%' identified by '123';"
mysql -uroot -p123 -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
mysql -uroot -p123 -e "FLUSH PRIVILEGES;"
service mysql restart
