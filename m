Received: from fentible.pjc.net (vpnuser9.surrey.redhat.com [172.16.9.9])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i9S7UuX7019304
	for <linux-lvm@redhat.com>; Thu, 28 Oct 2004 08:30:56 +0100
Received: from patrick by fentible.pjc.net with local (Exim 4.34)
	id 1CN4kQ-0007Gw-No
	for linux-lvm@redhat.com; Thu, 28 Oct 2004 08:31:02 +0100
Resent-Message-ID: <20041028073102.GA27043@tykepenguin.com>
Resent-To: linux-lvm@redhat.com
Resent-To: debian-bugs-dist@lists.debian.org
Resent-Message-ID: <handler.278606.B.109894297823788@bugs.debian.org>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: lvm2 <sam@vilain.net>
Date: Thu, 28 Oct 2004 18:55:43 +1300
Message-Id: <E1CN3GB-0004i8-6C@samv.private.marketview.co.nz>
Subject: [linux-lvm] Bug#278606: LV names with hyphens don't work
Reply-To: lvm2 <sam@vilain.net>, 278606@bugs.debian.org,
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

Hi there,

I just created an LV with a hyphen, and it had all sorts of problems
when I went to remove it - I couldn't remove the mount point directory
(rmdir returned EBUSY), and I couldn't remove it with lvremove (it said
the volume was active).  I eventually had to reboot to clear the bung
references in the kernel.

If there is no upstream fix ready, may I humbly suggest disallowing
hyphens in lvcreate without a special force option.  I can probably
provide a patch if required.

Cheers,
Sam.

-- System Information:
Debian Release: testing/unstable
  APT prefers unstable
  APT policy: (500, 'unstable'), (500, 'testing')
Architecture: i386 (i686)
Kernel: Linux 2.6.9-final-vs1.9.3-rc3
Locale: LANG=C, LC_CTYPE=C

Versions of packages lvm2 depends on:
ii  libc6                       2.3.2.ds1-12 GNU C Library: Shared libraries an
ii  libdevmapper1.00            2:1.00.19-2  The Linux Kernel Device Mapper use
ii  lvm-common                  1.5.17       The Logical Volume Manager for Lin

-- debconf information excluded
