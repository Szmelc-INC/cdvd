# Simple Makefile for dvd_ascii
# Usage:
#   make          # build
#   make run      # run with nice defaults
#   make clean    # clean artifacts

CC      ?= gcc
CFLAGS  ?= -O2 -Wall -Wextra -std=c11
# Try pkg-config for ncursesw, fall back to -lncursesw
CURSES_LIBS   := $(shell pkg-config --libs ncursesw 2>/dev/null || echo -lncursesw)
CURSES_CFLAGS := $(shell pkg-config --cflags ncursesw 2>/dev/null)
LDLIBS  ?= $(CURSES_LIBS) -lm
CPPFLAGS ?= $(CURSES_CFLAGS)

# Nuke any existing -D_XOPEN_SOURCE=... from env/flags
CPPFLAGS := $(filter-out -D_XOPEN_SOURCE=%,$(CPPFLAGS))
CPPFLAGS += -D_XOPEN_SOURCE=700 -D_XOPEN_SOURCE_EXTENDED=1 -DNCURSES_WIDECHAR=1

TARGET  := dvd
SRC     := dvd_ascii.c
LOGO_TXT?= logo.txt
LOGO_INC:= logo.inc

.PHONY: all clean run

all: $(TARGET)

$(LOGO_INC): $(LOGO_TXT)
	xxd -i -n dvd_logo $< > $@

$(TARGET): $(SRC) $(LOGO_INC)
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $(SRC) $(LDLIBS)

run: $(TARGET)
	./$(TARGET) --info -t 5 --mask-edges

clean:
	$(RM) $(TARGET) $(LOGO_INC)
