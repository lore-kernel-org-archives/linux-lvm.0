Message-ID: <20011126043340.82336.qmail@web12304.mail.yahoo.com>
From: Lars Kellogg-Stedman <thelars@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Here we go again: vgscan doesn't see my volume groups.
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sun Nov 25 22:32:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Everything was working great...

Without too much backstory, I'm stuck in a minimal shell in an initrd
and can't boot.  I've got a single volume group (formerly two volume
groups, vgmerged together) that contains, among other things, my root
volume.  Help!

This is a different problem than what I encountered earlier, which
appeared to be a problem with software RAID devices that went away when
I upgraded to the latest code from CVS.  I'm now using whatever was in
CVS as of Monday Nov. 19.

The pv's that make up this volume group are /dev/sde3, /dev/sde4, and
/dev/md0.  According to pvscan, they're all present and accounted for:

  pvscan -- inactive PV "/dev/md0"   is associated to an unknown VG
(run vgscan)
  pvscan -- inactive PV "/dev/sde3"   is associated to an unknown VG
(run vgscan)
  pvscan -- inactive PV "/dev/sde4"   is associated to an unknown VG
(run vgscan)

But vgscan doesn't find the volume group.  pvdisplay for each pv:

  --- Physical volume ---
  PV Name               /dev/sde3
  VG Name               vg-0
  PV Size               4.40 GB / NOT usable 6.59 MB [LVM: 128.00 KB]
  PV#                   2
  PV Status             NOT available
  Allocatable           yes
  Cur LV                0
  PE Size (KByte)       4096
  Total PE              1124
  Free PE               1124
  Allocated PE          0
  PV UUID               gb2KSo-B62e-NbC8-Ja4R-1n6G-CYP1-aJiO38

  --- Physical volume ---
  PV Name               /dev/sde4
  VG Name               vg-0
  PV Size               11.81 GB / NOT usable 7.82 MB [LVM: 135.00 KB]
  PV#                   1
  PV Status             available
  Allocatable           yes
  Cur LV                2
  PE Size (KByte)       4096
  Total PE              3022
  Free PE               1397
  Allocated PE          1625
  PV UUID               u28il4-d2tR-AkpG-t9EL-DjVQ-epKy-S05nIl

  --- Physical volume ---
  PV Name               /dev/md0
  VG Name               vg-0
  PV Size               8.48 GB / NOT usable 2.75 MB [LVM: 129.00 KB]
  PV#                   3
  PV Status             available
  Allocatable           yes (but full)
  Cur LV                1
  PE Size (KByte)       4096
  Total PE              2169
  Free PE               0
  Allocated PE          2169
  PV UUID               HHv1Tm-79Hx-uk4m-caqb-QUA5-8WGF-0yUe4Q

Is there anything I can do to make this volume group available?

-- Lars


=====
lars@larsshack.org

__________________________________________________
Do You Yahoo!?
Yahoo! GeoCities - quick and easy web site hosting, just $8.95/month.
http://geocities.yahoo.com/ps/info1
