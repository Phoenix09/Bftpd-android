#!/bin/bash
set -e

TOP="$(realpath "$(dirname "$0")")"
cd "${TOP}"

[ -e "$TOP/../config.sh" ] && . "$TOP/../config.sh"

# You shouldn't need to change anything below here

EABI=
case "$ARCH" in
	arm64)
		GCC_ARCH="aarch64"
	;;
	arm)
		GCC_ARCH="arm"
		EABI="eabihf"
	;;
	mips|mips64)
		GCC_ARCH="${ARCH}el"
	;;
	x86|x86_64)
		GCC_ARCH="${ARCH}"
	;;
	*)
		echo "Unknown architecture: ${ARCH}"
		exit
esac

export HOST="${GCC_ARCH}-linux-gnu${EABI}"

export CC="$HOST-gcc"
export CXX="$HOST-g++"
export AR="$HOST-ar"
export CPP="$HOST-cpp"
export LD="$HOST-ld"
export STRIP="${HOST}-strip"
export DESTDIR="${TOP}/install_dir/$ARCH"

export CFLAGS="-static -static-libgcc"
export LDFLAGS="-static -s"

PREFIX="/data/local/bftpd"

rm -r "$DESTDIR" 2> /dev/null || true

cd src

./configure --host=${HOST} --prefix=${PREFIX} \
	--bindir=${PREFIX} \
	--sbindir=${PREFIX} \
	--libexecdir=${PREFIX} \
	--sysconfdir=${PREFIX} \
	--sharedstatedir=${PREFIX} \
	--localstatedir=${PREFIX} \
	--libdir=${PREFIX} \
	--includedir=${PREFIX} \
	--oldincludedir=${PREFIX} \
	--datadir=${PREFIX} \
	--infodir=${PREFIX} \
	--mandir=${PREFIX} \
	--disable-pam 

make -j$(nproc)

make install
rm -r "$DESTDIR/$PREFIX/man8"
printf "\n\nBuild complete! See install_dir/${ARCH}\n"
