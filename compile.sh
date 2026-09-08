#!/bin/sh

# logo.inc is checked in; regenerate it with `make update-logo` if logo.txt changes.

# Compile
export LANG=en_US.UTF-8
gcc -O2 -Wall -Wextra -std=c11 dvd_ascii.c -lncursesw -lm -o dvd
