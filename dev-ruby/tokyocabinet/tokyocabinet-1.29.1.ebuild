# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/tokyocabinet/tokyocabinet-1.29.1.ebuild,v 1.3 2014/04/24 20:20:45 mrueg Exp $

EAPI=5

USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Ruby bindings for Tokyo Cabinet"
HOMEPAGE="http://fallabs.com/tokyocabinet/"
LICENSE="GPL-2"

KEYWORDS="~amd64 ~ppc ~x86"
SLOT="0"
IUSE=""

RDEPEND+="dev-db/tokyocabinet"

each_ruby_configure() {
	${RUBY} extconf.rb || die
}

each_ruby_compile() {
	emake V=1
}

each_ruby_install() {
	emake install DESTDIR="${D}"

	each_fakegem_install
}
