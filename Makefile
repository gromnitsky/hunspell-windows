pkg.repos := http://repo.msys2.org/mingw/x86_64 \
	https://downloads.sourceforge.net/project/msys2/REPOS/MINGW/x86_64 \
	http://www2.futureware.at/~nickoe/msys2-mirror/mingw/x86_64

pkg := hunspell-1.6.2-1 \
	readline-7.0.005-1 \
	gcc-libs-7.3.0-2 \
	termcap-1.3.1-3 \
	gettext-0.19.8.1-3 \
	libwinpthread-git-6.0.0.5134.2416de71-1 \
	libiconv-1.15-2

out := _out
cache := $(out)/cache
pkg.cache := $(addsuffix -any.pkg.tar.xz,$(addprefix $(cache)/mingw-w64-x86_64-,$(pkg)))
unpack := $(out)/unpack
unpack.pkg := $(patsubst $(cache)/%.pkg.tar.xz, $(unpack)/%.unpack, $(pkg.cache))

all: zip
unpack: $(unpack.pkg)
download: $(pkg.cache)

$(out)/%.pkg.tar.xz:
	$(pkg_download)

$(unpack)/%.unpack: $(cache)/%.pkg.tar.xz
	$(mkdir)
	tar xfJ $< -C $(unpack) mingw64
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



ver := h-$(subst hunspell-,,$(firstword $(pkg)))-d-$(dict.repo.ref)-v2
zip := $(out)/hunspell-windows-$(ver).zip

zip: $(zip)

$(zip): $(dict.readme)
	cd $(unpack)/mingw64 && zip -rq $(CURDIR)/$@ .
