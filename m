Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2PDHkO20584
	for <linux-lvm@redhat.com>; Fri, 25 Mar 2005 08:17:46 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.198])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2PDHe1X014600
	for <linux-lvm@redhat.com>; Fri, 25 Mar 2005 08:17:41 -0500
Received: by rproxy.gmail.com with SMTP id r35so767678rna
	for <linux-lvm@redhat.com>; Fri, 25 Mar 2005 05:17:40 -0800 (PST)
Message-ID: <bf024e90050325051721be1579@mail.gmail.com>
Date: Fri, 25 Mar 2005 14:17:40 +0100
From: <talosso@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vg OK --> reboot --> vg KO
Reply-To: talosso@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

I got stuck in a painful problem with lvm.
I have 4 SATA HD handled by lvm as physical volumes into one large
logical volume. 
Everything worked nice, until the last reboot.

A couple of info on the configuration:

root # lvmdiskscan
  /dev/cdrom [      492.05 MB]
  /dev/hda1  [      190.94 MB]
  /dev/sda1  [      189.92 GB]
  /dev/hda2  [       17.51 GB]
  /dev/hda3  [      973.05 MB]
  /dev/sdb1  [      189.92 GB]
  /dev/sdc   [      189.92 GB] LVM physical volume
  /dev/sdd   [      189.92 GB] LVM physical volume
  1 disk
  5 partitions
  2 LVM physical volume whole disks
  0 LVM physical volumes

Ok, /dev/hda is the system disk and it's not managed by lvm, thus the
four HD are the /dev/sd*. As you can see the first two devices have
one partition each, while the last two don't have it. The big lvm
volume group (disks_vg) was created at first using the two disks
/dev/sda and /dev/sdb, where I create the two physical volumes. 
Later the other two disks has been added to the volume group and
accordingly the logical volume has been extended.
Well, this was the story and everything worked fine.
Then I rebooted and after that I find out that my volume group has not
been created...

root # vgdisplay -v
  Finding all volume groups
  Finding volume group "disks_vg"
Couldn't find device with uuid 'XBrEsM-mSRT-vuDl-XwxU-Ae5Q-kIQr-nkm4gi'.
Couldn't find all physical volumes for volume group disks_vg.
Couldn't find device with uuid 'XBrEsM-mSRT-vuDl-XwxU-Ae5Q-kIQr-nkm4gi'.
Couldn't find all physical volumes for volume group disks_vg.
Volume group "disks_vg" doesn't exist

and when I check the physical volumes I get the following message:

root # pvdisplay -v
    Scanning for physical volume names
  Couldn't find device with uuid 'XBrEsM-mSRT-vuDl-XwxU-Ae5Q-kIQr-nkm4gi'.
  Couldn't find device with uuid 'ChG7VP-E1Bn-EUY3-krvx-2NJu-iHiC-0ByaEZ'.
  Couldn't find device with uuid 'XBrEsM-mSRT-vuDl-XwxU-Ae5Q-kIQr-nkm4gi'.
  Couldn't find device with uuid 'ChG7VP-E1Bn-EUY3-krvx-2NJu-iHiC-0ByaEZ'.
  --- Physical volume ---
  PV Name               unknown device
  VG Name               disks_vg
  PV Size               189.92 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              48620
  Free PE               0
  Allocated PE          48620
  PV UUID               XBrEsM-mSRT-vuDl-XwxU-Ae5Q-kIQr-nkm4gi

  --- Physical volume ---
  PV Name               unknown device
  VG Name               disks_vg
  PV Size               189.92 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              48620
  Free PE               0
  Allocated PE          48620
  PV UUID               ChG7VP-E1Bn-EUY3-krvx-2NJu-iHiC-0ByaEZ

  --- Physical volume ---
  PV Name               /dev/sdc
  VG Name               disks_vg
  PV Size               189.92 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              48620
  Free PE               0
  Allocated PE          48620
  PV UUID               Sh64Kk-w7Ac-FFpj-v2ck-3XKT-sdbc-VuYozC

  --- Physical volume ---
  PV Name               /dev/sdd
  VG Name               disks_vg
  PV Size               189.92 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              48620
  Free PE               0
  Allocated PE          48620
  PV UUID               hilXy6-nvxA-xMxQ-Wrht-gRM6-ltfU-4gt8SJ

I think that the volume is still recoverable (that is what I need) and
that something damaged the first bytes of the first two physical
volumes... but after all I'm not so sure.
Can anybody help me recovering the LVM volume and thus my data?
Thanks a lot

Best regards.

Livio
