# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-strategy/triplea/triplea-1.7.0.3.ebuild,v 1.4 2014/01/18 18:39:21 pacho Exp $

EAPI=5
inherit eutils java-pkg-2 java-ant-2 versionator games

MY_PV=$(replace_all_version_separators _)
DESCRIPTION="An open source clone of the popular Axis and Allies boardgame"
HOMEPAGE="http://triplea.sourceforge.net/"
SRC_URI="mirror://sourceforge/triplea/${PN}_${MY_PV}_source_code_only.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""
RESTRICT="test" # Needs X11 maybe use virtualx.eclass

RDEPEND="dev-java/commons-httpclient:3
	dev-java/apple-java-extensions-bin
	dev-java/commons-logging
	dev-java/commons-codec
	=dev-java/junit-3.8*"
DEPEND="${RDEPEND}
	>=virtual/jdk-1.6
	app-arch/unzip"
RDEPEND="${RDEPEND}
	>=virtual/jre-1.6"

S=${WORKDIR}/${PN}_${MY_PV}

pkg_setup() {
	games_pkg_setup
	java-pkg-2_pkg_setup
}

src_prepare() {
	sed -i \
		-e 's:"triplea":".triplea":g' \
		src/games/strategy/engine/framework/GameRunner.java || die

	rm lib/derby_10_1_2.jar || die
	rm -r old/ || die
	java-pkg_jar-from apple-java-extensions-bin AppleJavaExtensions.jar \
		lib/AppleJavaExtensions.jar
	java-pkg_jar-from commons-httpclient-3 commons-httpclient.jar \
		lib/commons-httpclient-3.0.1.jar
	java-pkg_jar-from commons-logging commons-logging.jar \
		lib/commons-logging-1.1.jar
	java-pkg_jar-from commons-codec commons-codec.jar \
		lib/commons-codec-1.3.jar
	# installs the test files
	java-pkg_jar-from --into lib junit
	# Needs the substance package
	#java-pkg_jar-from substance substance.jar \
	#	lib/substance_5_3.jar

	# also these from some other java package...
	#lib/mailapi.jar
	#lib/upnp.jar
	#lib/activation.jar
	#lib/smtp.jar

	#java-pkg_ensure-no-bundled-jars
}

src_compile() {
	eant || die
	echo "triplea.saveGamesInHomeDir=true" > data/triplea.properties
	# The only target creating this is zip which does unjar etc
	cd classes || die
	jar cf ../bin/triplea.jar * || die
	rm -r * || die
}

src_test() {
	ANT_TASKS="ant-junit" eant test
}

src_install() {
	insinto "${GAMES_DATADIR}"/${PN}
	doins -r assets bin data dice_servers maps

	java-pkg_regjar "${D}/${GAMES_DATADIR}"/${PN}/bin/*.jar
	java-pkg_dolauncher ${PN} -into "${GAMES_PREFIX}" \
		--java_args "-Xmx256m" --main \
		games.strategy.engine.framework.GameRunner
	java-pkg_dolauncher ${PN}-server -into "${GAMES_PREFIX}" \
		--java_args "-server -Xmx64m -Dtriplea.lobby.port=3303 -Dtriplea.lobby.console=true" \
		--main games.strategy.engine.lobby.server.LobbyServer

	newicon icons/triplea_icon.png ${PN}.png
	newicon icons/triplea_icon.png ${PN}-server.png
	make_desktop_entry ${PN} TripleA
	make_desktop_entry ${PN}-server TripleA-server

	dodoc changelog.txt TripleA_RuleBook.pdf
	dohtml -r doc/* readme.html
	prepgamesdirs
}