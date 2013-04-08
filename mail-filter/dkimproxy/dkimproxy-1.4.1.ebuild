# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/mail-filter/dkimproxy/dkimproxy-1.4.1.ebuild,v 1.2 2013/03/02 04:10:14 zx2c4 Exp $

EAPI=5

inherit eutils

DESCRIPTION="An SMTP proxy server for adding DKIM headers."
HOMEPAGE="http://dkimproxy.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/Mail-DKIM
		>=dev-perl/net-server-2.7.0
		dev-perl/Error
		dev-perl/MIME-tools"
RDEPEND="${DEPEND}"

src_install() {
	default
	newinitd "${FILESDIR}"/dkimproxy.in.initd dkimproxy.in
	newinitd "${FILESDIR}"/dkimproxy.out.initd dkimproxy.out
}