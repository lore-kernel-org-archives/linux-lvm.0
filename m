Received: from fentible.pjc.net (vpnuser1.surrey.redhat.com [172.16.9.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iATFa9lZ020572
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2004 15:36:09 GMT
Received: from patrick by fentible.pjc.net with local (Exim 4.34)
	id 1CYnZR-0007AY-Ct
	for linux-lvm@redhat.com; Mon, 29 Nov 2004 15:36:09 +0000
Resent-Message-ID: <20041129153609.GM16269@tykepenguin.com>
Resent-To: linux-lvm@redhat.com
Resent-To: debian-bugs-dist@lists.debian.org
Resent-Message-ID: <handler.283507.B.11017404994401@bugs.debian.org>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Antoine Comte <antoine@comte.cc>
Date: Mon, 29 Nov 2004 16:00:52 +0100
Message-Id: <E1CYn1I-0002Nl-Ll@comet.comte.cc>
Sender: ant <ant@comet.redhat.com>
Subject: [linux-lvm] Bug#283507: lvm2: snapshot module not loaded at boot
	time
Reply-To: Antoine Comte <antoine@comte.cc>, 283507@bugs.debian.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Debian Bug Tracking System <submit@bugs.debian.org>

Package: lvm2
Version: 2.00.24-1
Severity: normal

/etc/init.d/lvm script does not load the dm_snapshot module. One have to manualy load it in order to create/use snapshots



-- System Information:
Debian Release: 3.1
  APT prefers testing
  APT policy: (500, 'testing')
Architecture: i386 (i686)
Kernel: Linux 2.6.8-1-k7-smp
Locale: LANG=C, LC_CTYPE=C (charmap=ANSI_X3.4-1968)

Versions of packages lvm2 depends on:
ii  libc6                       2.3.2.ds1-18 GNU C Library: Shared libraries an
ii  libdevmapper1.00            2:1.00.19-2  The Linux Kernel Device Mapper use
ii  lvm-common                  1.5.17       The Logical Volume Manager for Lin

-- debconf information:
  lvm2/snapshots:
