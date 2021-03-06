NAME=eyeos
mysql -e "create database $NAME"
mysql -e "grant all privileges on $NAME."'*'" to $NAME@localhost"
mysql $NAME < initial-database.sql
mysql $NAME < initial-database-jp.sql
/etc/init.d/mysql stop
tar zcvpf /tmp/initial-database-jp.tar.gz --numeric-owner -C /var/lib/mysql ib_logfile0 ib_logfile1 ibdata1 mysql/db.MYD mysql/db.MYI mysql/user.MYI mysql/user.MYD $NAME

