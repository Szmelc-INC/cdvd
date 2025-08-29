# cdvd
### CLI eyecandy ~ bouncing DvD logo in terminal written in C
![short-gif](https://i.imgur.com/D17BzFC.gif)

---

> [!IMPORTANT]
> # Quick Install 
> Build, install into /bin/cdvd and clean build artifacts \
> ```sh
> make && sudo make install && make clean
> ```

---
> [!TIP]
> Details on usage and available options
> # Usage
> ```bash
> cdvd [-f fps] [-s speed] [-t decay_sec] [-L logo.txt] [--info] [--mask-edges|--mask-blanks]
> ```
> Flags:
>```c
>   -f <fps>    : frames per second (default 60)
>   -s <speed>  : cells/sec (default 18)
>   -t <sec>    : ghost trail decay time in seconds (0 = no trail)
>   -L <path>   : load logo from file (UTF-8) at runtime (optional)
>   --info      : show status HUD line
>```
> Hotkeys:
>```c
>  Trail        : [t] - ON/OFF
>  Info         : [i] - ON/OFF
>  Speed        : [Arrow Left] / [Arrow Right]
>  Frames       : [Arrow Up] / [Arrow Down]
>  Decay        : [y] / [u]
>```

---

> [!IMPORTANT]
> # Compiling
> You can change logo to anything you preffer before compilation, to bake it into binary, or with a `-L` flag in runtime \
> Make sure you have `logo.txt` with ASCII art before compiling \
> ## Buld
> With Makefile:
>```c
>#   make                 # build
>#   make run             # run with nice defaults
>#   sudo make install    # install to /bin/cdvd  (override BINDIR/INSTALL_NAME)
>#   sudo make uninstall  # remove installed binary
>#   make clean           # clean artifacts
>```
> Alternatively run `bash compile.sh` \
> Or manually:
> Convert logo.txt to inc before compilation
>```c
>xxd -i -n dvd_logo logo.txt > logo.inc
>```
> Compile
>```c
>export LANG=en_US.UTF-8
>gcc -O2 -Wall -Wextra -std=c11 dvd_ascii.c -lncursesw -lm -o dvd
>```

---

> [!NOTE]
> ### Full Demo on ASCIINEMA
> [![asciicast](https://asciinema.org/a/736340.svg)](https://asciinema.org/a/736340)
