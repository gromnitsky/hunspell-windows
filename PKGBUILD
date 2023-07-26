# Maintainer: Martell Malone <martellmalone@gmail.com>

_realname=dotemacs-bin
pkgbase=mingw-w64-${_realname}
pkgname=("${_realname}")
pkgver=0.1.2
pkgrel=2
pkgdesc="Binaries dependencies for Emacs on Windows"
arch=('any')
mingw_arch=('mingw32' 'mingw64' 'ucrt64' 'clang64' 'clang32' 'clangarm64')
options=(!strip)
url='https://github.com/xeechou/dotemacs-msbin'
license=('MIT')
depends=("${MINGW_PACKAGE_PREFIX}-hunspell"
         "${MINGW_PACKAGE_PREFIX}-ripgrep"
         "${MINGW_PACKAGE_PREFIX}-sqlite3"
         "${MINGW_PACKAGE_PREFIX}-ninja"
         "${MINGW_PACKAGE_PREFIX}-curl")
makedepends=("wget" "pacman-contrib" "curl" "git")
source=("001-en_US.patch" "dict.sh")
sha256sums=('SKIP'
	    'SKIP')
dictref="9ec31e4"

pkg_download() {
    mkdir -p "$2"
    /usr/bin/curl --connect-timeout 15 -Lf "$1" -o "$2/$(basename $1)"
}

prepare() {
    # the prepare functions will generate the packages.list which contains
    # default urls of the packages.
    cd "${srcdir}/"
    # get the dependencies: "xargs -n 1" will execute the command once per
    # parameter, "pacman -Sp" will generate the default URL to download
    echo "${depends[@]}" | xargs -n 1 pactree -u | \
	sort -u | \
	xargs -n 1 pacman -Sp > _packages.list

    # Download packages under the cache
    packages=$(cat _packages.list)
    for url in ${packages}; do
	pkg_download "$url" "${srcdir}/cache"
    done

}

build() {
    cd "${srcdir}/"
    mkdir -p unpack
    for f in cache/*.tar.zst; do
	tar -axf "$f" -C "${srcdir}/unpack"
    done

    # # clone dictionaries because mingw only has en dictionaries
    cd "${srcdir}"
    rm -rf dict #clearing out the dictionary
    git clone git://anongit.freedesktop.org/libreoffice/dictionaries dict
    cd dict && git checkout ${dictref} && patch -p1 < ../001-en_US.patch
    cd "${srcdir}" # now copy the dictionaries
    ./dict.sh dict "${srcdir}/unpack/$(basename ${MINGW_PREFIX})/share/hunspell"
}

package() {
    cd "${srcdir}/unpack"
    #MINGW_PREFIX is actually "/mingw64", and need to skip
    cp -r "${srcdir}/unpack/$(basename ${MINGW_PREFIX})"/* "${pkgdir}"
}
