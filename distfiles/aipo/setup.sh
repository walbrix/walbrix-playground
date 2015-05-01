#!/bin/sh

AIPO_HOME=/usr/local/aipo
TOMCAT_HOME=/var/lib/tomcat-8
POSTGRES_USER=aipo_postgres                                              

wget -O - http://iij.dl.sourceforge.jp/aipo/63098/aipo-8.0-linux-x86.tar.gz | tar zxvf - -C /tmp

DIST_DIR=/tmp/aipo-*/dist

rm -rf $TOMCAT_HOME/webapps/ROOT && mkdir -p $TOMCAT_HOME/webapps/ROOT && unzip -o $DIST_DIR/aipo.war -d $TOMCAT_HOME/webapps/ROOT
mkdir -p $TOMCAT_HOME/webapps/container && unzip -o $DIST_DIR/container.war -d $TOMCAT_HOME/webapps/container

mkdir -p $AIPO_HOME/backup/xreg
cp -rf $TOMCAT_HOME/webapps/ROOT/WEB-INF/conf/*.xreg /usr/local/aipo/backup/xreg
mkdir -p $TOMCAT_HOME/datasource
cp -rf $TOMCAT_HOME/webapps/ROOT/WEB-INF/datasource/dbcp-org001.properties $TOMCAT_HOME/datasource/

mkdir -p $TOMCAT_HOME/data
mkdir -p $AIPO_HOME/bin
cp -rf $DIST_DIR/bin/* $AIPO_HOME/bin/ && chmod +x $AIPO_HOME/bin/*.sh
cp -rf $DIST_DIR/license $AIPO_HOME/

dd if=/dev/urandom bs=16 count=1|base64 > $TOMCAT_HOME/webapps/ROOT/WEB-INF/conf/securityTokenKey.txt
cp $TOMCAT_HOME/webapps/ROOT/WEB-INF/conf/securityTokenKey.txt $TOMCAT_HOME/webapps/container/WEB-INF/classes/aipo/
chown -R tomcat.tomcat $TOMCAT_HOME

PGSQL_VERSION=`basename /etc/postgresql-* | sed 's/^postgresql-//'`
source /etc/conf.d/postgresql-$PGSQL_VERSION
PGDATA=/etc/postgresql-$PGSQL_VERSION/
DATA_DIR=/var/lib/postgresql/$PGSQL_VERSION/data

service postgresql-$PGSQL_VERSION status && service postgresql-$PGSQL_VERSION stop

su postgres -c "postgres -D ${PGDATA} --data-directory=${DATA_DIR}" &
PID=$!
sleep 5
createuser -SDR $POSTGRES_USER -U postgres
createdb org001 -E utf-8 -T template0 -O $POSTGRES_USER -U postgres
psql -U $POSTGRES_USER -d org001 -f $DIST_DIR/sql/org001.sql

kill $PID
wait

cd /root && wget http://iij.dl.sourceforge.jp/aipo/63098/aipo-8.0-src.zip                                                

rm -rf /tmp/aipo-*

