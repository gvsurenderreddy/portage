# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kmahjongg/kmahjongg-4.14.1.ebuild,v 1.1 2014/09/16 18:17:28 johu Exp $

EAPI=5

KDE_HANDBOOK="optional"
KDE_SELINUX_MODULE="games"
inherit kde4-base

DESCRIPTION="Mahjongg for KDE"
HOMEPAGE="
	http://www.kde.org/applications/games/kmahjongg/
	http://games.kde.org/game.php?game=kmahjongg
"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	$(add_kdebase_dep libkdegames)
	$(add_kdebase_dep libkmahjongg)
"
RDEPEND="${DEPEND}"
