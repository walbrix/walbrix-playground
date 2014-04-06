#!/bin/sh
PGSQL_VERSION=9.3
source /etc/conf.d/postgresql-$PGSQL_VERSION
PGDATA=/etc/postgresql-$PGSQL_VERSION/
DATA_DIR=/var/lib/postgresql/$PGSQL_VERSION/data

USER=discourse
DB=$USER

su - postgres -c "postgres -D ${PGDATA} --data-directory=${DATA_DIR}" &
PID=$!

redis-server &
REDIS_PID=$!

sleep 5

createuser -sDR $USER -U postgres
createdb $DB -E utf-8 -T template0 -O $USER -U postgres

cd /var/www/localhost/htdocs
RUBY_GC_MALLOC_LIMIT=90000000 RAILS_ENV=production bundle exec rake db:migrate
RUBY_GC_MALLOC_LIMIT=90000000 RAILS_ENV=production bundle exec rake assets:precompile
RUBY_GC_MALLOC_LIMIT=90000000 RAILS_ENV=production bundle exec rails r 'user=User.find(-1);user.password="admin";user.save;user.email_tokens.each{|token|token.confirmed=true;token.save}'

kill $REDIS_PID
kill $PID
wait
rm -f /dump.rdb
