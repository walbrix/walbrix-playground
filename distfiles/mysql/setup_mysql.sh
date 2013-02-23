#!/bin/sh
MY_DATADIR=/var/lib/mysql 
mkdir $MY_DATADIR
/usr/bin/mysql_install_db --cross-bootstrap
chown -R mysql:mysql $MY_DATADIR
chmod 0750 $MY_DATADIR
SOCKET=/var/run/mysqld/mysqld.sock
PIDFILE=/tmp/mysql.pid
mkdir /var/run/mysqld && chown mysql /var/run/mysqld
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
	exit
fi
/usr/bin/mysql_tzinfo_to_sql /usr/share/zoneinfo | /usr/bin/mysql --socket=$SOCKET -uroot mysql
kill `cat $PIDFILE`
rm -f $PIDFILE
while [[ -S "$SOCKET" ]] ; do
	echo -n "."
	sleep 1
done
