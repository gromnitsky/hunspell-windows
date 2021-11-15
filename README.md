# Emacs binaries management for Windows

The project originates from gromnitsky's
[hunspell-windows](https://github.com/gromnitsky/hunspell-windows). Later I
found it is perfect for maintaining x64 binaries for my Emacs usage on Windows.

Right now it includes:
- hunspell (and dictionaries libreoffice repo)
- riggrep;
- SQLite;

The binaries are downloaded from the MSYS2 mirrors; the libreoffice dicts are
renamed to match `language_territory` locale names, like `uk_UA` or `en_GB`.

## Usage

The makefile works under Cygwin, MSYS2 or any modern Linux distro.

The easiest way to run it under Windows is to download MSYS2, run
`msys2.exe` &:

~~~
$ pacman -S git patch zip make
$ git clone ...
$ cd hunspell-windows
$ make
~~~

The resulting .zip (~74MB) should be in `_out/` dir.

## Emacs

http://gromnitsky.blogspot.com/2016/09/emacs-251-hunspell.html

## How to update Makefile

For new versions of hunspell/dicts, edit the vars:

* `pkg` (pacman packages for hunspell & its deps)
* `dict.repo.ref` (libreoffice git ref)

## License

MIT (for the files in this repo only, not for the bundle it makes)
