all:
	scons

install: all
	s3cmd put -P index.xml s3://va.walbrix.net/
	s3cmd sync --no-delete-removed -P i686/ s3://va.walbrix.net/i686/

