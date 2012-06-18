# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A statically typed, imperative programming language."
HOMEPAGE="http://nimrod-code.org"
SRC_URI="http://nimrod-code.org/download/nimrod_${PV}.zip"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND=""
DEPEND="app-arch/unzip"

S="${WORKDIR}/nimrod"

src_unpack() {
    unpack ${A}
    cd "${S}"

    mv build/2_1 build/linux_i386 || die
    mv build/2_2 build/linux_x86_64 || die

    epatch "${FILESDIR}"/${P}-use-makefile.patch
}

src_compile() {
    emake || die
}

src_install() {
    dobin bin/nimrod || die

    if use doc; then
        for d in "doc/*.html"; do
            dohtml $d || die
        done
    fi
}
