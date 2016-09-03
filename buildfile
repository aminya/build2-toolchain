# file      : buildfile
# copyright : Copyright (c) 2014-2016 Code Synthesis Ltd
# license   : MIT; see accompanying LICENSE file

d = libbutl/ build2/ libsqlite3/ libodb/ libodb-sqlite/ libbpkg/ bpkg/ doc/

i =               \
INSTALL           \
UPGRADE           \
BOOTSTRAP-MACOSX  \
BOOTSTRAP-MINGW   \
BOOTSTRAP-MSVC    \
BOOTSTRAP-UNIX    \
BOOTSTRAP-WINDOWS

./: $d doc{$i README version} cli{$i} \
file{build.sh build-msvc.bat build-mingw.bat}

include $d

# Don't install the BOOTSTRAP/INSTALL files. But UPGRADE could be useful.
#
doc{INSTALL}@./: install = false
doc{BOOTSTRAP-*}: install = false
