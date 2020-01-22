[ja](./README.ja.md)

# Import on Bash 5

　Import a Bash file.

# Features

* Add a file and directory name as a prefix
    * Convert them to hyphens when they contain spaces

```sh
. ./moduled_import.sh 'di r/fi le.sh'
di-r.fi-le.func
```

* Can be aliased

```sh
. ./moduled_import.sh dir/file.sh as LIB
LIB.func
```
```sh
. ./moduled_import.sh dir/file.sh as LIB.SUB
LIB.SUB.func
```

* Prefix only part of file and directory names

```sh
. ./moduled_import.sh A/B/C/D/E/F.sh -0
func
```
```sh
. ./moduled_import.sh A/B/C/D/E/F.sh -1
F.func
```
```sh
. ./moduled_import.sh A/B/C/D/E/F.sh -2
E.F.func
```

* Import multiple files at once (cannot be renamed)

```sh
. ./moduled_imports.sh lib1.sh lib2.sh lib3.sh ...
lib1.func
lib2.func
lib3.func
```

# Requirement

* <time datetime="2020-01-18T15:11:55+0900">2020-01-18</time>
* [Raspbierry Pi](https://ja.wikipedia.org/wiki/Raspberry_Pi) 4 Model B Rev 1.2
* [Raspbian](https://ja.wikipedia.org/wiki/Raspbian) buster 10.0 2019-09-26 <small>[setup](http://ytyaru.hatenablog.com/entry/2019/12/25/222222)</small>
* bash 5.0.3(1)-release

```sh
$ uname -a
Linux raspberrypi 4.19.75-v7l+ #1270 SMP Tue Sep 24 18:51:41 BST 2019 armv7l GNU/Linux
```

# Installation

```sh
git clone https://github.com/ytyaru/Shell.import.prefix.rename.2020012300000
```

# Usage

```sh
cd /src
./main.sh
```

## setup `import`

1. Rename the `moduled_import.sh` file to` import`
2. Pass the `import` file through the environment variable` PATH`: `export PATH="/path/exist_import_dir:$PATH"`

## example call `import`

* some_dir/
    * main.sh
    * sub/
        * lib.sh
    * su b/
        * li b.sh

sub/lib.sh
```sh
Func() { echo 'Called sub/lib.sh Func()'; }
```
su b/li b.sh
```sh
Func() { echo 'Called "su b/li b.sh" Func()'; }
```
main.sh
```sh
. import sub/lib.sh
. import 'su b/li b.sh'
sub.lib.Func
su-b.li-b.Func
```

# Note

* `import` itself must be read with the` .` (`source`) command
* Function names and variable names defined in the file cannot be changed
     * Will not implement
* The import root directory is the directory where the `import` calling file resides

# Author

ytyaru

* [![github](http://www.google.com/s2/favicons?domain=github.com)](https://github.com/ytyaru "github")
* [![hatena](http://www.google.com/s2/favicons?domain=www.hatena.ne.jp)](http://ytyaru.hatenablog.com/ytyaru "hatena")
* [![mastodon](http://www.google.com/s2/favicons?domain=mstdn.jp)](https://mstdn.jp/web/accounts/233143 "mastdon")

# License

This software is CC0 licensed.

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.en)

