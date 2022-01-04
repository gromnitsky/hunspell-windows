pkg.repos := http://repo.msys2.org/mingw/x86_64 \
	https://downloads.sourceforge.net/project/msys2/REPOS/MINGW/x86_64 \
	http://www2.futureware.at/~nickoe/msys2-mirror/mingw/x86_64
#hunspell
ver.hunspell = $(shell pacman -Q mingw-w64-x86_64-hunspell | cut -d' ' -f 2)
ver.readline = $(shell pacman -Q mingw-w64-x86_64-readline | cut -d' ' -f 2)
ver.gcc-libs = $(shell pacman -Q mingw-w64-x86_64-gcc-libs | cut -d' ' -f 2)
ver.termcap = $(shell pacman -Q mingw-w64-x86_64-termcap | cut -d' ' -f 2)
ver.gettext = $(shell pacman -Q mingw-w64-x86_64-gettext | cut -d' ' -f 2)
ver.libwinpthread-git = $(shell pacman -Q mingw-w64-x86_64-libwinpthread-git | cut -d' ' -f 2)
ver.libiconv = $(shell pacman -Q mingw-w64-x86_64-libiconv | cut -d' ' -f 2)
#ripgrep
ver.ripgrep =  $(shell pacman -Q mingw-w64-x86_64-ripgrep | cut -d' ' -f 2)
#sqilite3
ver.tcl     =  $(shell pacman -Q mingw-w64-x86_64-tcl     | cut -d' ' -f 2)
ver.zlib    =  $(shell pacman -Q mingw-w64-x86_64-zlib    | cut -d' ' -f 2)
ver.sqlite3 =  $(shell pacman -Q mingw-w64-x86_64-sqlite3 | cut -d' ' -f 2)
ver.gmp	    =  $(shell pacman -Q mingw-w64-x86_64-gmp     | cut -d' ' -f 2)
ver.mpc	    =  $(shell pacman -Q mingw-w64-x86_64-mpc	  | cut -d' ' -f 2)
ver.mpfr    =  $(shell pacman -Q mingw-w64-x86_64-mpfr	  | cut -d' ' -f 2)
# termcap, winpthread-git, readline, gcclibs

#curl for org-download, curl-winssl has less dependencies
# mingw-w64-x86_64-gcc-libs
# mingw-w64-x86_64-gmp
# mingw-w64-x86_64-mpc
# mingw-w64-x86_64-mpfr
# mingw-w64-x86_64-libwinpthread-git
# mingw-w64-x86_64-gettext
# mingw-w64-x86_64-libiconv
# mingw-w64-x86_64-zlib

ver.curl-winssl      = $(shell pacman -Q mingw-w64-x86_64-curl-winssl	 | cut -d' ' -f 2)
ver.c-ares           = $(shell pacman -Q mingw-w64-x86_64-c-ares	 | cut -d' ' -f 2)
ver.brotli           = $(shell pacman -Q mingw-w64-x86_64-brotli	 | cut -d' ' -f 2)
ver.libidn2          = $(shell pacman -Q mingw-w64-x86_64-libidn2	 | cut -d' ' -f 2)
ver.expat            = $(shell pacman -Q mingw-w64-x86_64-expat		 | cut -d' ' -f 2)
ver.libunistring     = $(shell pacman -Q mingw-w64-x86_64-libunistring	 | cut -d' ' -f 2)
ver.libpsl           = $(shell pacman -Q mingw-w64-x86_64-libpsl	 | cut -d' ' -f 2)
ver.zstd             = $(shell pacman -Q mingw-w64-x86_64-zstd		 | cut -d' ' -f 2)
ver.libssh2-wincng   = $(shell pacman -Q mingw-w64-x86_64-libssh2-wincng | cut -d' ' -f 2)

# ver.curl            =  $(shell pacman -Q mingw-w64-x86_64-curl	    | cut -d' ' -f 2)
# ver.c-ares	      =  $(shell pacman -Q mingw-w64-x86_64-c-ares	    | cut -d' ' -f 2)
# ver.brotli	      =  $(shell pacman -Q mingw-w64-x86_64-brotli	    | cut -d' ' -f 2)
# ver.libidn2	      =  $(shell pacman -Q mingw-w64-x86_64-libidn2	    | cut -d' ' -f 2)
# ver.expat	      =  $(shell pacman -Q mingw-w64-x86_64-expat	    | cut -d' ' -f 2)
# ver.libunistring    =  $(shell pacman -Q mingw-w64-x86_64-libunistring    | cut -d' ' -f 2)
# ver.libpsl	      =  $(shell pacman -Q mingw-w64-x86_64-libpsl	    | cut -d' ' -f 2)
# ver.zstd	      =  $(shell pacman -Q mingw-w64-x86_64-zstd	    | cut -d' ' -f 2)
# ver.ca-certificates =  $(shell pacman -Q mingw-w64-x86_64-ca-certificates | cut -d' ' -f 2)
# ver.p11-kit	      =  $(shell pacman -Q mingw-w64-x86_64-p11-kit         | cut -d' ' -f 2)
# ver.libtasn1	      =  $(shell pacman -Q mingw-w64-x86_64-libtasn1	    | cut -d' ' -f 2)
# ver.libffi	      =  $(shell pacman -Q mingw-w64-x86_64-libffi	    | cut -d' ' -f 2)
# ver.libssh2	      =  $(shell pacman -Q mingw-w64-x86_64-libssh2	    | cut -d' ' -f 2)
# ver.openssl	      =  $(shell pacman -Q mingw-w64-x86_64-openssl	    | cut -d' ' -f 2)
# ver.nghttp2	      =  $(shell pacman -Q mingw-w64-x86_64-nghttp2	    | cut -d' ' -f 2)
# ver.jansson	      =  $(shell pacman -Q mingw-w64-x86_64-jansson	    | cut -d' ' -f 2)
# ver.jemalloc	      =  $(shell pacman -Q mingw-w64-x86_64-jemalloc	    | cut -d' ' -f 2)
# ver.libxml2	      =  $(shell pacman -Q mingw-w64-x86_64-libxml2	    | cut -d' ' -f 2)
# ver.xz	      =  $(shell pacman -Q mingw-w64-x86_64-xz		    | cut -d' ' -f 2)

ver.ninja = $(shell pacman -Q mingw-w64-x86_64-ninja | cut -d' ' -f 2)

pkg := hunspell-$(ver.hunspell) \
	readline-$(ver.readline) \
	gcc-libs-$(ver.gcc-libs) \
	termcap-$(ver.termcap) \
	gettext-$(ver.gettext) \
	libwinpthread-git-$(ver.libwinpthread-git) \
	libiconv-$(ver.libiconv) \
	ripgrep-$(ver.ripgrep) \
	tcl-$(ver.tcl) \
	zlib-$(ver.zlib) \
	sqlite3-$(ver.sqlite3) \
	curl-winssl-$(ver.curl-winssl) \
	c-ares-$(ver.c-ares) \
	brotli-$(ver.brotli) \
	libidn2-$(ver.libidn2) \
	expat-$(ver.expat) \
	libunistring-$(ver.libunistring) \
	libpsl-$(ver.libpsl) \
	zstd-$(ver.zstd) \
	libssh2-wincng-$(ver.libssh2-wincng) \
        ninja-$(ver.ninja)

out := _out
cache := $(out)/cache
pkg.cache := $(addsuffix -any.pkg.tar.zst,$(addprefix $(cache)/mingw-w64-x86_64-,$(pkg)))
unpack := $(out)/unpack
unpack.pkg := $(patsubst $(cache)/%.pkg.tar.zst, $(unpack)/%.unpack, $(pkg.cache))

all: zip
unpack: $(unpack.pkg)
download: $(pkg.cache)

$(out)/%.pkg.tar.zst:
	$(pkg_download)

$(unpack)/%.unpack: $(cache)/%.pkg.tar.zst
	$(mkdir)
	tar -axf $< -C $(unpack) mingw64
	touch $@

define pkg_download
$(mkdir)
@for repo in $(pkg.repos); do \
	url="$$repo/`basename $@`" ;\
	echo "$$url" ;\
	curl --connect-timeout 15 -Lf "$$url" -o "$@" && exit ;\
done
endef

mkdir = @mkdir -p $(dir $@)

dict.repo := $(cache)/dictionaries
dict.repo.ref := 9ec31e4

$(cache)/.dictionaries:
	$(mkdir)
	git clone git://anongit.freedesktop.org/libreoffice/dictionaries $(dict.repo)
	cd $(dict.repo) && git checkout $(dict.repo.ref)
	touch $@

$(cache)/.dictionaries.patch: $(cache)/.dictionaries
	$(file > $@.1,$(patch.1))
	cd $(dict.repo) && patch -p1 < ../$(notdir $@).1
	touch $@

dict.readme := $(unpack)/mingw64/share/hunspell/README.txt

dict: $(dict.readme)
# disable built-in gmake rule
%: %.sh

$(dict.readme): $(cache)/.dictionaries.patch $(unpack.pkg)
	./dict.sh $(dict.repo) $(dir $@)
	@echo 'License: https://cgit.freedesktop.org/libreoffice/dictionaries/tree/' > $@

define patch.1 :=
diff --git a/en/en_AU.aff b/en/en_AU.aff
index d0cccb3..4258f85 100644
--- a/en/en_AU.aff
+++ b/en/en_AU.aff
@@ -14,7 +14,7 @@ ONLYINCOMPOUND c
 COMPOUNDRULE 2
 COMPOUNDRULE n*1t
 COMPOUNDRULE n*mp
-WORDCHARS 0123456789
+WORDCHARS 0123456789’

 PFX A Y 1
 PFX A   0     re         .
diff --git a/en/en_CA.aff b/en/en_CA.aff
index d0cccb3..4258f85 100644
--- a/en/en_CA.aff
+++ b/en/en_CA.aff
@@ -14,7 +14,7 @@ ONLYINCOMPOUND c
 COMPOUNDRULE 2
 COMPOUNDRULE n*1t
 COMPOUNDRULE n*mp
-WORDCHARS 0123456789
+WORDCHARS 0123456789’

 PFX A Y 1
 PFX A   0     re         .
diff --git a/en/en_US.aff b/en/en_US.aff
index d0cccb3..4258f85 100644
--- a/en/en_US.aff
+++ b/en/en_US.aff
@@ -14,7 +14,7 @@ ONLYINCOMPOUND c
 COMPOUNDRULE 2
 COMPOUNDRULE n*1t
 COMPOUNDRULE n*mp
-WORDCHARS 0123456789
+WORDCHARS 0123456789’

 PFX A Y 1
 PFX A   0     re         .
endef


# ver := $(subst hunspell-,,$(firstword $(pkg)))-d-$(dict.repo.ref)-v2
zip := $(out)/dotemacs-msbin.zip

zip: $(zip)

$(zip): $(dict.readme)
	cd $(unpack)/mingw64 && zip -rq $(CURDIR)/$@ .
