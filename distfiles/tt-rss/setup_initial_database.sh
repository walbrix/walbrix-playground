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
/usr/bin/mysql -u root -e 'create database `tt-rss`' || exit 1
/usr/bin/mysql -u root -e 'grant all privileges on `tt-rss`.* to '\''tt-rss'\''@localhost' || exit 1
/usr/bin/mysql -u tt-rss tt-rss < /var/www/localhost/htdocs/schema/ttrss_schema_mysql.sql
/usr/bin/mysql -u tt-rss tt-rss -e "update ttrss_prefs set def_value='Asia/Tokyo' where pref_name='USER_TIMEZONE'"
#/usr/bin/mysql -u tt-rss tt-rss -e "insert into ttrss_feeds (owner_uid, title, feed_url) values (1, 'ワルブリックス株式会社 ブログ', 'http://www.walbrix.com/jp/blog/index.xml')"

kill `cat $PIDFILE`
rm -f $PIDFILE
while [[ -S "$SOCKET" ]] ; do
	echo -n "."
	sleep 1
done

