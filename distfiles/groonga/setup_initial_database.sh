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

/usr/bin/mysql -u root -e "INSTALL PLUGIN mroonga SONAME 'ha_mroonga.so'" || exit 1
/usr/bin/mysql -u root -e "CREATE FUNCTION last_insert_grn_id RETURNS INTEGER soname 'ha_mroonga.so'" || exit 1
/usr/bin/mysql -u root -e "CREATE FUNCTION mroonga_snippet RETURNS STRING soname 'ha_mroonga.so'" || exit 1
/usr/bin/mysql -u root -e "CREATE FUNCTION mroonga_command RETURNS STRING soname 'ha_mroonga.so'" || exit 1

kill `cat $PIDFILE`
rm -f $PIDFILE
while [[ -S "$SOCKET" ]] ; do
	echo -n "."
	sleep 1
done

