Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6JJ5Ka31878
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2004 15:05:20 -0400
Received: from mail-new.rz.uni-ulm.de (mail-new.rz.uni-ulm.de [134.60.1.1])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6JJ5Je1027083
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2004 15:05:19 -0400
Received: from uiuc.edu (phyha9.physics.uiuc.edu [130.126.11.189])
	by mail.uni-ulm.de (8.12.11/8.12.11) with ESMTP id i6JJ5Hke017645
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2004 21:05:17 +0200 (MEST)
Message-ID: <40FC1B6C.7060302@uiuc.edu>
Date: Mon, 19 Jul 2004 14:05:16 -0500
From: Stephanus Fengler <fengler@uiuc.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm 1.0.3 kernel panic
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi experts,

I added a new hard disk to my system and created it entirely as a new 
logical volume. Mounting unmounting everything worked until reboot. It 
stops now with kerel panic and lines like:

(null) -- ERROR 2 writing volume group backup file /etc/lvmtab.d/vg01.tmp
       vg_cfgbackup.c [line271]

vgscan -- ERROR: unable to do a backup of volume group vg01
vgscan -- ERROR: lvm_tab_vg_remove(): unlink" removing volume group 
"vg01"  from  "/etc/lvmtab"

...

Activating volume groups
    vgchange - no volume groups found

I understand the kernel panic if lvm is unable to find the volume group 
vg01 because that's my root system. But I don't get the first error.
I rebooted with my Redhat Installation disk: linux rescue
and can activate the volume group by hand and mount the file systems. So 
it looks to me everything is consistent in the filesystem.

So since I am pretty new to lvm, which output do you additional need to 
help me?

Thanks in advance,
Stephanus

lvmdiskscan:
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/hdc   [     232.89 GB] USED LVM whole disk
lvmdiskscan -- /dev/hda1  [       2.50 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hda2  [     101.97 MB] Primary  LINUX native 
partition [0x83]
lvmdiskscan -- /dev/hda3  [      33.67 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hda4  [    1019.75 MB] Primary  Windows98 extended 
partition [0x0F]
lvmdiskscan -- /dev/hda5  [    1019.72 MB] Extended LINUX swap partition 
[0x82]
lvmdiskscan -- /dev/hdb   [     232.89 GB] USED LVM whole disk
lvmdiskscan -- /dev/loop0 [      59.08 MB] free loop device
lvmdiskscan -- 3 disks
lvmdiskscan -- 2 whole disks
lvmdiskscan -- 1 loop device
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 5 partitions
lvmdiskscan -- 2 LVM physical volume partitions

pvscan:
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdc"  of VG "vg01" [232.88 GB / 0 free]
pvscan -- inactive PV "/dev/hda1" of VG "vg01" [2.50 GB / 0 free]
pvscan -- inactive PV "/dev/hda3" of VG "vg01" [33.66 GB / 0 free]
pvscan -- inactive PV "/dev/hdb"  of VG "vg01" [232.88 GB / 0 free]
pvscan -- total: 4 [501.94 GB] / in use: 4 [501.94 GB] / in no VG: 0 [0]
