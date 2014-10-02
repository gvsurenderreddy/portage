# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/logcheck/logcheck-1.3.15.ebuild,v 1.1 2012/07/31 15:53:27 phajdan.jr Exp $

EAPI="4"

inherit user

DESCRIPTION="Mails anomalies in the system logfiles to the administrator."
HOMEPAGE="http://packages.debian.org/sid/logcheck"
SRC_URI="mirror://debian/pool/main/l/${PN}/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

DEPEND=""
RDEPEND="!app-admin/logsentry
	app-misc/lockfile-progs
	dev-lang/perl
	dev-perl/mime-construct
	virtual/mailx
	${DEPEND}"

pkg_setup() {
	enewgroup logcheck
	enewuser logcheck -1 -1 -1 logcheck
}

src_install() {
	emake DESTDIR="${D}" install
	keepdir /var/{lib,lock}/logcheck
	dodoc AUTHORS CHANGES CREDITS TODO docs/README.*
	doman docs/logtail.8 docs/logtail2.8

	exeinto /etc/cron.hourly
	doexe "${FILESDIR}/${PN}.cron"
}

pkg_postinst() {
	chown -R logcheck:logcheck /etc/logcheck /var/{lib,lock}/logcheck || die

	elog "Please read the guide ad http://www.gentoo.org/doc/en/logcheck.xml"
	elog "for installation instructions."
}