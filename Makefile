WB=wb
vars = $(shell echo $@|sed 's/^.\+-\(.\+\)-\(.\+\)\.\(tar\.xz\|dir\)$$/--arch=\1 --region=\2/')

%-i686-jp.dir %-i686-in.dir: %.lst
	$(WB) collect-sysfiles $(vars) -b -f /var/db/wb/filedb i686 $@ $<

%-i686-jp.tar.xz %-i686-in.tar.xz %-x86_64-jp.tar.xz %-x86_64-in.tar.xz: %.lst
	$(WB) collect-sysfiles $(vars) -b -J $@ -r -f /var/db/wb/filedb i686 $@.tmp $<

all:
	@echo "You must specify target.  suppose if you want to build 32bit version of wordpress.lst for indian market, type 'make wordpress-i686-in.tar.xz'"

clean:
	rm -rf *.tmp *.dir
	rm -f *~ *.iso *.tar.xz *.img *.tar *.tar.gz

-include *.mk

