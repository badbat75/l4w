### Package settings
PKGLIST="zlib gmp gmp-shared mpfr isl"

# zlib
PKGNAMEs[zlib]="zlib-1.2.11.tar.xz"
URLs[zlib]="https://zlib.net/${PKGNAMEs[zlib]}"
PATCHes[zlib]="https://raw.githubusercontent.com/Alexpux/MSYS2-packages/master/mingw-w64-cross-zlib/01-zlib-1.2.11-1-buildsys.mingw.patch"
CFLAGSs[zlib]="${CFLAGS}"
CONFs[zlib]="configure --prefix=$TD"

# gmp-static
PKGNAMEs[gmp]="gmp-6.1.2.tar.lz"
URLs[gmp]="https://gmplib.org/download/gmp/${PKGNAMEs[gmp]}"
CFLAGSs[gmp]="${CFLAGS}"
CONFs[gmp]="configure --build=x86_64-linux-gnu --host=$HOST --prefix=$TD --enable-fft --enable-cxx"

# gmp-shared
PKGNAMEs[gmp-shared]="gmp-6.1.2.tar.lz"
URLs[gmp-shared]="https://gmplib.org/download/gmp/${PKGNAMEs[gmp]}"
CFLAGSs[gmp-shared]="${CFLAGS}"
CONFs[gmp-shared]="configure --build=x86_64-linux-gnu --host=$HOST --prefix=$TD --enable-fft --enable-cxx --disable-static -enable-shared"

# mpfr
PKGNAMEs[mpfr]="mpfr-4.0.1.tar.xz"
URLs[mpfr]="https://www.mpfr.org/mpfr-current/${PKGNAMEs[mpfr]}"
CFLAGSs[mpfr]="${CFLAGS}"
CONFs[mpfr]="configure --build=x86_64-linux-gnu --host=$HOST --prefix=$TD --with-gmp=$TD --enable-shared"

# isl
PKGNAMEs[isl]="isl-0.20.tar.xz"
URLs[isl]="http://isl.gforge.inria.fr/${PKGNAMEs[isl]}"
PATCHes[isl]="https://raw.githubusercontent.com/Alexpux/MINGW-packages/master/mingw-w64-isl/isl-0.14.1-no-undefined.patch"
CFLAGSs[isl]="${CFLAGS}"
CONFs[isl]="configure --build=x86_64-linux-gnu --host=$HOST --prefix=$TD --enable-shared --with-gmp=system --with-gmp-prefix=$TD --with-clang=no"
BUILDFLAGs[isl]="autoreconf"
