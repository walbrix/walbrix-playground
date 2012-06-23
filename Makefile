WB=wb

%-x86_64.tar.xz: %.lst
	$(WB) collect-sysfiles -b -J $@ -r -f /var/db/wb/filedb x86_64 $@.tmp $<

%-i686.dir: %.lst
	$(WB) collect-sysfiles -b -f /var/db/wb/filedb i686 $@ $<

%-i686.tar.xz: %.lst
	$(WB) collect-sysfiles -b -J $@ -r -f /var/db/wb/filedb i686 $@.tmp $<

clean:
	rm -rf *.tmp *.dir
	rm -f *~ *.iso *.tar.xz *.img *.tar *.tar.gz

-include *.mk

