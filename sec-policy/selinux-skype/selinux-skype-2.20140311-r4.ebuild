# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-skype/selinux-skype-2.20140311-r4.ebuild,v 1.1 2014/08/01 21:04:45 swift Exp $
EAPI="5"

IUSE="alsa"
MODS="skype"
BASEPOL="2.20140311-r4"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for skype"

KEYWORDS="~amd64 ~x86"
DEPEND="${DEPEND}
	sec-policy/selinux-xserver
"
RDEPEND="${DEPEND}"
