# Emacs binaries management for Windows v0.1.2

The project originates from gromnitsky's
[hunspell-windows](https://github.com/gromnitsky/hunspell-windows). Later I
found it is perfect for maintaining x64 binaries for my Emacs usage on Windows.

Right now it includes:
- hunspell (and dictionaries libreoffice repo)
- riggrep;
- SQLite;
- ninja-build;
- curl;

The binaries are downloaded from the MSYS2 mirrors; the libreoffice dicts are
renamed to match `language_territory` locale names, like `uk_UA` or `en_GB`.

## Usage

The makefile works under Cygwin, MSYS2 or any modern Linux distro.

The easiest way to run it under Windows is to download MSYS2, run
`msys2.exe` &:

~~~
$ pacman -S git patch curl base-devel
$ git clone ...
$ cd dotemacs-msbin
$ makepkg-mingw
~~~

The resulting .tar.zst (~100MB) should be in current directory

## Result artifacts

Once you have the zip you can extract it some where (eg C:/Softwares/emacs-bin)
then adding bin folder to the PATH

## License

MIT
