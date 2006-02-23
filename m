Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1NGtQ108801
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2006 11:55:26 -0500
Received: from colossus.clanbiotech.it (host-84-235-131-214.satlynx.net
	[84.235.131.214])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1NGtGiE025948
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2006 11:55:21 -0500
Message-ID: <43FDE8BD.2050904@tiscali.co.uk>
Date: Thu, 23 Feb 2006 17:54:21 +0100
From: justin <clancyj@tiscali.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Persistence of disk-based LVM data after rebuild
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi guys,

I came across a weird problem with LVM after a server rebuild.  I
thought you might like to know about it.

Details:

  LVM version:     2.01.14 (2005-08-04)
  Library version: 1.01.04 (2005-08-02)
  Driver version:  4.4.0

  SUSE 10 with 2.6.13-15-default kernel.

I had two PVs (/dev/hdc2 and /dev/hdd2) in a VG called vg01 on the
original system.  After the rebuild I assigned the first partition of
each disk to swap (as before) and the other two partitions to a raid
mirror and an LV.

Everything worked well until I tried to issue commands like vgdisplay,
when I got messages like the following:

  LV work: inconsistent LE count 16 != 32

  Internal error: LV segments corrupted in work.

  Volume group "vg01" doesn't exist


...which, of course, it didn't anymore.  I did an strace on vgdisplay to
see where the data came from and saw that it was the first partition of
each disk.  I took the swap offline and issued the command:

dd if=/dev/zero of=/dev/hdc1 count=10

...on each disk to zap out any metadata on those partitions.  Now it's fine.

Any comments?

  Regards,

    Justin.
