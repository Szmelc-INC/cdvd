# cdvd
CLI eyecandy ~ bouncing DvD logo in terminal written in C

# Controls
> Flags:
```c
   -f <fps>    : frames per second (default 60)
   -s <speed>  : cells/sec (default 18)
   -t <sec>    : ghost trail decay time in seconds (0 = no trail)
   -L <path>   : load logo from file (UTF-8) at runtime (optional)
   --info      : show status HUD line
```
> Hotkeys:
```c
  Trail        : [t] - ON/OFF
  Info         : [i] - ON/OFF
  Speed        : [Arrow Left] / [Arrow Right]
  Frames       : [Arrow Up] / [Arrow Down]
  Decay        : [y] / [u]
```

# Compiling
> You can change logo to anything you preffer before compilation, to bake it into binary, or with a `-L` flag in runtime \
> Make sure you have `logo.txt` with ASCII art before compiling \
> Run `bash compile.sh` to make it easy, or manually with:

> Convert logo.txt to inc before compilation
```c
xxd -i -n dvd_logo logo.txt > logo.inc
```
> Compile
```c
export LANG=en_US.UTF-8
gcc -O2 -Wall -Wextra -std=c11 dvd_ascii.c -lncursesw -lm -o dvd
```
