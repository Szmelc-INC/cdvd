# Simple Makefile for dvd_ascii
# Usage:
#   make                 # build
#   make run             # run with nice defaults
#   sudo make install    # install to /bin/cdvd  (override BINDIR/INSTALL_NAME)
#   sudo make uninstall  # remove installed binary
#   make clean           # clean artifacts

# Feature-test macros: force 700 here, strip conflicts from env
# try pkg-config
# --- pkg-config (may inject nasty -D flags) ---
CURSES_LIBS   := $(shell pkg-config --libs ncursesw 2>/dev/null || echo -lncursesw)
CURSES_CFLAGS := $(shell pkg-config --cflags ncursesw 2>/dev/null)

CC       ?= gcc
CFLAGS   ?= -O2 -Wall -Wextra -std=c11
CPPFLAGS ?=

# Build up CPPFLAGS, then nuke any conflicting crap (including pkg-config’s)
CPPFLAGS += $(CURSES_CFLAGS)
CPPFLAGS += -D_XOPEN_SOURCE=700 -D_XOPEN_SOURCE_EXTENDED=1 -DNCURSES_WIDECHAR=1
CPPFLAGS := $(filter-out -D_XOPEN_SOURCE=% -D_DEFAULT_SOURCE,$(CPPFLAGS))

LDLIBS   ?= $(CURSES_LIBS) -lm


# Project stuff
TARGET        := dvd
INSTALL_NAME  ?= cdvd
SRC           := dvd_ascii.c
LOGO_TXT      ?= logo.txt
LOGO_INC      := logo.inc

# Install paths
BINDIR  ?= /bin
DESTDIR ?=
INSTALL ?= install
STRIP   ?= strip

.PHONY: all clean run install uninstall

all: $(TARGET)

$(LOGO_INC): $(LOGO_TXT)
	xxd -i -n dvd_logo $< > $@

$(TARGET): $(SRC) $(LOGO_INC)
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $(SRC) $(LDLIBS)

run: $(TARGET)
	./$(TARGET) --info -t 5 --mask-edges

install: $(TARGET)
	$(INSTALL) -d "$(DESTDIR)$(BINDIR)"
	$(INSTALL) -m 0755 "$(TARGET)" "$(DESTDIR)$(BINDIR)/$(INSTALL_NAME)"
	@if [ -z "$$NO_STRIP" ]; then \
	  $(STRIP) --strip-unneeded "$(DESTDIR)$(BINDIR)/$(INSTALL_NAME)" || true; \
	fi
	@echo "Installed $(INSTALL_NAME) -> $(DESTDIR)$(BINDIR)/$(INSTALL_NAME)"

uninstall:
	$(RM) "$(DESTDIR)$(BINDIR)/$(INSTALL_NAME)"
	@echo "Removed $(DESTDIR)$(BINDIR)/$(INSTALL_NAME)"

clean:
	$(RM) $(TARGET) $(LOGO_INC)
