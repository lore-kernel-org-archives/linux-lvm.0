Received: from fentible.pjc.net (vpnuser1.surrey.redhat.com [172.16.9.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i2PA3RJh004629
	for <linux-lvm@redhat.com>; Thu, 25 Mar 2004 10:03:27 GMT
Received: from patrick by fentible.pjc.net with local (Exim 4.30)
	id 1B6Rjz-0002hc-5F
	for linux-lvm@redhat.com; Thu, 25 Mar 2004 10:05:35 +0000
Resent-Message-ID: <20040325100535.GC7799@tykepenguin.com>
Resent-To: linux-lvm@redhat.com
Resent-To: debian-bugs-dist@lists.debian.org
Resent-Message-ID: <handler.240002.B.10802073449378@bugs.debian.org>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Daniel Burton <daniel@mothra.cable.nu>
Date: Thu, 25 Mar 2004 01:35:39 -0800
Message-Id: <E1B6RH1-0003W7-7X@mothra.cable.nu>
Subject: [linux-lvm] Bug#240002: lvm10: lvcreate fails
Reply-To: Daniel Burton <daniel@mothra.cable.nu>, 240002@bugs.debian.org,
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

Package: lvm10
Version: 1:1.0.8-2
Severity: normal


I am unable to create a new logical volume.  I get the following
messsages:

mothra:/home/daniel# lvcreate -n harvester -L 5G vg0
lvcreate -- ERROR "pv_status_all_pv_of_vg(): no PV" getting status of
volume group "vg0" from kernel

-- System Information:
Debian Release: testing/unstable
  APT prefers testing
  APT policy: (500, 'testing')
Architecture: i386 (i686)
Kernel: Linux 2.4.25
Locale: LANG=C, LC_CTYPE=C

Versions of packages lvm10 depends on:
ii  debconf                     1.4.16       Debian configuration management sy
ii  file                        4.07-2       Determines file type using "magic"
ii  libc6                       2.3.2.ds1-11 GNU C Library: Shared libraries an
ii  lvm-common                  1.5.12       The Logical Volume Manager for Lin

-- debconf information:
* lvm10/warning: 
