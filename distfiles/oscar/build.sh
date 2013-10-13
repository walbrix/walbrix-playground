#!/bin/sh
eselect python set python2.7
echo '>=dev-lang/python-3.0' >> /etc/portage/package.mask
emerge --unmerge '>=python-3.0'

echo "=dev-java/icedtea-bin-7.2.3.9" >> /etc/portage/package.keywords
echo "=virtual/jdk-1.7.0" >> /etc/portage/package.keywords
echo "=virtual/jre-1.7.0" >> /etc/portage/package.keywords
echo "=dev-db/mysql-5.5.32" >> /etc/portage/package.keywords
echo "=virtual/mysql-5.5" >> /etc/portage/package.keywords
echo "=dev-python/blinker-1.3" >> /etc/portage/package.keywords
echo "=dev-python/werkzeug-0.9.4" >> /etc/portage/package.keywords
echo "=dev-python/flask-0.10.1-r1" >> /etc/portage/package.keywords
echo "=dev-python/itsdangerous-0.22" >> /etc/portage/package.keywords
echo "=app-text/xlhtml-0.5.1_p6" >> /etc/portage/package.keywords
echo "=dev-python/py-smbpasswd-1.0.1" >> /etc/portage/package.keywords
echo "=dev-python/pyclamav-0.4.1-r1" >> /etc/portage/package.keywords

echo "www-servers/apache threads apache2_modules_proxy apache2_modules_proxy_ajp apache2_mpms_event" >> /etc/portage/package.use
echo "dev-db/mysql -perl" >> /etc/portage/package.use
echo "dev-java/icedtea-bin -X -alsa -cups" >> /etc/portage/package.use
echo "dev-vcs/git -perl" >> /etc/portage/package.use
echo "app-editors/emacs -gtk3 -xpm" >> /etc/portage/package.use
echo "app-office/libreoffice-l10n linguas_ja" >> /etc/portage/package.use
echo "app-office/libreoffice -branding -vba -cups -gtk -webdav" >> /etc/portage/package.use
echo "x11-libs/cairo X" >> /etc/portage/package.use
echo "www-client/lynx cjk" >> /etc/portage/package.use
echo "app-text/poppler cjk" >> /etc/portage/package.use
echo "sys-libs/tdb python" >> /etc/portage/package.use
echo "app-i18n/nkf python linguas_ja" >> /etc/portage/package.use
echo "app-text/wv tools" >> /etc/portage/package.use
echo "gnome-extra/libgsf -introspection" >> /etc/portage/package.use
echo "dev-python/beautifulsoup -python_targets_python3_2" >> /etc/portage/package.use
echo "dev-python/lxml -python_targets_python3_2" >> /etc/portage/package.use
echo "dev-python/pyinotify -python_targets_python3_2" >> /etc/portage/package.use
echo "dev-python/setuptools -python_targets_python3_2" >> /etc/portage/package.use
echo "dev-python/blinker -python_targets_python3_2" >> /etc/portage/package.use
echo "dev-python/markupsafe -python_targets_python3_2" >> /etc/portage/package.use
echo "dev-java/java-config -python_targets_python3_2" >> /etc/portage/package.use
echo "sys-apps/portage -python_targets_python3_2" >> /etc/portage/package.use
echo "dev-python/xlrd -python_targets_python3_2" >> /etc/portage/package.use
echo "dev-python/pyasn1 -python_targets_python3_2" >> /etc/portage/package.use

echo "fs.inotify.max_queued_events = 65536" >> /etc/sysctl.conf
echo "fs.inotify.max_user_watches = 16777216" >> /etc/sysctl.conf
echo "vm.overcommit_memory=1" >> /etc/sysctl.conf

emerge dev-db/mysql www-apache/mod_extract_forwarded www-apache/mod_wsgi
emerge dev-java/commons-dbcp dev-java/commons-pool dev-java/jdbc-mysql www-servers/tomcat
emerge dev-python/flask dev-python/httplib2 dev-python/mysql-python dev-python/beautifulsoup dev-python/lxml dev-python/pyinotify dev-python/py-smbpasswd dev-python/pyclamav dev-python/xlrd dev-python/python-ldap
emerge app-admin/sudo app-admin/logrotate dev-vcs/git sys-process/vixie-cron
emerge app-i18n/nkf www-client/elinks app-text/xlhtml app-text/wv www-client/lynx
emerge app-editors/emacs

etc-update --automode -5

