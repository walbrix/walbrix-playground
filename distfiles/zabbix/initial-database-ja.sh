mysql -e "create database zabbix"
mysql -e 'grant all privileges on zabbix.* to zabbix@localhost'
mysql zabbix < /usr/share/zabbix/database/mysql/schema.sql
mysql zabbix < /usr/share/zabbix/database/mysql/images.sql 
mysql zabbix < /usr/share/zabbix/database/mysql/data.sql   
mysql zabbix -e "update users set lang='ja_JP' where userid=1"
tar zcvpf initial-database-ja.tar.gz -C /var/lib/mysql ib_logfile0 ib_logfile1 ibdata1 mysql/db.MYD mysql/db.MYI mysql/user.MYI mysql/user.MYD zabbix
mv initial-database-ja.tar.gz /tmp/
