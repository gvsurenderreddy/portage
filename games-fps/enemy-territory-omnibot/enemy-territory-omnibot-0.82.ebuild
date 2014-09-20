# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-fps/enemy-territory-omnibot/enemy-territory-omnibot-0.82.ebuild,v 1.1 2014/07/22 01:36:22 ottxor Exp $

EAPI=2

GAME="enemy-territory"
MOD_DESC="Bots for Ennemy Territory"
MOD_NAME="Omnibot"
MOD_DIR="omnibot"

inherit games games-mods

HOMEPAGE="http://www.omni-bot.com/"
SRC_URI="http://omni-bot.invisionzone.com/index.php?/files/getdownload/151-omni-bot-enemy-territory/ -> Omni-bot_${PV}_ET_Linux.zip"

LICENSE="all-rights-reserved"
KEYWORDS="~amd64 ~x86"
