.PHONY: all clean install uninstall

KCONFIGS = $(filter-out kconfigs/Kconfig.index, $(wildcard kconfigs/Kconfig.*))
PATCHES  = $(patsubst %.tmpl, %, $(wildcard patches/*/*/*.patch.tmpl))

all: kconfigs/Kconfig.index $(PATCHES)

clean:
	rm -rf kconfigs/Kconfig.index
	rm -rf patches/*/*/*.patch

install: all
	install -D --target-directory=$(DESTDIR)/usr/src/kconfig-community kconfigs/Kconfig.*

	for i in $(PATCHES); do \
		install -D --target-directory=$(DESTDIR)/etc/portage/$$(dirname $$i) $$i; \
	done

uninstall:
	rm -rf $(DESTDIR)/usr/src/kconfig-community
	rm -rf $(DESTDIR)/etc/portage/patches/*/*/kconfig-community.patch

kconfigs/Kconfig.index: $(KCONFIGS)
	bin/gen-index $(?:kconfigs/%=%) > $@

%.patch: %.patch.tmpl
	cat $< | envsubst '$${DESTDIR}' > $@
