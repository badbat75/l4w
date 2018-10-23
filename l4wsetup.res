#!/bin/bash
### Package settings
PKGLIST="zlib winpthreads ncurses readline gmp gmp-shared mpfr isl mpc iconv xml2 gettext-runtime binutils mingw-w64-headers gcc8 mingw-w64-crt"

# zlib
PKGNAMEs[zlib]="zlib-1.2.11.tar.xz"
URLs[zlib]="https://zlib.net/${PKGNAMEs[zlib]}"
PATCHes[zlib]="https://raw.githubusercontent.com/Alexpux/MSYS2-packages/master/mingw-w64-cross-zlib/01-zlib-1.2.11-1-buildsys.mingw.patch[]"
VARs[zlib]="CC=${CC} CFLAGS=\"${CFLAGS}\" RANLIB=${RANLIB}"
CONFs[zlib]="configure --prefix="

# winpthreads
PKGNAMEs[winpthreads]="mingw-w64-v6.0.0.tar.bz2"
URLs[winpthreads]="https://sourceforge.net/projects/mingw-w64/files/mingw-w64/mingw-w64-release/${PKGNAMEs[winpthreads]}/download/"
VARs[winpthreads]="CFLAGS=\"${CFLAGS}\""
CONFs[winpthreads]="mingw-w64-libraries/winpthreads/configure --build=x86_64-linux-gnu --host=${HOST} --prefix= --with-sysroot=${TD}"

# ncurses
PKGNAMEs[ncurses]="ncurses-6.1.tar.gz"
URLs[ncurses]="https://invisible-mirror.net/archives/ncurses/${PKGNAMEs[ncurses]}"
VARs[ncurses]="CFLAGS=\"${CFLAGS}\""
CONFs[ncurses]="configure --build=x86_64-linux-gnu --host=${HOST} --prefix= --with-sysroot=${TD} --with-shared --enable-term-driver --enable-sp-funcs --without-debug --enable-termcap --enable-symlinks --without-manpages --without-tests --without-cxx --without-cxx-binding --without-ada --disable-database --disable-db-install --with-fallbacks=linux,xterm,xterm-color,xterm-256color,vt100 --with-pthread"

# readline
PKGNAMEs[readline]="readline-7.0.tar.gz"
URLs[readline]="https://ftp.gnu.org/gnu/readline/${PKGNAMEs[readline]}"
PATCHes[readline]="https://ftp.gnu.org/gnu/readline/readline-7.0-patches/readline70-001[] https://ftp.gnu.org/gnu/readline/readline-7.0-patches/readline70-002[] https://ftp.gnu.org/gnu/readline/readline-7.0-patches/readline70-003[] https://ftp.gnu.org/gnu/readline/readline-7.0-patches/readline70-004[] https://ftp.gnu.org/gnu/readline/readline-7.0-patches/readline70-005[] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-readline/readline-7.0-mingw.patch[]"
VARs[readline]="CFLAGS=\"${CFLAGS}\""
CONFs[readline]="configure --build=x86_64-linux-gnu --host=${HOST} --prefix="

# gmp-static
PKGNAMEs[gmp]="gmp-6.1.2.tar.lz"
URLs[gmp]="https://gmplib.org/download/gmp/${PKGNAMEs[gmp]}"
VARs[gmp]="CFLAGS=\"${CFLAGS} -I${TD}/include -Wl,-L${TD}/lib\""
CONFs[gmp]="configure --build=x86_64-linux-gnu --host=${HOST} --prefix= --with-sysroot=${TD} --enable-fft --enable-cxx"

# gmp-shared
PKGNAMEs[gmp-shared]="gmp-6.1.2.tar.lz"
URLs[gmp-shared]="https://gmplib.org/download/gmp/${PKGNAMEs[gmp]}"
VARs[gmp]="CFLAGS=\"${CFLAGS} -I${TD}/include -Wl,-L${TD}/lib\""
CONFs[gmp-shared]="configure --build=x86_64-linux-gnu --host=${HOST} --prefix=  --with-sysroot=${TD} --enable-fft --enable-cxx --disable-static -enable-shared"

# mpfr
PKGNAMEs[mpfr]="mpfr-4.0.1.tar.xz"
URLs[mpfr]="https://www.mpfr.org/mpfr-current/${PKGNAMEs[mpfr]}"
VARs[mpfr]="CFLAGS=\"${CFLAGS}\""
CONFs[mpfr]="configure --build=x86_64-linux-gnu --host=${HOST} --prefix= --with-sysroot=${TD} --with-gmp=${TD} --enable-shared"

# isl
PKGNAMEs[isl]="isl-0.20.tar.xz"
URLs[isl]="http://isl.gforge.inria.fr/${PKGNAMEs[isl]}"
PATCHes[isl]="https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-isl/isl-0.14.1-no-undefined.patch[]"
VARs[isl]="CFLAGS=\"${CFLAGS}\""
CONFs[isl]="configure --build=x86_64-linux-gnu --host=${HOST} --prefix= --with-sysroot=${TD} --enable-shared --with-gmp=system --with-gmp-prefix=${TD} --with-clang=no"
BUILDFLAGs[isl]="autoreconf"

# mpc
PKGNAMEs[mpc]="mpc-1.1.0.tar.gz"
URLs[mpc]="https://ftp.gnu.org/gnu/mpc/${PKGNAMEs[mpc]}"
VARs[mpc]="CFLAGS=\"${CFLAGS}\""
CONFs[mpc]="configure --build=x86_64-linux-gnu --host=${HOST} --prefix= --with-sysroot=${TD} --enable-shared --with-gmp=${TD} --with-mpfr=${TD}"

# iconv
PKGNAMEs[iconv]="libiconv-1.15.tar.gz"
URLs[iconv]="https://ftp.gnu.org/pub/gnu/libiconv/${PKGNAMEs[iconv]}"
VARs[iconv]="CFLAGS=\"${CFLAGS}\""
CONFs[iconv]="configure --build=x86_64-linux-gnu --host=${HOST} --prefix= --with-sysroot=${TD} --enable-shared --enable-relocatable"

# xml2
PKGNAMEs[xml2]="libxml2-v2.9.8.tar.bz2"
URLs[xml2]="https://gitlab.gnome.org/GNOME/libxml2/-/archive/v2.9.8/${PKGNAMEs[xml2]}"
VARs[xml2]="CFLAGS=${CFLAGS}"
CONFs[xml2]="configure --build=x86_64-linux-gnu --host=${HOST} --prefix= --with-sysroot=${TD} --enable-shared --without-python --with-iconv=${TD} --with-zlib=${TD}"
BUILDFLAGs[xml2]="autoreconf"

# gettext-runtime
PKGNAMEs[gettext-runtime]="gettext-0.19.8.1.tar.xz"
URLs[gettext-runtime]="https://ftp.gnu.org/pub/gnu/gettext/${PKGNAMEs[gettext-runtime]}"
PATCHes[gettext-runtime]="https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/00-relocatex-libintl-0.18.3.1.patch[-p1] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/04-mingw-script-slash-fix.mingw.patch[-p0] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/05-always-use-libintl-vsnprintf.mingw.patch[-p0] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/06-dont-include-ctype-after-gnulibs-wctype.mingw.patch[-p0] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/07-fix-asprintf-conflict.mingw.patch[-p0] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/08-vs-compatible.patch[-p0] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/09-asm-underscore-mingw.patch[-p1] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/120-Fix-Woe32-link-errors-when-compiling-with-O0.patch[-p1] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/122-Use-LF-as-newline-in-envsubst.patch[-p1]"
#PATCHes[gettext-runtime]="${PATCHes[gettext]} https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/121-keep-posix-path.patch[-p1]"
CONFs[gettext-runtime]="gettext-runtime/configure --build=x86_64-linux-gnu --host=${HOST} --prefix= --with-libiconv-prefix=${TD} --with-libncurses-prefix=${TD} --with-libxml2-prefix=${TD} --with-libpth-prefix=${TD} --enable-relocatable --disable-java  --disable-native-java --disable-csharp --enable-threads=win32 --without-emacs --disable-openmp --without-cvs --without-git --disable-silent-rules --enable-static"
BUILDFLAGs[gettext-runtime]="libtoolize autogen"

# gettext (dependency from glib and libcroco)
PKGNAMEs[gettext]="gettext-0.19.8.1.tar.xz"
URLs[gettext]="https://ftp.gnu.org/pub/gnu/gettext/${PKGNAMEs[gettext]}"
PATCHes[gettext]="https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/00-relocatex-libintl-0.18.3.1.patch[-p1] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/04-mingw-script-slash-fix.mingw.patch[-p0] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/05-always-use-libintl-vsnprintf.mingw.patch[-p0] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/06-dont-include-ctype-after-gnulibs-wctype.mingw.patch[-p0] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/07-fix-asprintf-conflict.mingw.patch[-p0] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/08-vs-compatible.patch[-p0] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/09-asm-underscore-mingw.patch[-p1] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/120-Fix-Woe32-link-errors-when-compiling-with-O0.patch[-p1] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/122-Use-LF-as-newline-in-envsubst.patch[-p1]"
#PATCHes[gettext]="${PATCHes[gettext]} https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/121-keep-posix-path.patch[-p1]"
CONFs[gettext]="configure --build=x86_64-linux-gnu --host=${HOST} --prefix= --with-libiconv-prefix=${TD} --with-libncurses-prefix=${TD} --with-libxml2-prefix=/mnt/c/l4w --with-libpth-prefix=/mnt/c/l4w --enable-relocatable --disable-java  --disable-native-java --disable-csharp --enable-threads=win32 --without-emacs --disable-openmp --without-cvs --without-git --disable-silent-rules --enable-static"
BUILDFLAGs[gettext]="libtoolize autogen"

# binutils
PKGNAMEs[binutils]="binutils-2.31.1.tar.xz"
URLs[binutils]="https://mirror2.mirror.garr.it/mirrors/gnuftp/binutils/${PKGNAMEs[binutils]}"
#VARs[binutils]="CFLAGS=\"${CFLAGS} -I${TD}/include\" LDFLAGS=\"${LDFLAGS} -L${TD}/lib\""
CONFs[binutils]="configure --build=x86_64-linux-gnu --host=${HOST} --target=${HOST} --prefix= --with-sysroot=${TD} --with-system-zlib --with-mpc=${TD} --with-mpfr=${TD} --with-gmp=${TD} --with-isl=${TD} --with-intl-prefix=${TD} --enable-plugins --disable-rpath"
#--disable-werror --enable-ld=yes --enable-gold=no  --disable-multilib --disable-sim --disable-gdb

# mingw-w64-headers
PKGNAMEs[mingw-w64-headers]="mingw-w64-v6.0.0.tar.bz2"
URLs[mingw-w64-headers]="https://sourceforge.net/projects/mingw-w64/files/mingw-w64/mingw-w64-release/${PKGNAMEs[mingw-w64-headers]}/download/"
VARs[mingw-w64-headers]="CFLAGS=\"${CFLAGS}\""
CONFs[mingw-w64-headers]="mingw-w64-headers/configure --build=x86_64-linux-gnu --host=${HOST} --prefix= --with-sysroot=${TD} --enable-idl --enable-secure-api"

# gcc8
PKGNAMEs[gcc8]="gcc-8.2.0.tar.xz"
URLs[gcc8]="https://mirror2.mirror.garr.it/mirrors/gnuftp/gcc/gcc-8.2.0/${PKGNAMEs[gcc8]}"
PATCHes[gcc8]="https://gcc.gnu.org/viewcvs/gcc/branches/gcc-8-branch/gcc/graphite.h?view=patch&r1=263194&r2=263193&pathrev=263194[-p2]"
#VARs[gcc8]="CFLAGS=\"${CFLAGS} -I${TD}/include\" CXXFLAGS=\"${CXXFLAGS} -I${TD}/include\" LDFLAGS=\"${LDFLAGS} -L${TD}/lib\""
CONFs[gcc8]="configure -v --build=x86_64-linux-gnu --host=${HOST} --target=${HOST} --prefix= --libexecdir=/lib --libdir=/lib --with-sysroot=${TD} --with-native-system-header-dir=/include --program-suffix=-8  --with-arch=x86-64 --enable-languages=c,c++ --enable-checking=release --with-system-zlib --with-target-system-zlib --with-gmp-include=${TD}/include --with-gmp-lib=${TD}/lib --with-mpfr=${TD} --with-mpc=${TD} --with-isl=${TD} --with-libiconv-prefix=${TD} --enable-shared --enable-__cxa_atexit --enable-libmudflap --enable-libgomp --enable-libssp --enable-libquadmath --enable-libquadmath-support --enable-lto --enable-threads=posix --enable-plugin --enable-long-long --enable-gnu-unique-object --enable-linker-build-id --enable-gnu-indirect-function --disable-libunwind-exceptions  --without-included-gettext --enable-nls --enable-clocale=gnu --enable-libstdcxx-debug --enable-libstdcxx-time=yes --with-default-libstdcxx-abi=new --with-arch-directory=x86_64 --enable-multiarch "
#--disable-multilib
#host_configargs=\"CFLAGS=-I${TD}/include CXXFLAGS=-I${TD}/include LDFLAGS=-L${TD}/lib\" target_subdir=${HOST}
MAKEINSTs[gcc8]="strip-install"

# mingw-w64-crt
PKGNAMEs[mingw-w64-crt]="mingw-w64-v6.0.0.tar.bz2"
URLs[mingw-w64-crt]="https://sourceforge.net/projects/mingw-w64/files/mingw-w64/mingw-w64-release/${PKGNAMEs[mingw-w64-crt]}/download/"
VARs[mingw-w64-crt]="CFLAGS=\"${CFLAGS}\""
CONFs[mingw-w64-crt]="mingw-w64-crt/configure --build=x86_64-linux-gnu --host=${HOST} --prefix= --with-sysroot=${TD} --disable-lib32 --enable-lib64 --enable-wildcard --enable-private-exports --enable-delay-import-libs"
