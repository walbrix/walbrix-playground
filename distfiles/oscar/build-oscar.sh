#!/bin/sh
echo "git clone https://github.com/walbrix/oscar.git" | su - oscar
echo "cd oscar/api && ant && mv trunk.war /var/lib/tomcat-7/webapps/" | su - oscar
mkdir /var/share /var/log/oscar
chown oscar.oscar /var/share /var/log/oscar

