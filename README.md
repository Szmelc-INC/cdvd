<div align="center">

  <picture>
    <source media="(prefers-color-scheme: dark)"  srcset="https://raw.githubusercontent.com/serainox420/serainox420/personal/vector/logo-white.png">
    <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/serainox420/serainox420/personal/vector/logo-black.png">
    <img src="https://i.imgur.com/qpgeyna.png" alt="cDvD" width="124" />
  </picture>

  # <h1><samp><b>𝙘𝘿𝙫𝘿</b></samp></h1>

  <h4><blockquote>
 <p><table><tr><td>𝙾𝚕𝚍-𝚜𝚌𝚑𝚘𝚘𝚕 𝚜𝚌𝚛𝚎𝚎𝚗𝚜𝚊𝚟𝚎𝚛 𝚒𝚗 𝚝𝚎𝚛𝚖𝚒𝚗𝚊𝚕</td></tr></table></p>
    <p><i><samp><h4>𝙰 𝚝𝚒𝚗𝚢 𝙲 / 𝚗𝚌𝚞𝚛𝚜𝚎𝚜 𝚎𝚢𝚎𝚌𝚊𝚗𝚍𝚢 𝚝𝚑𝚊𝚝 𝚍𝚛𝚊𝚠𝚜 𝚊 𝚋𝚘𝚞𝚗𝚌𝚒𝚗𝚐 𝙳𝚟𝙳 𝚕𝚘𝚐𝚘 𝚠𝚒𝚝𝚑 𝚊 𝚏𝚎𝚠 𝚎𝚡𝚝𝚛𝚊 𝚏𝚎𝚊𝚝𝚞𝚛𝚎𝚜.</samp></i></p></h4>
  
  <p>
    <a href="https://github.com/Szmelc-INC/cdvd">
    </a>
    <img alt="C lang"         src="https://img.shields.io/badge/Lang-00599C?style=for-the-badge&logo=c&logoColor=white" height="34">
    <img alt="ncursesw"  src="https://img.shields.io/badge/ncursesw-✓-0A7B83?style=for-the-badge" height="34">
    <img alt="Terminal"  src="https://img.shields.io/badge/CLI-EYECANDY-226?style=for-the-badge" height="34">
    <a href="https://github.com/Szmelc-INC/cdvd/blob/main/LICENSE">
      <img alt="License" src="https://img.shields.io/github/license/Szmelc-INC/cdvd?style=for-the-badge" height="34">
    </a>
  </p>
</div>
 </blockquote></h4>

---

> [!IMPORTANT]
> # Quick Install 
> Build, install into `/bin/cdvd` and clean build artifacts \
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
