Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r0RF9N8N013761
	for <linux-lvm@redhat.com>; Sun, 27 Jan 2013 10:09:23 -0500
Received: from mx.treblig.org (mx.treblig.org [80.68.94.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0RF9K36012171
	for <linux-lvm@redhat.com>; Sun, 27 Jan 2013 10:09:21 -0500
Received: from dg by mx.treblig.org with local (Exim 4.72)
	(envelope-from <dg@treblig.org>) id 1TzTrD-0005JA-Ud
	for linux-lvm@redhat.com; Sun, 27 Jan 2013 15:09:19 +0000
Date: Sun, 27 Jan 2013 15:09:19 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
Message-ID: <20130127150919.GA17782@gallifrey>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Help with a confused lv
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,
  I seem to have a rather confused lv that I could do with some help with.
I've got a simple MBR partition that's my pv, and on that I have a
single vg, inside which I have a bunch of LVs, some of which are
filesystems, and most are backing disks for virtual machines.

If I do any LVM command I'm getting errors; e.g.

root@major:~# pvdisplay
  /dev/main/Precise: read failed after 0 of 4096 at 6291390464: Input/output error
  /dev/main/Precise: read failed after 0 of 4096 at 6291447808: Input/output error
  /dev/main/Precise: read failed after 0 of 4096 at 0: Input/output error
  /dev/main/Precise: read failed after 0 of 4096 at 4096: Input/output error
  --- Physical volume ---
  PV Name               /dev/sda3
  VG Name               main
  PV Size               834.24 GiB / not usable 1.08 MiB
  Allocatable           yes 
  PE Size               4.00 MiB
  Total PE              213565
  Free PE               98231
  Allocated PE          115334
  PV UUID               oFAwO8-WRQK-Qhse-VPuS-b6RW-nP2N-aJDNCy
   

The backing disc is fine (no errors in dmesg, smartctl showing
no failures and no logged errors).

I created a new virtual machine (Precise) via virt-manager
and it created me the /dev/main/Precise lv but I think set up
as allocate on demand.  During the 1st boot of the VM lvm gave
an allocation error in dmesg, but as you can see there is plenty
of Free PE's on the PV: 

Jan 19 19:07:42 major vmunix: [  436.873411] device-mapper: snapshots: Invalidating snapshot: Unable to allocate exception.

I'm currently on the Ubuntu 3.8.0-2-generic kernel (on Raring) (was on 3.8.0-1 when
I got that exception).

I guess I have two questions:
  1) Why did it throw that exception?
  2) How do I clean this mess up?  Just delete the Precise lv?

root@major:~# vgdisplay
  /dev/main/Precise: read failed after 0 of 4096 at 6291390464: Input/output error
  /dev/main/Precise: read failed after 0 of 4096 at 6291447808: Input/output error
  /dev/main/Precise: read failed after 0 of 4096 at 0: Input/output error
  /dev/main/Precise: read failed after 0 of 4096 at 4096: Input/output error
  --- Volume group ---
  VG Name               main
  System ID             
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  22
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                13
  Open LV               2
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               834.24 GiB
  PE Size               4.00 MiB
  Total PE              213565
  Alloc PE / Size       115334 / 450.52 GiB
  Free  PE / Size       98231 / 383.71 GiB
  VG UUID               owLDAR-CJYp-2P1H-wzFf-DtHo-1mhW-FZfCv2


lvdisplay -a is showing (ignoring all the other lv's that are fine):

  --- Logical volume ---
  LV Path                /dev/main/Precise
  LV Name                Precise
  VG Name                main
  LV UUID                nkOTeb-0gA7-tIja-LQ1U-In1y-ftjv-rEsc6t
  LV Write Access        read/write
  LV Creation host, time major, 2013-01-19 19:05:56 +0000
  LV snapshot status     INACTIVE destination for Precise_vorigin
  LV Status              available
  # open                 0
  LV Size                5.86 GiB
  Current LE             1500
  COW-table size         4.00 MiB
  COW-table LE           1
  Snapshot chunk size    4.00 KiB
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:15

  --- Logical volume ---
  Internal LV Name       Precise_vorigin
  VG Name                main
  LV UUID                CgAoab-zm7j-rGpg-kFJ1-Ocdc-pMDw-KM04Gh
  LV Write Access        read/write
  LV Creation host, time major, 2013-01-19 19:05:56 +0000
  LV snapshot status     source of
                         Precise [INACTIVE]
  LV Status              available
  # open                 0
  LV Size                5.86 GiB
  Current LE             1500
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:13
   

dmsetup info is showing:
Name:              main-Precise
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      252, 15
Number of targets: 1
UUID: LVM-owLDARCJYp2P1HwzFfDtHo1mhWFZfCv2nkOTeb0gA7tIjaLQ1UIn1yftjvrEsc6t

Name:              main-Precise_vorigin-real
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        2
Event number:      0
Major, minor:      252, 12
Number of targets: 1
UUID: LVM-owLDARCJYp2P1HwzFfDtHo1mhWFZfCv2CgAoabzm7jrGpgkFJ1OcdcpMDwKM04Gh-real

Name:              main-Precise_vorigin
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      252, 13
Number of targets: 1
UUID: LVM-owLDARCJYp2P1HwzFfDtHo1mhWFZfCv2CgAoabzm7jrGpgkFJ1OcdcpMDwKM04Gh

Name:              main-Precise-cow
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      252, 14
Number of targets: 1
UUID: LVM-owLDARCJYp2P1HwzFfDtHo1mhWFZfCv2nkOTeb0gA7tIjaLQ1UIn1yftjvrEsc6t-cow


-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\ gro.gilbert @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
