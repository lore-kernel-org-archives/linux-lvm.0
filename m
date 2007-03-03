Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l235waXk012779
	for <linux-lvm@redhat.com>; Sat, 3 Mar 2007 00:58:36 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l235wW0N002764
	for <linux-lvm@redhat.com>; Sat, 3 Mar 2007 00:58:32 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l235wR1W024376
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 3 Mar 2007 00:58:27 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l235wQ5W001769
	for <linux-lvm@redhat.com>; Sat, 3 Mar 2007 00:58:27 -0500
Date: Sat, 3 Mar 2007 00:58:26 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Message-ID: <Pine.LNX.4.44.0703030023001.1697-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: [linux-lvm] HELP! LVM1 vgscan error (pvcreate bug?)
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

HELP!  Questions at the end.  I am providing some history.

This volume group is built on md devices.  I needed to expand the space.
Originally there were two in the volume group (md0 is for boot):

  [root@cmslax etc]# cat /proc/mdstat
  Personalities : [raid1] 
  read_ahead 1024 sectors
  Event: 3
  md0 : active raid1 sdb2[1] sda2[0]
	40064 blocks [2/2] [UU]
	
  md1 : active raid1 sdb5[1] sda5[0]
	17687424 blocks [2/2] [UU]
	
  md2 : active raid1 sdb6[1] sda6[0]
	17775808 blocks [2/2] [UU]
	
  unused devices: <none>

I added drive sdc, allocated 72G non LVM partition, and made a full rsync
backup before beginning.  Then I migrated the sdb mirror copies to sdc 
and created md3 and md4:

  [root@cmslax etc]# cat /proc/mdstat
  Personalities : [raid1] 
  read_ahead 1024 sectors
  Event: 15                  
  md4 : active raid1 sdb6[1] sdc8[0]
	17775808 blocks [2/2] [UU]
	
  md3 : active raid1 sdc7[1] sdb5[0]
	17687424 blocks [2/2] [UU]
	
  md0 : active raid1 sdb2[1] sda2[0]
	40064 blocks [2/2] [UU]
	
  md1 : active raid1 sdc5[1] sda5[0]
	17687424 blocks [2/2] [UU]
	
  md2 : active raid1 sdc6[1] sda6[0]
	17775808 blocks [2/2] [UU]
	
  unused devices: <none>

The problem is with md3.  Since I left sdb5 as device 0, its data took
precedence, thus creating a duplicate PV UUID.  So, I ran pvcreate
with the "I really really mean it option" to wipe md3 (I learned my lesson
with md4).  BUT, when I extended the VG, pvdisplay shows this:

  [root@cmslax sbin]# pvdisplay /dev/md3
  --- Physical volume ---
  PV Name             /dev/md3
  VG Name             rootvg
  PV Size             16.87 GB [35374848 secs] / NOT usable 32.19 MB [LVM: 130 KB]
  PV#                 3
  PV Status           NOT available
  Allocatable         yes
  Cur LV              1
  PE Size (KByte)     32768
  Total PE            538
  Free PE             538
  Allocated PE        0
  PV UUID             YfvIpi-x3Cg-xKrR-j1T2-Gutz-u1tp-sl8t01

Then, I allocated a LV 'lvtest'.  This succeeded.  But md3 still
showed "NOT available".  Huh?  Now I can't remove lvtest, and vgscan
gets an error.  Did pvcreate do something to rootvg?  Worse, vgscan
wiped lvmtab.  I think I shouldn't have run vgscan...  So I restored
lvmtab (just has one vg: rootvg) and /etc/lvmtab.d from my backup.
Now, vgdisplay and friends work again.  but vgck gets the same error,
and I still can't remove lvtest, and can't reduce the VG:

  [root@cmslax sbin]# lvremove /dev/rootvg/lvtest
  lvremove -- do you really want to remove "/dev/rootvg/lvtest"? [y/n]: y
  lvremove -- ERROR "lv_release(): LV number" releasing logical volume "/dev/rootvg/lvtest"

  [root@cmslax sbin]# vgreduce rootvg /dev/md3
  vgreduce -- physical volume "/dev/md3" doesn't belong to volume group "rootvg"

  [root@cmslax sbin]# vgck
  vgck -- VGDA of "rootvg" in lvmtab is consistent
  vgck -- ERROR "vg_read_with_pv_and_lv(): current PV" reading data of volume group "rootvg" from physical volume(s)
  vgck -- please DON'T run vgscan prior to vgcfgrestore

  [root@cmslax etc]# pvscan
  pvscan -- reading all physical volumes (this may take a while...)
  pvscan -- WARNING: physical volume "/dev/sda5" belongs to a meta device
  pvscan -- WARNING: physical volume "/dev/sda6" belongs to a meta device
  pvscan -- WARNING: physical volume "/dev/sdb5" belongs to a meta device
  pvscan -- WARNING: physical volume "/dev/sdc5" belongs to a meta device
  pvscan -- WARNING: physical volume "/dev/sdc6" belongs to a meta device
  pvscan -- ACTIVE   PV "/dev/md1"  of VG "rootvg" [16.81 GB / 0 free]
  pvscan -- ACTIVE   PV "/dev/md2"  of VG "rootvg" [16.91 GB / 0 free]
  pvscan -- ACTIVE   PV "/dev/md3"  of VG "rootvg" [16.81 GB / 15.03 GB 
  free]
  pvscan -- total: 8 [50.69 GB] / in use: 8 [50.69 GB] / in no VG: 0 [0]

  [root@cmslax etc]# pvdisplay /dev/md3
  --- Physical volume ---
  PV Name               /dev/md3
  VG Name               rootvg
  PV Size               16.87 GB [35374848 secs] / NOT usable 32.19 MB [LVM: 130 KB]
  PV#                   3
  PV Status             NOT available
  Allocatable           yes
  Cur LV                1
  PE Size (KByte)       32768
  Total PE              538
  Free PE               481
  Allocated PE          57
  PV UUID               YfvIpi-x3Cg-xKrR-j1T2-Gutz-u1tp-sl8t01

  [root@cmslax sbin]# pvdata /dev/md3
  --- Physical volume ---
  PV Name               /dev/md3
  VG Name               rootvg
  PV Size               16.87 GB [35374848 secs] / NOT usable 32.19 MB [LVM: 130 KB]
  PV#                   3
  PV Status             NOT available
  Allocatable           yes
  Cur LV                1
  PE Size (KByte)       32768
  Total PE              538
  Free PE               481
  Allocated PE          57
  PV UUID               YfvIpi-x3Cg-xKrR-j1T2-Gutz-u1tp-sl8t01

  --- Volume group ---
  VG Name               
  VG Access             read/write
  VG Status             NOT available/resizable
  VG #                  0
  MAX LV                256
  Cur LV                11
  Open LV               0
  MAX LV Size           2 TB
  Max PV                256
  Cur PV                3
  Act PV                3
  VG Size               50.53 GB
  PE Size               32 MB
  Total PE              1617
  Alloc PE / Size       1136 / 35.50 GB
  Free  PE / Size       481 / 15.03 GB
  VG UUID               L5TG3Z-r4TS-P4Qe-hLmX-jbSz-VN9l-Pd1QHq

  --- List of logical volumes ---

  pvdata -- logical volume "/dev/rootvg/lv00" at offset   0
  pvdata -- logical volume "/dev/rootvg/lv01" at offset   1
  pvdata -- logical volume "/dev/rootvg/lv02" at offset   2
  pvdata -- logical volume "/dev/rootvg/lv03" at offset   3
  pvdata -- logical volume "/dev/rootvg/lv04" at offset   4
  pvdata -- logical volume "/dev/rootvg/lv05" at offset   5
  pvdata -- logical volume "/dev/rootvg/lv06" at offset   6
  pvdata -- logical volume "/dev/rootvg/lv07" at offset   7
  pvdata -- logical volume "/dev/rootvg/lvtest" at offset   8
  pvdata -- logical volume "/dev/rootvg/lv09" at offset   9
  pvdata -- logical volume "/dev/rootvg/lv10" at offset  10
  pvdata -- logical volume struct at offset  11 is empty
  ...
  pvdata -- logical volume struct at offset 255 is empty
  --- List of physical volume UUIDs ---

  001: e19MZP-dAoA-8I7P-2S6l-eUux-f1wI-XrlW23
  002: NTadnL-TAQJ-XLtL-i1nD-Zo7w-q5Ll-6k5CgN
  003: YfvIpi-x3Cg-xKrR-j1T2-Gutz-u1tp-sl8t01

I looks like vgextend didn't actually mark md3!

I have a feeling the system won't boot in this situation, since vgscan won't
run, and this is a remote system on the other side of the continent, so we
don't want to go the backup route.  (There are no knowlegable users, but I
think I can make a grub entry that boots to the backup partition and change
fstab and mtab - anything else I forgot?)

vgcfgrestore says it "doesn't restore LV data".  Does that mean it wipes
all LVs?  Or would it wipe lvtest and md3 from rootvg?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
