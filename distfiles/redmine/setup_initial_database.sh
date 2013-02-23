#!/bin/sh
MY_DATADIR=/var/lib/mysql
SOCKET=/var/run/mysqld/mysqld.sock
PIDFILE=/tmp/mysql.pid
/usr/sbin/mysqld --skip-networking --user=mysql --log-warnings=0 --basedir=/usr\
 --datadir=$MY_DATADIR --max_allowed_packet=8M --net_buffer_length=16K\
 --default-storage-engine=MyISAM --socket=$SOCKET --pid-file=$PIDFILE &
maxtry=15
while ! [[ -S "$SOCKET" || "${maxtry}" -lt 1 ]] ; do
	maxtry=$((${maxtry}-1))
	echo -n "."
	sleep 1
done
if ! [[ -S "$SOCKET" ]]; then
	echo "Failed to start mysqld"
	exit 1
fi
/usr/bin/mysql -u root -e "create database redmine" || exit 1
/usr/bin/mysql -u root -e 'grant all privileges on redmine.* to redmine@localhost' || exit 1
cd /var/www/localhost/htdocs && rake db:migrate RAILS_ENV=production || exit 1
/usr/bin/mysql redmine -e "update users set language='ja' where id=1" || exit 1
/usr/bin/mysql redmine -e "insert into settings(name,value,updated_on) values('default_language','ja',now())" || exit 1

kill `cat $PIDFILE`
rm -f $PIDFILE
while [[ -S "$SOCKET" ]] ; do
	echo -n "."
	sleep 1
done
