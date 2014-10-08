# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/distributive/distributive-0.4.ebuild,v 1.1 2014/03/09 12:38:53 gienah Exp $

EAPI=5

# ebuild generated by hackport 0.3.6.9999
#hackport: flags: -lib-werror

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Haskell 98 Distributive functors -- Dual to Traversable"
HOMEPAGE="http://github.com/ekmett/distributive/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/tagged-0.7:=[profile?] <dev-haskell/tagged-1:=[profile?]
	>=dev-haskell/transformers-0.2:=[profile?] <dev-haskell/transformers-0.4:=[profile?]
	>=dev-haskell/transformers-compat-0.1:=[profile?] <dev-haskell/transformers-compat-0.2:=[profile?]
	>=dev-lang/ghc-6.10.4:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	test? ( >=dev-haskell/doctest-0.9.1 )
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=-lib-werror
}