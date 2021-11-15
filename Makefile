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
	sqlite3-$(ver.sqlite3)

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
