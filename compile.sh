#!/bin/sh

# Convert logo.txt to inc for compilation
xxd -i -n dvd_logo logo.txt > logo.inc

# Compile
export LANG=en_US.UTF-8
gcc -O2 -Wall -Wextra -std=c11 dvd_ascii.c -lncursesw -lm -o dvd
