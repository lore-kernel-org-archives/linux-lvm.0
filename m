From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] [newbie] name changes in physial volumes
In-Reply-To: <200210131526.48573.frank.vandamme@student.kuleuven.ac.be>
Message-ID: <Pine.LNX.4.44.0210132102040.13779-100000@pzat.meep.org>
MIME-Version: 1.0
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
Date: Sun Oct 13 16:31:24 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Van Damme <frank.vandamme@student.kuleuven.ac.be>
Cc: linux-lvm@sistina.com

Ok there are a number of questions in that one.

PV = Physical Volume
VG = Volume Group
LV = Logical Volume

Answer 1

Basically So long as the data does not change LVM will not care about
where the PV is in the partion table.

Answer 2

Just removing a PV (via the partition table) may cause LVM a problem.
Why do I say May?

1) If the PV was part of a VG which spanned multipe PVs that VG would no
longer be mountable, and you would have problems recovering any LV in that
volume group (others can tell you how...)

2) If that PV was in a VG of its own just that VG and all the LVs in it
would be lost.

----

The "safe" way to remove a PV.

pvchange -x n <PV device>
lvmove or lvremove the LVs on that PV
(Use pvdisplay -v <PV device> to see what LVs are on the physical device)
Example.... Below be sure to use | more ...
you can see from the example video2 video3 and var are on that PV...

When the PV is empty you can use vgreduce <pv device> to remove it...
then you can realloc that space to dos...

James




--- Physical volume ---
PV Name               /dev/ide/host0/bus1/target0/lun0/part1
VG Name               sunrise_vg
PV Size               93.16 GB [195371505 secs] / NOT usable 32.18 MB
[LVM: 135
KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                3
PE Size (KByte)       32768
Total PE              2980
Free PE               0
Allocated PE          2980
PV UUID               qLorjX-zpVw-UD1N-Kq5k-c4UR-vqMG-O76jgh

   --- Distribution of physical volume ---
   LV Name                   LE of LV  PE for LV
   /dev/sunrise_vg/video2_lv 2560      2560
   /dev/sunrise_vg/var_lv    8         8
   /dev/sunrise_vg/video3_lv 1677      412

   --- Physical extents ---
   PE    LV                        LE      Disk sector
.... < snipe >
