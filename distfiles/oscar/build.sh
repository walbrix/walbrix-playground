#!/bin/sh
eselect python set python2.7
echo '>=dev-lang/python-3.0' >> /etc/portage/package.mask
emerge --unmerge '>=python-3.0'

echo "=dev-python/blinker-1.3" >> /etc/portage/package.keywords
echo "=dev-python/werkzeug-0.9.4" >> /etc/portage/package.keywords
echo "=dev-python/flask-0.10.1-r1" >> /etc/portage/package.keywords
echo "=dev-python/itsdangerous-0.22" >> /etc/portage/package.keywords
echo "=app-text/xlhtml-0.5.1_p6" >> /etc/portage/package.keywords
echo "=dev-python/pyclamav-0.4.1-r1" >> /etc/portage/package.keywords
echo "=app-i18n/nkf-2.1.3" >> /etc/portage/package.keywords

echo "www-servers/apache threads apache2_modules_proxy apache2_modules_proxy_ajp apache2_mpms_event" >> /etc/portage/package.use
echo "dev-vcs/git -perl" >> /etc/portage/package.use
echo "app-editors/emacs -gtk3 -xpm" >> /etc/portage/package.use
echo "x11-libs/cairo X" >> /etc/portage/package.use
echo "www-client/lynx cjk" >> /etc/portage/package.use
echo "app-text/poppler cjk" >> /etc/portage/package.use
echo "sys-libs/tdb python" >> /etc/portage/package.use
echo "app-i18n/nkf python linguas_ja" >> /etc/portage/package.use
echo "app-text/wv tools" >> /etc/portage/package.use
echo "gnome-extra/libgsf -introspection" >> /etc/portage/package.use
echo "dev-python/beautifulsoup -python_targets_python3_3" >> /etc/portage/package.use
echo "dev-python/lxml -python_targets_python3_3" >> /etc/portage/package.use
echo "dev-python/pyinotify -python_targets_python3_3" >> /etc/portage/package.use
echo "dev-python/flask -python_targets_python3_3" >> /etc/portage/package.use
echo "dev-python/jinja -python_targets_python3_3" >> /etc/portage/package.use
echo "dev-python/werkzeug -python_targets_python3_3" >> /etc/portage/package.use
echo "dev-python/itsdangerous -python_targets_python3_3" >> /etc/portage/package.use
echo "dev-python/simplejson -python_targets_python3_3" >> /etc/portage/package.use
echo "dev-python/setuptools -python_targets_python3_3" >> /etc/portage/package.use
echo "dev-python/blinker -python_targets_python3_3" >> /etc/portage/package.use
echo "dev-python/markupsafe -python_targets_python3_3" >> /etc/portage/package.use
echo "sys-apps/portage -python_targets_python3_3 -python_targets_python3_3" >> /etc/portage/package.use
echo "dev-python/xlrd -python_targets_python3_3" >> /etc/portage/package.use
echo "dev-python/pyasn1 -python_targets_python3_3" >> /etc/portage/package.use
echo "virtual/python-argparse -python_targets_python3_3" >> /etc/portage/package.use
echo "dev-libs/libxml2 python -python_targets_python3_3" >> /etc/portage/package.use
echo "dev-python/pygobject -cairo -python_targets_python3_3" >> /etc/portage/package.use

emerge www-apache/mod_extract_forwarded www-apache/mod_wsgi
emerge dev-libs/gobject-introspection dev-python/pygobject
emerge dev-python/flask dev-python/beautifulsoup dev-python/lxml dev-python/pyinotify dev-python/pyclamav dev-python/xlrd dev-python/python-ldap dev-python/configobj
emerge app-admin/sudo app-admin/logrotate dev-vcs/git sys-process/vixie-cron
emerge app-i18n/nkf www-client/elinks app-text/xlhtml app-text/wv www-client/lynx app-text/poppler
emerge app-editors/emacs
emerge -uDN world

etc-update --automode -5

