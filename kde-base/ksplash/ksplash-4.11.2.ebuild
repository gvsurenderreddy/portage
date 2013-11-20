# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/ksplash/ksplash-4.11.2.ebuild,v 1.1 2013/10/09 23:04:25 creffett Exp $

EAPI=5

DECLARATIVE_REQUIRED="always"
KMNAME="kde-workspace"
inherit kde4-meta

DESCRIPTION="KDE splashscreen framework (the splashscreen of KDE itself, not of individual apps)"
KEYWORDS=" ~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="3dnow altivec debug mmx sse sse2 xinerama"

COMMONDEPEND="
	media-libs/libpng:0=
	virtual/jpeg:0
	x11-libs/libX11
	x11-libs/libXext
	xinerama? ( x11-libs/libXinerama )
"
DEPEND="${COMMONDEPEND}
	xinerama? ( x11-proto/xineramaproto )
"
RDEPEND="${COMMONDEPEND}"

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_has 3dnow X86_3DNOW)
		$(cmake-utils_use_has altivec PPC_ALTIVEC)
		$(cmake-utils_use_has mmx X86_MMX)
		$(cmake-utils_use_has sse X86_SSE)
		$(cmake-utils_use_has sse2 X86_SSE2)
		$(cmake-utils_use_with xinerama)
	)

	kde4-meta_src_configure
}