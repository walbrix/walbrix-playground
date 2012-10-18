#!/bin/sh
USER=danbooru
DB=danbooru
PGDIR=/usr/lib/postgresql-9.1
$PGDIR/bin/createuser -sDR $USER -U postgres
$PGDIR/bin/createdb $DB -E utf-8 -T template0 -O $USER -U postgres
cd /var/www/localhost/htdocs || exit
rake db:migrate RAILS_ENV=production
/etc/init.d/postgresql-9.1 stop
tar zcvpf /tmp/initial-database.tar.gz --exclude='data/postmaster.*' --numeric-owner -C /var/lib/postgresql/9.1 data

