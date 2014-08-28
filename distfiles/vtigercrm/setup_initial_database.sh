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
/usr/bin/mysql -u root -e "create database vtigercrm" || exit 1
/usr/bin/mysql -u root -e 'grant all privileges on vtigercrm.* to vtigercrm@localhost' || exit 1
/usr/bin/mysql -u vtigercrm vtigercrm < /initial-database.sql || exit 1

kill `cat $PIDFILE`
rm -f $PIDFILE
while [[ -S "$SOCKET" ]] ; do
	echo -n "."
	sleep 1
done
