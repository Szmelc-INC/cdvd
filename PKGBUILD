# cdvd PKGBUILD for Arch Linux
# Maintainer: sernik <serainox@gmail.com>
pkgname=cdvd-git
pkgver=0.r0.g0000000
pkgrel=1
pkgdesc="CLI bouncing DVD logo (cdvd) — fast, tiny, stupidly fun."
arch=('x86_64' 'aarch64')
url="https://github.com/Szmelc-INC/cdvd"
license=('custom')
depends=()
makedepends=('git' 'make' 'gcc')
provides=('cdvd')
conflicts=('cdvd')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/cdvd"
  # Prefer tag-based version; fallback to r<rev>.g<hash>
  if git describe --tags --long --always >/dev/null 2>&1; then
    git describe --tags --long --always \
      | sed -E 's/^v//; s/-([0-9]+)-g/.r\1.g/; s/-/./'
  else
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$srcdir/cdvd"
  # Nuke any attempt to install into /bin; force /usr/bin
  # Try common vars; if Makefile is hardcoded, sed it.
  sed -i 's|/bin/|/usr/bin/|g' Makefile || true
  sed -i 's|\<BINDIR *= */bin|BINDIR=/usr/bin|g' Makefile || true
  sed -i 's|\<PREFIX *= */\>|PREFIX=/usr|g' Makefile || true
}

build() {
  cd "$srcdir/cdvd"
  make PREFIX=/usr BINDIR=/usr/bin
}

package() {
  cd "$srcdir/cdvd"
  make DESTDIR="$pkgdir" PREFIX=/usr BINDIR=/usr/bin install

  # License (if present); Arch wants it in /usr/share/licenses/$pkgname/
  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
