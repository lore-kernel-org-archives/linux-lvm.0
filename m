Received: from agrover.com (ovpn-113-45.phx2.redhat.com [10.3.113.45])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q8EHsmCH028837
	for <linux-lvm@redhat.com>; Fri, 14 Sep 2012 13:54:48 -0400
From: Andy Grover <agrover@redhat.com>
Date: Fri, 14 Sep 2012 10:54:38 -0700
Message-Id: <1347645284-13738-1-git-send-email-agrover@redhat.com>
Subject: [linux-lvm] [PATCH 0/6] Integrate python-lvm into lvm2
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi all,

This patch series integrates python-lvm, a Python wrapper for liblvm2app.so,
into the lvm2 code base. python-lvm has lived out-of-tree here for a while:

https://github.com/agrover/python-lvm

Integrating it into lvm2 will ensure it tracks changes in the liblvm API,
and make building and testing easier.

We add a --enable-python-bindings option to ./configure, as well as an
install_python_bindings make target. Building with this option enabled will
require that python-devel and python-setuptools are also installed.

Please review. git request-pull output follows.

Thanks -- Regards -- Andy

The following changes since commit 5cdd7848f46305d3d5744c194d4e2d38b78f0ec7:

  TEST:  Add missing test for RAID module version (2012-09-12 06:27:37 -0500)

are available in the git repository at:
  git://fedorapeople.org/home/fedora/grover/public_git/lvm2.git for-upstream

Andy Grover (6):
      python-lvm: initial checkin
      python-lvm: A start at a python-lvm test framework
      python-lvm: setup.py
      python-lvm: liblvm/python/Makefile.in
      python-lvm: configure.in changes
      python-lvm: Other Makefile.in changes

 Makefile.in               |    3 +
 configure.in              |    9 +
 liblvm/Makefile.in        |    6 +-
 liblvm/python/Makefile.in |   30 ++
 liblvm/python/liblvm.c    | 1206 +++++++++++++++++++++++++++++++++++++++++++++
 liblvm/python/setup.py    |   17 +
 liblvm/python/test.py     |   42 ++
 7 files changed, 1312 insertions(+), 1 deletions(-)
 create mode 100644 liblvm/python/Makefile.in
 create mode 100644 liblvm/python/liblvm.c
 create mode 100644 liblvm/python/setup.py
 create mode 100644 liblvm/python/test.py
