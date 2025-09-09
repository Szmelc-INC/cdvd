# cdvd PKGBUILD for Arch Linux
# Maintainer: sernik <serainox@gmail.com>
pkgname=cdvd
pkgver=0.1   
pkgrel=1
pkgdesc="CLI DVD-logo eyecandy screensaver written in C"
url="https://github.com/Szmelc-INC/cdvd"
license=('GPL3')
arch=('x86_64')
depends=()
makedepends=('git' 'make' 'gcc')
source=("git+https://github.com/Szmelc-INC/cdvd.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/cdvd"
  echo "$pkgver"
}

build() {
  cd "$srcdir/cdvd"
  make
}

package() {
  cd "$srcdir/cdvd"
  make DESTDIR="${pkgdir}/" install
}
