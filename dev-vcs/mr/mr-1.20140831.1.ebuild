# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-vcs/mr/mr-1.20140831.1.ebuild,v 1.1 2014/09/10 06:12:42 dev-zero Exp $

EAPI=5

MY_P="myrepos-${PV}"

DESCRIPTION="Multiple Repository management tool"
HOMEPAGE="https://github.com/joeyh/myrepos"
SRC_URI="https://github.com/joeyh/myrepos/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}
	dev-perl/libwww-perl
	dev-perl/HTML-Parser
"
S=${WORKDIR}/${MY_P}

src_install() {
	dobin mr webcheckout
	doman mr.1 webcheckout.1
	dodoc README debian/changelog \
		mrconfig mrconfig.complex
	insinto /usr/share/${PN}
	doins lib/*
}