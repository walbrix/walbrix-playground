#!/bin/sh
PGSQL_VERSION=9.3
source /etc/conf.d/postgresql-$PGSQL_VERSION
PGDATA=/etc/postgresql-$PGSQL_VERSION/
DATA_DIR=/var/lib/postgresql/$PGSQL_VERSION/data

USER=aipo_postgres
DB=org001

su postgres -c "postgres -D ${PGDATA} --data-directory=${DATA_DIR}" &
PID=$!

sleep 5

createuser -SDR $USER -U postgres
createdb $DB -E utf-8 -T template0 -O $USER -U postgres
psql -U $USER -d $DB -f /root/aipo/src/initdata/sql/org001.sql
psql -U $USER -d $DB -f /root/aipo/src/initdata/sql/sample.sql
psql -U $USER -d $DB -c "UPDATE EIP_M_COMPANY SET PORT_INTERNAL=80"
psql -U $USER -d $DB -c "UPDATE AIPO_LICENSE SET LIMIT_USERS=0"
psql -U $USER -d $DB -c "INSERT INTO eip_m_mail_account VALUES (1, 1, 'aipo', '1', 'localhost', '', '', '\x7a540f5868b3e117', 'aipo', 'aipo@example.com', '25', 0, '110', 0, 0, '', '\x7a540f5868b3e117', 0, '0', '0', 0, '1', 1, NULL, NULL, now(), now())"

kill $PID
wait

