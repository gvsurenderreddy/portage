# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/android-ndk/android-ndk-5c.ebuild,v 1.3 2012/08/13 18:00:13 cardoe Exp $

EAPI=3

MY_P="${PN}-r${PV}"

DESCRIPTION="Open Handset Alliance's Android NDK (Native Dev Kit)"
HOMEPAGE="http://developer.android.com/sdk/ndk/"
SRC_URI="http://dl.google.com/android/ndk/${MY_P}-linux-x86.tar.bz2"

LICENSE="android"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror strip installsources test"

DEPEND=""
RDEPEND=">=dev-util/android-sdk-update-manager-10
	>=sys-devel/make-3.81"

S="${WORKDIR}/${MY_P}"

ANDROID_NDK_DIR="opt/${PN}"

ANDROID_TC_ARM_EABI="${ANDROID_NDK_DIR}/toolchains/arm-eabi-4.4.0/prebuilt/linux-x86"
ANDROID_TC_ANDROID_EABI="${ANDROID_NDK_DIR}/toolchains/arm-linux-androideabi-4.4.3/prebuilt/linux-x86"

QA_PREBUILT="*"

src_configure() {
	:
}

src_compile() {
	:
}

src_install() {
	dodir "/${ANDROID_NDK_DIR}"
	cp -pPR * "${ED}/${ANDROID_NDK_DIR}"

	fowners -R root:android "/${ANDROID_NDK_DIR}"
	fperms 0775 "/${ANDROID_NDK_DIR}/"{,build,docs,platforms,samples}
	fperms 0775 "/${ANDROID_NDK_DIR}/"{sources,tests,toolchains}

	dodir "/${ANDROID_NDK_DIR}/out"
	fowners root:android "/${ANDROID_NDK_DIR}/out"
	fperms 3775 "/${ANDROID_NDK_DIR}/out"

	printf '%s' \
		"PATH=\"${EPREFIX}/${ANDROID_NDK_DIR}:" \
		"${EPREFIX}/${ANDROID_TC_ARM_EABI}/bin/:" \
		"${EPREFIX}/${ANDROID_TC_ANDROID_EABI}/bin/\"" \
		$'\n' \
		> "${T}/80${PN}"  || die

	doenvd "${T}/80${PN}" || die

	echo "SEARCH_DIRS_MASK=\"${EPREFIX}/${ANDROID_NDK_DIR}\"" \
		> "${T}/80${PN}" || die
	insinto "/etc/revdep-rebuild"
	doins "${T}/80${PN}"
}