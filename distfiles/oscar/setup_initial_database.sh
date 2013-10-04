#!/bin/sh
MY_DATADIR=/var/lib/mysql
SOCKET=/var/run/mysqld/mysqld.sock
PIDFILE=/tmp/mysql.pid
MYSQL=/usr/bin/mysql
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
$MYSQL -u root -e "create database oscar" || exit 1
$MYSQL -u root -e 'grant all privileges on oscar.* to oscar@localhost' || exit 1
$MYSQL -u root -e 'grant reload on *.* to oscar@localhost;' || exit 1
$MYSQL -u root < /setup_mroonga.sql || exit 1
$MYSQL -u oscar oscar < /home/oscar/oscar/api/schema.sql

kill `cat $PIDFILE`
rm -f $PIDFILE
while [[ -S "$SOCKET" ]] ; do
	echo -n "."
	sleep 1
done
