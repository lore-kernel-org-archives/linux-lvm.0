Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0QJd4108987
	for <linux-lvm@redhat.com>; Thu, 26 Jan 2006 14:39:04 -0500
Received: from chiark.greenend.org.uk (mail@chiark.greenend.org.uk
	[193.201.200.170])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0QJd3Tv017721
	for <linux-lvm@redhat.com>; Thu, 26 Jan 2006 14:39:03 -0500
Received: from [172.17.207.1] (helo=sfere.anjou.terraraq.org.uk)
	by chiark.greenend.org.uk (Debian Exim 3.35 #1) with esmtp
	(return-path richard@sfere.greenend.org.uk) id 1F2CxR-0004yU-00
	for linux-lvm@redhat.com; Thu, 26 Jan 2006 19:39:01 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <wwvwtgmrd81.fsf@rjk.greenend.org.uk>
Date: Thu, 26 Jan 2006 19:38:54 +0000
From: Richard Kettlewell <rjk@greenend.org.uk>
Subject: [linux-lvm] hang creating snapshot in Linux 2.6.15.1
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

Every time I try to create a snapshot of my /var, the system hangs.
But if I try to snapshot other filesystems, it does not.  The same
version seems to work completely OK for me on a different computer.

The system isn't quite locked solid: for instance a pre-existing bash
in another VC is able to run builtin commands and fork subprocesses.
I straced one and it got to exit_group(), but its parent shell did not
act on its termination.  ping still gets a response.  CTRL-ALT-DEL is
ignored.  If I try to log in on a VC it accepts my username but never
prompts for a password.

After rebooting the snapshot exists and has the expected contents.

I've tried the following combinations so far, all with the same effect:

  lvcreate --size 1000M --snapshot --name snapvar /dev/sfere/var
  lvcreate --permission r --size 1000M --snapshot --name snapvar /dev/sfere/var
  lvcreate --permission r --size 200M --snapshot --name snapvar /dev/sfere/var

---+ LVM state

sfere$ really lvdisplay /dev/sfere/var
  --- Logical volume ---
  LV Name                /dev/sfere/var
  VG Name                sfere
  LV UUID                000000-0000-0000-0000-0000-0000-000000
  LV Write Access        read/write
  LV snapshot status     source of
                         /dev/sfere/snapvar [active]
  LV Status              available
  # open                 1
  LV Size                1.00 GB
  Current LE             256
  Segments               1
  Allocation             normal
  Read ahead sectors     1024
  Block device           254:3

sfere$ really lvdisplay /dev/sfere/snapvar
  --- Logical volume ---
  LV Name                /dev/sfere/snapvar
  VG Name                sfere
  LV UUID                cyRkZq-6Ef0-r3gq-1AW7-3RuD-0bwY-LPySj3
  LV Write Access        read only
  LV snapshot status     active destination for /dev/sfere/var
  LV Status              available
  # open                 0
  LV Size                1.00 GB
  Current LE             256
  Segments               1
  Snapshot chunk size    8.00 KB
  Allocated to snapshot  4.07%
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:2

sfere$ really vgdisplay
  --- Volume group ---
  VG Name               sfere
  System ID             (none)1060895763
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  22
  VG Access             read/write
  VG Status             resizable
  MAX LV                256
  Cur LV                6
  Open LV               5
  Max PV                256
  Cur PV                1
  Act PV                1
  VG Size               108.74 GB
  PE Size               4.00 MB
  Total PE              27838
  Alloc PE / Size       26674 / 104.20 GB
  Free  PE / Size       1164 / 4.55 GB
  VG UUID               Q67K3S-qn6q-3bK9-uW9o-8z1v-TJYw-cWf2E5

sfere$ really pvdisplay
  --- Physical volume ---
  PV Name               /dev/hda4
  VG Name               sfere
  PV Size               108.74 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              27838
  Free PE               1164
  Allocated PE          26674
  PV UUID               tZDvzA-ecVR-Ktk5-5ymd-UkKp-z54p-pc9Pet

sfere$ df -m /var
Filesystem           1M-blocks      Used Available Use% Mounted on
/dev/mapper/sfere-var
                          1008       414       543  44% /var

---+ Verson numbers:

Linux sfere 2.6.15.1 #1 Sun Jan 15 17:25:20 GMT 2006 i686 GNU/Linux

ii  lvm-common     1.5.17         The Logical Volume Manager for Linux (common
ii  lvm10          1.0.8-8        The Logical Volume Manager for Linux
ii  lvm2           2.01.04-5      The Linux Logical Volume Manager

The hardware is an early Athlon (bought in 2000 IIRC) with an MSI
motherboard and a Maxtor hard disk.  It's a domestic mail/news/etc
server, and not very heavily loaded.

ttfn/rjk
