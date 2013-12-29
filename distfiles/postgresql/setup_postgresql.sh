#!/bin/sh
VERSION=9.3
source /etc/conf.d/postgresql-$VERSION
PGDATA=/etc/postgresql-$VERSION/
DATA_DIR=/var/lib/postgresql/$VERSION/data
unset LANG
unset LC_CTYPE
unset LC_NUMERIC
unset LC_TIME
unset LC_COLLATE
unset LC_MONETARY
unset LC_MESSAGES
unset LC_ALL
PG_MAX_CONNECTIONS="128"
mkdir -p "${DATA_DIR}"
chown -Rf postgres:postgres "${DATA_DIR}" || exit 1
chmod 0700 "${DATA_DIR}"

su postgres -c "/usr/lib/postgresql-$VERSION/bin/initdb -D \"${DATA_DIR}\" ${PG_INITDB_OPTS}" || exit 1
mv $DATA_DIR/*.conf "${PGDATA}" || exit 1

! [ -x /run/postgresql ] && mkdir -p /run/postgresql
chown postgres:postgres /run/postgresql

su postgres -c "postgres -D ${PGDATA} --data-directory=${DATA_DIR}" &
PID=$!
sleep 5
kill $PID
wait

