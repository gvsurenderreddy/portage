# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/audacious-dumb/audacious-dumb-0.73.ebuild,v 1.3 2012/07/27 16:56:35 joker Exp $

EAPI="4"

inherit toolchain-funcs

DESCRIPTION="Audacious Plug-in for accurate, high-quality IT/XM/S3M/MOD playback"
HOMEPAGE="http://www.netswarm.net/"
SRC_URI="http://www.netswarm.net/misc/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="=media-sound/audacious-3.1*
	>=media-libs/dumb-0.9.3"

DEPEND="virtual/pkgconfig
	${RDEPEND}"

src_compile() {
	tc-export CC
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die
	dodoc ChangeLog README README-dumb-bmp README-dumb-xmms
}
