update users set lang='ja_JP';
update media_type set smtp_server='localhost',smtp_helo='example.com',smtp_email='zabbix@example.com' where type=0;
update hosts set status=0 where host='Zabbix server';

