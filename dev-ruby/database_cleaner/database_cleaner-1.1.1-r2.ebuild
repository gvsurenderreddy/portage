# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/database_cleaner/database_cleaner-1.1.1-r2.ebuild,v 1.2 2014/04/24 16:57:50 mrueg Exp $

EAPI=5

USE_RUBY="ruby19"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_TASK_DOC="examples"

RUBY_FAKEGEM_EXTRADOC="History.rdoc README.markdown TODO"

# There are specs and features but they all require configured databases.
RUBY_FAKEGEM_RECIPE_TEST="none"

inherit ruby-fakegem

DESCRIPTION="Strategies for cleaning databases"
HOMEPAGE="http://github.com/bmabey/database_cleaner"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""
