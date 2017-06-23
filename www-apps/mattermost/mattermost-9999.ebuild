# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Mattermost - Open source, private cloud Slack-alternative"
HOMEPAGE="https://about.mattermost.com"

if [ ${PV} == "9999" ] ; then
	inherit golang-build git-r3
	EGIT_REPO_URI="https://github.com/mattermost/platform.git"
else
	SRC_URI="https://github.com/mattermost/platform/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="*"
fi

LICENSE="AGPL-3 Apache-2.0"
SLOT="0"
IUSE=""

DEPEND="sys-apps/yarn
		dev-lang/go"
RDEPEND="${DEPEND}"

src_unpack() {

	if [ ${PV} == "9999" ] ; then
		git-r3_src_unpack
	else
		unpack ${A}
	fi
}

