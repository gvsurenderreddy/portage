# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/wmbutton/wmbutton-0.7.0.ebuild,v 1.1 2014/10/06 13:35:56 voyageur Exp $

EAPI=5
inherit eutils toolchain-funcs

DESCRIPTION="a dockapp application that displays nine configurable buttons"
HOMEPAGE="http://windowmaker.org/dockapps/?name=wmbutton"
SRC_URI="http://windowmaker.org/dockapps/?download=${P}.tar.gz -> ${P}.tar.gz
	branding? ( mirror://gentoo/${PN}-buttons.xpm )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="branding"

RDEPEND="x11-libs/libX11
	x11-libs/libXpm
	x11-libs/libXext"
DEPEND="${RDEPEND}
	x11-proto/xextproto
	x11-proto/xproto"

S=${WORKDIR}/dockapps

src_prepare() {
	epatch "${FILESDIR}"/${P}-Makefile.patch
	use branding && cp "${DISTDIR}"/${PN}-buttons.xpm buttons.xpm
}

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	dobin ${PN}
	dodoc README
	use branding && dodoc "${FILESDIR}"/sample.wmbutton
	use branding || dodoc sample.wmbutton
}
