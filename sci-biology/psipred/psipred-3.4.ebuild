# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-biology/psipred/psipred-3.4.ebuild,v 1.1 2013/11/05 19:34:55 jlec Exp $

EAPI=5

inherit eutils prefix toolchain-funcs versionator

#MY_P="${PN}$(delete_all_version_separators)"
MY_P="${PN}${PV}"

DESCRIPTION="Protein Secondary Structure Prediction"
HOMEPAGE="http://bioinf.cs.ucl.ac.uk/psipred/"
SRC_URI="
	http://bioinf.cs.ucl.ac.uk/downloads/${PN}/${MY_P}.tar.gz
	test? ( http://bioinfadmin.cs.ucl.ac.uk/downloads/psipred/old/data/tdbdata.tar.gz )"

LICENSE="psipred"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="
	app-shells/tcsh
	sci-biology/ncbi-tools
	sci-biology/ncbi-tools++"
DEPEND=""

S="${WORKDIR}"/${PN}

src_prepare() {
	rm -f bin/*
	epatch \
		"${FILESDIR}"/3.1-Makefile.patch \
		"${FILESDIR}"/3.1-path.patch \
		"${FILESDIR}"/3.2-fgets.patch
	eprefixify runpsipred*
	emake -C src clean
}

src_compile() {
	emake -C src CC=$(tc-getCC)
}

src_install() {
	emake -C src DESTDIR="${D}" install
	dobin runpsipred* bin/* BLAST+/runpsipred*
	insinto /usr/share/${PN}
	doins -r data
	dodoc README
}

pkg_postinst() {
	elog "Please use the update_blastdb.pl in order to"
	elog "maintain your own local blastdb"
}