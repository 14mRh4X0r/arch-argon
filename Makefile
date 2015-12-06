SHELL     = /bin/bash
DESTDIR   =
INSTALL   = /usr/bin/install -c
bindir    = /usr/bin
deskdir   = /usr/share/applications
sharedir  = /usr/share/argon
configdir = /etc/argon

all:

install: all
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL) -m755 bin/argon $(DESTDIR)$(bindir)
	$(INSTALL) -m755 bin/argon-notifier $(DESTDIR)$(bindir)
	$(INSTALL) -m755 bin/argon-notifier-config $(DESTDIR)$(bindir)
	$(INSTALL) -m755 bin/argon-install $(DESTDIR)$(bindir)
	$(INSTALL) -m755 bin/argon-remove $(DESTDIR)$(bindir)
	$(INSTALL) -m755 bin/argon-list $(DESTDIR)$(bindir)
	$(INSTALL) -m755 bin/argon-update $(DESTDIR)$(bindir)
	$(INSTALL) -d $(DESTDIR)$(deskdir)
	$(INSTALL) -m644 desktop/argon.desktop $(DESTDIR)$(deskdir)
	$(INSTALL) -m644 desktop/argon-notifier-config.desktop $(DESTDIR)$(deskdir)
	$(INSTALL) -d $(DESTDIR)$(sharedir)
	$(INSTALL) -m644 desktop/argon-update-notifier.desktop $(DESTDIR)$(sharedir)
	$(INSTALL) -m644 icons/argon.png $(DESTDIR)$(sharedir)
	$(INSTALL) -m644 icons/arch-fresh.png $(DESTDIR)$(sharedir)
	$(INSTALL) -m644 icons/arch-stale.png $(DESTDIR)$(sharedir)
	$(INSTALL) -d $(DESTDIR)$(configdir)
	$(INSTALL) -m666 config/config $(DESTDIR)$(configdir)
	$(INSTALL) -m666 config/package $(DESTDIR)$(configdir)
	$(INSTALL) -m666 config/message $(DESTDIR)$(configdir)
	$(INSTALL) -m666 config/top-final $(DESTDIR)$(configdir)
	$(INSTALL) -m666 config/top-add $(DESTDIR)$(configdir)
	$(INSTALL) -m666 config/top-remove $(DESTDIR)$(configdir)
