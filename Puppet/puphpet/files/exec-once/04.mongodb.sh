#!/bin/sh

sed -i 's/net.bindIp:  127.0.0.1/net.bindIp:  0.0.0.0/g' /etc/mongod.conf
service mongod restart
