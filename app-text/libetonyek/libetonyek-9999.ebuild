# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/libetonyek/libetonyek-9999.ebuild,v 1.1 2013/11/01 10:03:46 scarabeus Exp $

EAPI=5

EGIT_REPO_URI="git://anongit.freedesktop.org/git/libreoffice/libetonyek"
inherit base eutils
[[ ${PV} == 9999 ]] && inherit autotools git-2

DESCRIPTION="Library parsing Apple Keynote presentations"
HOMEPAGE="http://www.freedesktop.org/wiki/Software/libetonyek"
[[ ${PV} == 9999 ]] || SRC_URI="http://dev-www.libreoffice.org/src/${P}.tar.xz"

LICENSE="|| ( GPL-2+ LGPL-2.1 MPL-1.1 )"
SLOT="0"
[[ ${PV} == 9999 ]] || \
KEYWORDS="~amd64 ~arm ~ppc ~x86"
IUSE="doc static-libs"

RDEPEND="
	app-text/libwpd:0.9
	app-text/libwpg:0.2
	dev-libs/icu:=
	dev-libs/libxml2
	sys-libs/zlib
"
DEPEND="${RDEPEND}
	>=dev-libs/boost-1.46
	dev-util/gperf
	sys-devel/libtool
	virtual/pkgconfig
	doc? ( app-doc/doxygen )
"

src_prepare() {
	[[ -d m4 ]] || mkdir "m4"
	base_src_prepare
	[[ ${PV} == 9999 ]] && eautoreconf
}

src_configure() {
	econf \
		--docdir="${EPREFIX}/usr/share/doc/${PF}" \
		$(use_enable static-libs static) \
		--disable-werror \
		$(use_with doc docs)
}

src_install() {
	default
	prune_libtool_files --all
}