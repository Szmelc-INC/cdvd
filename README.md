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
>### Flags
>| Flag | Description |
>|------|-------------|
>| `-f <fps>` | Frames per second |
>| `-s <speed>` | Cells per second (movement speed) |
>| `-t <sec>` | Ghost‑trail decay time (0 = off) |
>| `-L <path>` | Load a UTF‑8 logo file at runtime |
>| `--info` | Show status HUD line |
>| `--mask-edges` / `--mask-blanks` | Edge/blank masking modes |
>
>### Hotkeys (at runtime)
>| Action | Key(s) |
>|---|---|
>| Toggle trail | `t` |
>| Toggle info HUD | `i` |
>| Speed ± | `←` / `→` |
>| FPS ± | `↑` / `↓` |
>| Decay ± | `y` / `u` |


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
> # More
> ## Custom logos
>- Provide your own ASCII/UTF‑8 art via `-L path/to/logo.txt` at runtime.
>- Or bake it in at compile time using the `xxd` step above.
>- Make sure your terminal font supports the characters you use.
>
>---
>
>## 🎬 Demo (Asciinema)
>
>[![asciicast](https://asciinema.org/a/736340.svg)](https://asciinema.org/a/736340)
>
>---
>
>## Requirements
>
>- A POSIX‑y environment (Linux, BSD, macOS).
>- `ncursesw`, `gcc`/`clang`, and `make` (if using the Makefile).
>- UTF‑8 locale (e.g., `LANG=en_US.UTF-8`).
>
>---
>
>## 📝 Notes
>
>- Terminal size affects bounce boundaries (resizing is handled on the fly).
>- For best visuals, use a font with good box‑drawing / block character coverage.
