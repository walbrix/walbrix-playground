#!/bin/sh
USER=aipo_postgres
DB=org001
PGDIR=/usr/lib/postgresql-9.1
$PGDIR/bin/createuser -SDR $USER -U postgres
$PGDIR/bin/createdb $DB -E utf-8 -T template0 -O $USER -U postgres
$PGDIR/bin/psql -U $USER -d $DB -f aipo/src/initdata/sql/org001.sql
$PGDIR/bin/psql -U $USER -d $DB -f aipo/src/initdata/sql/sample.sql
$PGDIR/bin/psql -U $USER -d $DB -c "UPDATE EIP_M_COMPANY SET PORT_INTERNAL=80"
$PGDIR/bin/psql -U $USER -d $DB -c "UPDATE AIPO_LICENSE SET LIMIT_USERS=0"
$PGDIR/bin/psql -U $USER -d $DB -c "INSERT INTO eip_m_mail_account VALUES (1, 1, 'aipo', '1', 'localhost', '', '', '\x7a540f5868b3e117', 'aipo', 'aipo@example.com', '25', 0, '110', 0, 0, '', '\x7a540f5868b3e117', 0, '0', '0', 0, '1', 1, NULL, NULL, now(), now())"
/etc/init.d/postgresql-9.1 stop
tar zcvpf initial-database.tar.gz --exclude='data/postmaster.*' -C /var/lib/postgresql/9.1 data

