VERSION = 3.13

PREFIX ?= /usr
BINDIR = $(PREFIX)/bin
DOCDIR = $(PREFIX)/share/doc/profile-sync-daemon-$(VERSION)
MANDIR = $(PREFIX)/share/man/man1
INITDIR = /etc/init.d
CONFDIR = /etc/conf.d
CRONDIR = /etc/cron.hourly

all:
	@echo -e '\033[1;32mnothing to compile\033[0m'

install-bin:
	@echo -e '\033[1;32minstalling main script, initd and config...\033[0m'
	install -Dm755 profile-sync-daemon "$(DESTDIR)$(BINDIR)/profile-sync-daemon"
	install -Dm755 psd.rc "$(DESTDIR)$(INITDIR)/psd"
	install -Dm644 psd.conf "$(DESTDIR)$(CONFDIR)/psd"

install-doc:
	@echo -e '\033[1;32minstalling docs...\033[0m'
	install -Dm644 README "$(DESTDIR)$(DOCDIR)/README"
	install -Dm644 CHANGELOG "$(DESTDIR)$(DOCDIR)/CHANGELOG"

install-man:
	@echo -e '\033[1;32minstalling manpage...\033[0m'
	install -Dm644 psd.1 "$(DESTDIR)$(MANDIR)/psd.1"
	ln -s psd.1 "$(DESTDIR)$(MANDIR)/profile-sync-daemon.1"

install-cron:
	@echo -e '\033[1;32minstalling cronjob...\033[0m'
	install -Dm755 psd.cron.hourly "$(DESTDIR)$(CRONDIR)/psd-update"

install: install-bin install-doc install-man install-cron
