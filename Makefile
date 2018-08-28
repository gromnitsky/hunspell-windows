pkg.repos := http://repo.msys2.org/mingw/x86_64 \
	https://downloads.sourceforge.net/project/msys2/REPOS/MINGW/x86_64 \
	http://www2.futureware.at/~nickoe/msys2-mirror/mingw/x86_64

pkg := hunspell-1.6.2-1 \
	readline-7.0.005-1 \
	gcc-libs-7.3.0-2 \
	termcap-1.3.1-3

out := _out
cache := $(out)/cache
pkg.cache := $(addsuffix -any.pkg.tar.xz,$(addprefix $(cache)/mingw-w64-x86_64-,$(pkg)))

download: $(pkg.cache)

$(out)/%.pkg.tar.xz:
	$(pkg_download)

define pkg_download
$(mkdir)
@for repo in $(pkg.repos); do \
	url="$$repo/`basename $@`" ;\
	echo "$$url" ;\
	curl --connect-timeout 15 -Lf "$$url" -o "$@" && exit ;\
done
endef

mkdir = @mkdir -p $(dir $@)
