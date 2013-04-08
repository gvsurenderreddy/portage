# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/liboauth/liboauth-1.0.1.ebuild,v 1.1 2013/03/09 13:51:23 flameeyes Exp $

EAPI=5

inherit autotools-utils

DESCRIPTION="C library implementing the OAuth secure authentication protocol"
HOMEPAGE="http://liboauth.sourceforge.net/"
SRC_URI="mirror://sourceforge/project/${PN}/${P}.tar.gz"

LICENSE="|| ( GPL-2 MIT )"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x64-macos"
IUSE="curl doc bindist +nss"

REQUIRED_USE="bindist? ( nss )"

CDEPEND="
	nss? ( dev-libs/nss
		curl? ( || ( net-misc/curl[ssl,curl_ssl_nss] net-misc/curl[-ssl] ) )
	)

	!nss? ( dev-libs/openssl
		curl? ( || ( net-misc/curl[ssl,curl_ssl_openssl] net-misc/curl[-ssl] ) )
	)

	net-misc/curl
"

RDEPEND="${CDEPEND}"

DEPEND="${CDEPEND}
	doc? (
		app-doc/doxygen
		media-gfx/graphviz
		media-fonts/freefont
	)
	virtual/pkgconfig"

src_configure() {
	local myeconfargs=(
		--disable-static
		$(use_enable !curl curl)
		$(use_enable curl libcurl)
		$(use_enable nss)
	)

	autotools-utils_src_configure
}

src_compile() {
	autotools-utils_src_compile

	if use doc ; then
		# make sure fonts are found
		export DOTFONTPATH="${EPREFIX}"/usr/share/fonts/freefont-ttf
		emake dox
	fi
}

DOCS=( AUTHORS ChangeLog LICENSE.OpenSSL README )

src_install() {
	use doc && HTML_DOCS=("${BUILD_DIR}"/doc/html)

	autotools-utils_src_install
}