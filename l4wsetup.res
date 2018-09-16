### Package settings
PKGLIST="zlib winpthreads ncurses readline gmp gmp-shared mpfr isl mpc iconv xml2 gettext"

# zlib
PKGNAMEs[zlib]="zlib-1.2.11.tar.xz"
URLs[zlib]="https://zlib.net/${PKGNAMEs[zlib]}"
PATCHes[zlib]="https://raw.githubusercontent.com/Alexpux/MSYS2-packages/master/mingw-w64-cross-zlib/01-zlib-1.2.11-1-buildsys.mingw.patch"
CFLAGSs[zlib]="${CFLAGS}"
CONFs[zlib]="configure --prefix="

# winpthreads
PKGNAMEs[winpthreads]="mingw-w64-v5.0.4.tar.bz2"
URLs[winpthreads]="https://sourceforge.net/projects/mingw-w64/files/mingw-w64/mingw-w64-release/${PKGNAMEs[winpthreads]}/download/"
CFLAGSs[winpthreads]="${CFLAGS}"
CONFs[winpthreads]="mingw-w64-libraries/winpthreads/configure --build=x86_64-linux-gnu --host=$HOST --prefix= --with-sysroot=${TD}"

# ncurses
PKGNAMEs[ncurses]="ncurses-6.1.tar.gz"
URLs[ncurses]="https://invisible-mirror.net/archives/ncurses/${PKGNAMEs[ncurses]}"
CFLAGSs[ncurses]="${CFLAGS}"
CONFs[ncurses]="configure --build=x86_64-linux-gnu --host=$HOST --prefix= --with-sysroot=${TD} --with-shared --enable-term-driver --enable-sp-funcs --without-debug --enable-termcap --enable-symlinks --without-manpages --without-tests --without-cxx --without-cxx-binding --without-ada --disable-database --disable-db-install --with-fallbacks=linux,xterm,xterm-color,xterm-256color,vt100 --with-pthread"

# readline
PKGNAMEs[readline]="readline-7.0.tar.gz"
URLs[readline]="https://ftp.gnu.org/gnu/readline/${PKGNAMEs[readline]}"
PATCHes[readline]="https://ftp.gnu.org/gnu/readline/readline-7.0-patches/readline70-001 https://ftp.gnu.org/gnu/readline/readline-7.0-patches/readline70-002 https://ftp.gnu.org/gnu/readline/readline-7.0-patches/readline70-003 https://ftp.gnu.org/gnu/readline/readline-7.0-patches/readline70-004 https://ftp.gnu.org/gnu/readline/readline-7.0-patches/readline70-005 https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-readline/readline-7.0-mingw.patch"
CFLAGSs[readline]="${CFLAGS}"
CONFs[readline]="configure --build=x86_64-linux-gnu --host=$HOST --prefix="

# gmp-static
PKGNAMEs[gmp]="gmp-6.1.2.tar.lz"
URLs[gmp]="https://gmplib.org/download/gmp/${PKGNAMEs[gmp]}"
CFLAGSs[gmp]="${CFLAGS} -I${TD}/include -Wl,-L${TD}/lib"
CONFs[gmp]="configure --build=x86_64-linux-gnu --host=$HOST --prefix= --with-sysroot=${TD} --enable-fft --enable-cxx"
### --with-readline

# gmp-shared
PKGNAMEs[gmp-shared]="gmp-6.1.2.tar.lz"
URLs[gmp-shared]="https://gmplib.org/download/gmp/${PKGNAMEs[gmp]}"
CFLAGSs[gmp-shared]="${CFLAGS} -I${TD}/include -Wl,-L${TD}/lib"
CONFs[gmp-shared]="configure --build=x86_64-linux-gnu --host=$HOST --prefix=  --with-sysroot=${TD} --enable-fft --enable-cxx --disable-static -enable-shared"

# mpfr
PKGNAMEs[mpfr]="mpfr-4.0.1.tar.xz"
URLs[mpfr]="https://www.mpfr.org/mpfr-current/${PKGNAMEs[mpfr]}"
CFLAGSs[mpfr]="${CFLAGS}"
CONFs[mpfr]="configure --build=x86_64-linux-gnu --host=$HOST --prefix= --with-sysroot=${TD} --with-gmp=${TD} --enable-shared"

# isl
PKGNAMEs[isl]="isl-0.20.tar.xz"
URLs[isl]="http://isl.gforge.inria.fr/${PKGNAMEs[isl]}"
PATCHes[isl]="https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-isl/isl-0.14.1-no-undefined.patch"
CFLAGSs[isl]="${CFLAGS}"
CONFs[isl]="configure --build=x86_64-linux-gnu --host=$HOST --prefix= --with-sysroot=${TD} --enable-shared --with-gmp=system --with-gmp-prefix=${TD} --with-clang=no"
BUILDFLAGs[isl]="autoreconf"

# mpc
PKGNAMEs[mpc]="mpc-1.1.0.tar.gz"
URLs[mpc]="https://ftp.gnu.org/gnu/mpc/${PKGNAMEs[mpc]}"
CFLAGSs[mpc]="${CFLAGS}"
CONFs[mpc]="configure --build=x86_64-linux-gnu --host=$HOST --prefix= --with-sysroot=${TD} --enable-shared --with-gmp=${TD} --with-mpfr=${TD}"

# iconv
PKGNAMEs[iconv]="libiconv-1.15.tar.gz"
URLs[iconv]="https://ftp.gnu.org/pub/gnu/libiconv/${PKGNAMEs[iconv]}"
CFLAGSs[iconv]="${CFLAGS}"
CONFs[iconv]="configure --build=x86_64-linux-gnu --host=$HOST --prefix= --with-sysroot=${TD} --enable-shared --enable-relocatable"

# xml2
PKGNAMEs[xml2]="libxml2-v2.9.8.tar.bz2"
URLs[xml2]="https://gitlab.gnome.org/GNOME/libxml2/-/archive/v2.9.8/${PKGNAMEs[xml2]}"
CFLAGSs[xml2]="${CFLAGS}"
CONFs[xml2]="configure --build=x86_64-linux-gnu --host=$HOST --prefix= --with-sysroot=${TD} --enable-shared --without-python --with-iconv=${TD} --with-zlib=${TD}"
BUILDFLAGs[xml2]="autoreconf"

# gettext
PKGNAMEs[gettext]="gettext-0.19.8.1.tar.xz"
URLs[gettext]="https://ftp.gnu.org/pub/gnu/gettext/${PKGNAMEs[gettext]}"
PATCHes[gettext]="https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/00-relocatex-libintl-0.18.3.1.patch[-p1] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/04-mingw-script-slash-fix.mingw.patch[-p0] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/05-always-use-libintl-vsnprintf.mingw.patch[-p0] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/06-dont-include-ctype-after-gnulibs-wctype.mingw.patch[-p0] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/07-fix-asprintf-conflict.mingw.patch[-p0] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/08-vs-compatible.patch[-p0] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/09-asm-underscore-mingw.patch[-p1] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/120-Fix-Woe32-link-errors-when-compiling-with-O0.patch[-p1] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/121-keep-posix-path.patch[-p1] https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-gettext/122-Use-LF-as-newline-in-envsubst.patch[-p1]"
CFLAGSs[gettext]="${CFLAGS} -I${TD}/include -Wl,-L${TD}/lib"
CONFs[gettext]="configure --build=x86_64-linux-gnu --host=$HOST --prefix= --with-sysroot=${TD} --with-libiconv-prefix=${TD} --with-libncurses-prefix=${TD} --with-libxml2-prefix=/mnt/c/l4w --with-libpth-prefix=/mnt/c/l4w --enable-relocatable --disable-java  --disable-native-java --disable-csharp --enable-threads=win32 --without-emacs --disable-openmp --without-cvs --without-git --disable-silent-rules"