Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 186111908F
	for <linux-lvm@redhat.com>; Sat, 11 May 2019 22:49:25 +0000 (UTC)
Received: from vmail2.net-works.at (vmail2.net-works.at [5.9.13.143])
	by mx1.redhat.com (Postfix) with ESMTP id C18D93082E55
	for <linux-lvm@redhat.com>; Sat, 11 May 2019 22:49:23 +0000 (UTC)
Received: from vmail2.net-works.at (localhost [127.0.0.1])
	by vmail2.net-works.at (Postfix) with ESMTP id 70325209
	for <linux-lvm@redhat.com>; Sun, 12 May 2019 00:52:49 +0200 (CEST)
Received: from service.net-works.at (unknown [10.9.13.155])
	by vmail2.net-works.at (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Sat, 11 May 2019 22:52:49 +0000 (UTC)
Message-ID: <3f6f98d1b5184853cf48b1f84337af83.squirrel@service.net-works.at>
Date: Sun, 12 May 2019 00:52:49 +0200
From: =?utf-8?B?IlJhaW5lciBGw7xnZW5zdGVpbiI=?= <rfu@oudeis.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] recover volume group & locical volumes from PV?
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

hi,

I am (was) using Fedora 28 installed in several LVs on /dev/sda5 (= PV),
where sda is a "big" SSD.

by accident, I attached (via SATA hot swap bay) an old harddisk
(/dev/sdc1), which was used about 2 months temporarily to move the volume
group / logical volumes from the "old" SSD to the "new" SSD (pvadd,
pvmove, ...)

this combination of old PV and new PV messed up the filesystems. when I
noticed the mistake, I did a shutdown and physically removed /dev/sdc.
this also removed VG and LVs on /dev/sda5, causing the system crash on
boot.

the layout was something like this:

/dev/sda3 ==> /boot
/dev/fedora_sh64/lv_home
/dev/fedora_sh64/lv_root
/dev/fedora_sh64/lv_var
...

[root@localhost-live ~]# pvs
  PV         VG Fmt  Attr PSize   PFree
  /dev/sda5     lvm2 ---  <47.30g <47.30g

[root@localhost-live ~]# pvdisplay
  "/dev/sda5" is a new physical volume of "<47.30 GiB"
  --- NEW Physical volume ---
  PV Name               /dev/sda5
  VG Name
  PV Size               <47.30 GiB
  Allocatable           NO
  PE Size               0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               EOi5Ln-W26D-SER2-tLke-xNMP-Prgq-aUfLPz

(please note "NEW Physical Volume" ?!?!)

[root@localhost-live ~]# vgdisplay
[root@localhost-live ~]# lvdisplay

[root@localhost-live ~]# pvscan
  PV /dev/sda5                      lvm2 [<47.30 GiB]
  Total: 1 [<47.30 GiB] / in use: 0 [0   ] / in no VG: 1 [<47.30 GiB]

[root@localhost-live ~]# pvck /dev/sda5
  Found label on /dev/sda5, sector 1, type=LVM2 001
  Found text metadata area: offset=4096, size=1044480

after re-adding the old /dev/sdc1 disk, VG and LVs show up, filesystems a
bit damaged, but readable. content is about two months old.

[root@localhost-live ~]# pvs
  PV         VG              Fmt  Attr PSize    PFree
  /dev/sda5                  lvm2 ---   <47.30g <47.30g
  /dev/sdc1  fedora_sh64     lvm2 a--  <298.09g 273.30g

is there any chance to get VG and LVs back?

thanks in advance.
