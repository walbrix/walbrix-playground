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
/usr/bin/mysql -u root -e "create database openpne" || exit 1
/usr/bin/mysql -u root -e 'grant all privileges on openpne.* to openpne@localhost' || exit 1
cd /var/www/localhost/htdocs || exit 1
./symfony openpne:fast-install --dbms=mysql --dbuser=openpne --dbpassword="" --dbhost=localhost --dbname=openpne
./symfony opPlugin:install opAlbumPlugin -r 1.0.0.1
./symfony openpne:migrate --target=opAlbumPlugin
./symfony opPlugin:install -r 1.1.1 opAshiatoPlugin
./symfony openpne:migrate --target=opAshiatoPlugin
./symfony opPlugin:install -r 1.3.3 opAuthMobileUIDPlugin
./symfony openpne:migrate --target=opAuthMobileUIDPlugin
./symfony opPlugin:install -r 1.0.2 opBlogPlugin
./symfony openpne:migrate --target=opBlogPlugin
./symfony opPlugin:install opCalendarPlugin -r 0.9.4
./symfony openpne:migrate --target=opCalendarPlugin
./symfony opPlugin:install -r 1.1.0 opCommunityTopicPlugin
./symfony openpne:migrate --target=opCommunityTopicPlugin
./symfony opPlugin:install opDiaryPlugin -r 1.5.0
./symfony openpne:migrate --target=opDiaryPlugin
./symfony opPlugin:install -r 1.0.0 opMessagePlugin
./symfony openpne:migrate --target=opMessagePlugin
./symfony opPlugin:install -r 1.0.1 opRankingPlugin
./symfony cc

kill `cat $PIDFILE`
rm -f $PIDFILE
while [[ -S "$SOCKET" ]] ; do
	echo -n "."
	sleep 1
done

