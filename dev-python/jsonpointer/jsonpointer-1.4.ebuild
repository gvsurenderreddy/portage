# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/jsonpointer/jsonpointer-1.4.ebuild,v 1.2 2014/10/04 05:38:29 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4} pypy )

inherit distutils-r1

DESCRIPTION="Identify specific nodes in a JSON document (according to draft 08)"
HOMEPAGE="https://github.com/stefankoegl/python-json-pointer https://pypi.python.org/pypi/jsonpointer/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

python_test() {
	"${PYTHON}" tests.py || die "Tests fail with ${EPYTHON}"
}
