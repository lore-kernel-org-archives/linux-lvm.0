Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3KKPgjh000729
	for <linux-lvm@redhat.com>; Thu, 20 Apr 2006 16:25:42 -0400
Received: from smtp-out1.email.it (smtp-out1.email.it [80.247.70.36])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3KKPYxR006950
	for <linux-lvm@redhat.com>; Thu, 20 Apr 2006 16:25:34 -0400
Received: from [192.168.2.2] (host210-57.pool8711.interbusiness.it
	[87.11.57.210])by smtp-out1.email.it (Email.it) with ESMTP id
	58E7A1C8149for <linux-lvm@redhat.com>;
	Thu, 20 Apr 2006 22:25:32 +0200 (CEST)
Subject: Re: [linux-lvm] LVM2 release 2.02.03 / device-mapper 1.02.04
From: Simone Gotti <simone.gotti@email.it>
In-Reply-To: <20060414214357.GE4521@agk.surrey.redhat.com>
References: <20060414214357.GE4521@agk.surrey.redhat.com>
Date: Thu, 20 Apr 2006 22:25:32 +0200
Message-Id: <1145564732.2658.15.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2006-04-14 at 22:43 +0100, Alasdair G Kergon wrote:
> Some bug fixes and minor enhancements. (See the WHATS_NEW files.)
> 
>   ftp://sources.redhat.com/pub/dm/device-mapper.1.02.04.tgz
>   ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.03.tgz
> 
> The tools should cope better now if faced with multiple distinct
> VGs with the same name.  'pvs -P /dev/whatever -o+vg_uuid' output
> should be reliable, and vgrename accepts a VG uuid as first
> argument.
> 
> And libdevmapper has support again for older 2.6 kernels that 
> can't handle mapped device referencing by device number.
> 
> Alasdair

Hi All,

Last day I tried out these new versions but the new lvm2 release gave me
some issues. I was thinking that it was a my compilation mistake but
today I updated my fedora rawhide and the latest version of lvm2
(2.02.04) was installed and I had the same problems.
Here's the list of actions I did to create the pv, vg and lv and some
tries to activate them:

==============================================================================
[root@localhost ~]# pvcreate /dev/hda10
  Physical volume "/dev/hda10" successfully created

[root@localhost ~]# vgcreate vg_test01 /dev/hda10
  Volume group "vg_test01" successfully created

[root@localhost ~]# lvcreate -L 500m -n lv_test01 vg_test01
  Volume group for uuid not found:
gqq5eaIEAauBYPjLXWZ51b38BRXjYKbNTQVtf2rw5RkX7KIvU4d3bGfHZGhF6QVk
  Failed to activate new LV.

[root@localhost ~]# lvdisplay
  --- Logical volume ---
  LV Name                /dev/vg_test01/lv_test01
  VG Name                vg_test01
  LV UUID                TQVtf2-rw5R-kX7K-IvU4-d3bG-fHZG-hF6QVk
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                500.00 MB
  Current LE             125
  Segments               1
  Allocation             inherit
  Read ahead sectors     0

[root@localhost ~]# lvchange -ay /dev/vg_test01/lv_test01
  Volume group for uuid not found:
gqq5eaIEAauBYPjLXWZ51b38BRXjYKbNTQVtf2rw5RkX7KIvU4d3bGfHZGhF6QVk

[root@localhost ~]# lvremove /dev/vg_test01/lv_test01
  Volume group for uuid not found:
gqq5eaIEAauBYPjLXWZ51b38BRXjYKbNTQVtf2rw5RkX7KIvU4d3bGfHZGhF6QVk
  Unable to deactivate logical volume "lv_test01"

[root@localhost ~]# vgchange -ay vg_test01
  Volume group for uuid not found:
SJoVm40jn03BxZ8KWAOLIp9QyWH3RBRKQElo5tpSIeGayuMmV56DHxzSdBC94hkY
  0 logical volume(s) in volume group "vg_test01" now active

===============================================================================

The volume and also the volume group cannot be activated or removed.

Some more informations:

[root@localhost ~]# pvdisplay
  --- Physical volume ---
  PV Name               /dev/hda10
  VG Name               vg_test01
  PV Size               964.00 MB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              241
  Free PE               116
  Allocated PE          125
  PV UUID               hWTMJb-d8C7-85R2-eikX-u91F-4gAk-EU3hUV

[root@localhost ~]# vgdisplay
  --- Volume group ---
  VG Name               vg_test01
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  2
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               964.00 MB
  PE Size               4.00 MB
  Total PE              241
  Alloc PE / Size       125 / 500.00 MB
  Free  PE / Size       116 / 464.00 MB
  VG UUID               SJoVm4-0jn0-3BxZ-8KWA-OLIp-9QyW-H3RBRK

[root@localhost ~]# lvdisplay
  --- Logical volume ---
  LV Name                /dev/vg_test01/lv_test01
  VG Name                vg_test01
  LV UUID                QElo5t-pSIe-Gayu-MmV5-6DHx-zSdB-C94hkY
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                500.00 MB
  Current LE             125
  Segments               1
  Allocation             inherit
  Read ahead sectors     0


Going back to a previous version of lvm (a CVS snapshot previous to the
cache changes) everything worked again.

Let me know if this is a my mistake or how can help you debugging the
problem.

Thanks!

Bye!



 
 
 --
 Email.it, the professional e-mail, gratis per te: http://www.email.it/f
 
 Sponsor:
 Conto Arancio, il migliore amico dei tuoi risparmi.Prova la differenza!
 Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=5040&d=20-4
