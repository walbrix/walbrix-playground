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
/usr/bin/mysql -u root -e "create database clipbucket" || exit 1
/usr/bin/mysql -u root -e 'grant all privileges on clipbucket.* to clipbucket@localhost' || exit 1
if [ -f /tmp/initial-database.sql ]; then
	/usr/bin/mysql -u clipbucket clipbucket < /tmp/initial-database.sql
	/usr/bin/mysql -u clipbucket clipbucket -e "update cb_config set value='' where name='baseurl'"
	/usr/bin/mysql -u clipbucket clipbucket -e "update cb_config set value='/usr/bin/ffmpeg' where name='ffmpegpath'"
	/usr/bin/mysql -u clipbucket clipbucket -e "update cb_config set value='/usr/bin/MP4Box' where name='mp4boxpath'"
	/usr/bin/mysql -u clipbucket clipbucket -e "update cb_config set value='9' where name='default_time_zone'"
	/usr/bin/mysql -u clipbucket clipbucket -e "update cb_config set value='JP' where name='default_country_iso2'"
	/usr/bin/mysql -u clipbucket clipbucket -e "update cb_users set country='JP'"
fi

kill `cat $PIDFILE`
rm -f $PIDFILE
while [[ -S "$SOCKET" ]] ; do
	echo -n "."
	sleep 1
done
