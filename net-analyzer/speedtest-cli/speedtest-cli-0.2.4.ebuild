# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/speedtest-cli/speedtest-cli-0.2.4.ebuild,v 1.2 2014/03/09 18:37:18 ryao Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )
inherit distutils-r1

DESCRIPTION="Command line interface for testing internet bandwidth using speedtest.net"
HOMEPAGE="https://github.com/sivel/speedtest-cli"
SRC_URI="https://github.com/sivel/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
