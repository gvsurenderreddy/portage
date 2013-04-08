# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/data-default-instances-containers/data-default-instances-containers-0.0.1.ebuild,v 1.1 2013/04/03 11:28:12 gienah Exp $

EAPI=5

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Default instances for types in containers"
HOMEPAGE="http://hackage.haskell.org/package/data-default-instances-containers"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~sparc ~x86 ~amd64-linux ~ppc64 ~ppc-macos ~x86-linux"
IUSE=""

RDEPEND="dev-haskell/data-default-class:=[profile?]
		>=dev-lang/ghc-6.10.4:="
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"