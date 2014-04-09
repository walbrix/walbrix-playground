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

wget -O - http://ftp.jaist.ac.jp/pub/postgresql/projects/pgFoundry/textsearch-ja/textsearch_ja/9.0.0/textsearch_ja-9.0.0.tar.gz | tar zxvf - -C /
cd /textsearch_ja-9.0.0
make USE_PGXS=1
make USE_PGXS=1 install
sed "s/LANGUAGE 'C'/LANGUAGE 'c'/" textsearch_ja.sql > /tmp/textsearch_ja.sql
su - postgres -c "psql -f /tmp/textsearch_ja.sql discourse"
rm /tmp/textsearch_ja.sql
cd /
rm -rf textsearch_ja-9.0.0
#read -n1 -r -p "Press any key to continue..." key

cd /var/www/localhost/htdocs
RUBY_GC_MALLOC_LIMIT=90000000 RAILS_ENV=production bundle exec rake db:migrate
RUBY_GC_MALLOC_LIMIT=90000000 RAILS_ENV=production bundle exec rake assets:precompile
RUBY_GC_MALLOC_LIMIT=90000000 RAILS_ENV=production bundle exec rails r 'user=User.find(-1);user.password="admin";user.save;user.email_tokens.each{|token|token.confirmed=true;token.save}'

kill $REDIS_PID
kill $PID
wait
rm -f /dump.rdb
