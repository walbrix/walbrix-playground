WB=wb

%-i686-jp.dir %-i686-in.dir: %.lst
	$(shell echo $@|sed 's/^.\+-\(.\+\)-\(.\+\)\.dir$$/ARCH=\1 REGION=\2/') $(WB) collect-sysfiles -b -f /var/db/wb/filedb i686 $@ $<

%-i686-jp.tar.xz %-i686-in.tar.xz %-x86_64-jp.tar.xz %-x86_64-in.tar.xz: %.lst
	$(shell echo $@|sed 's/^.\+-\(.\+\)-\(.\+\)\.tar\.xz$$/ARCH=\1 REGION=\2/') $(WB) collect-sysfiles -b -J $@ -r -f /var/db/wb/filedb i686 $@.tmp $<

clean:
	rm -rf *.tmp *.dir
	rm -f *~ *.iso *.tar.xz *.img *.tar *.tar.gz

-include *.mk

