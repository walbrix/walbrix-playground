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
/usr/bin/mysql -u root -e 'create database `wallabag`' || exit 1
/usr/bin/mysql -u root -e 'grant all privileges on `wallabag`.* to '\''wallabag'\''@localhost' || exit 1
/usr/bin/mysql -u wallabag wallabag < /var/www/localhost/htdocs/install/mysql.sql
/usr/bin/mysql -u wallabag wallabag <<EOF
INSERT INTO users VALUES (1,'wallabag','2e4b32c93535af6cef8fee3d11ac3f014aaa736c','wallabag','');
INSERT INTO users_config VALUES (1,1,'pager','10');
INSERT INTO users_config VALUES (2,1,'language','en_EN.UTF8');
EOF

kill `cat $PIDFILE`
rm -f $PIDFILE
while [[ -S "$SOCKET" ]] ; do
	echo -n "."
	sleep 1
done

