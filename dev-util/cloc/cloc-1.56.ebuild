# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Count Lines of Code"
HOMEPAGE="http://cloc.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.pl"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/perl-5.6"

S=${WORKDIR}

src_unpack() { :; }

src_install() {
	newbin "${DISTDIR}"/${P}.pl ${PN}
}