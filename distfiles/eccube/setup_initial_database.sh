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

APPNAME=eccube
/usr/bin/mysql -u root -e "create database $APPNAME" || exit 1
/usr/bin/mysql -u root -e "grant all privileges on $APPNAME.* to $APPNAME@localhost" || exit 1
if [ -f /initial_database.sql.gz ]; then
	/bin/gunzip -c /initial_database.sql.gz | /usr/bin/mysql -u root $APPNAME
	rm /initial_database.sql.gz
fi

kill `cat $PIDFILE`
rm -f $PIDFILE
while [[ -S "$SOCKET" ]] ; do
	echo -n "."
	sleep 1
done

