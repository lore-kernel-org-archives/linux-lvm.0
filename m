Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i24EWZ818851
	for <linux-lvm@redhat.com>; Thu, 4 Mar 2004 09:32:35 -0500
Received: from localhost (30-223.surfsnel.dsl.internl.net [145.99.223.30])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i24EWYb22657
	for <linux-lvm@redhat.com>; Thu, 4 Mar 2004 09:32:34 -0500
Received: from localhost ([::1] helo=fel.tno.nl)
	by localhost with esmtp (Exim 4.30)
	id 1Ayttk-0000z5-K2
	for linux-lvm@redhat.com; Thu, 04 Mar 2004 15:32:28 +0100
Message-ID: <40473DFC.1020907@fel.tno.nl>
From: Jan Rhebergen <Rhebergen@fel.tno.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lost VG after some rearranging (help needed)
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Mar  4 09:31:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello all,


I've lost access to my root on LVM system and hope that with some help 
of readers of this list can recover from this.

Up until yesterday I had a system with 2 VG:

  "vg" on partition 3 of primary drive
  "titan_vg" on whole secondary drive

"vg" contains LVs:                "titan_vg" contains LVs:
                                     
  /dev/vg/home                    /dev/titan_vg/hugepart   
  /dev/vg/usr                     /dev/titan_vg/biggerpart
  /dev/vg/var                    /dev/titan_vg/largepart  
  /dev/vg/tmp         
  /dev/vg/bigpart
  /dev/vg/hugepart

Yesterday afternoon I started to re-arange (deactivating and
unmounting where needed):

  lvremove  /dev/titan_vg/biggerpart
  lvremove  /dev/titan_vg/largepart  

  cp -av /dev/vg/hugepart/* /dev/titan_vg/hugepart/vg_hugepart/

  lvremove /dev/vg/hugepart

  vgmerge vg titan_vg

  lvextend -L+4000M /dev/vg/home
  ext2resize /dev/vg/home
 
  lvextend -L+4000M /dev/vg/bigpart
  ext2resize /dev/vg/bigpart

  mv /dev/vg/hugepart/vg_hugepart/* /dev/vg/hugepart/

So far everything works fine. No problems. The I noticed that
/dev/vg/usr has no more capacity. Now this cannot be resized just like 
that because it is in use. So I decide to prepare for a single user 
reboot without mounting /dev/vg/usr. The idea being that I can then 
resize this LV and the reboot again in multiuser mode.

However when rebooting Linux does not find the root LV! vgscan reports
it cannot find any VGs!

I have an emergency system on /dev/hda2 which is not LVM dependant. So
I boot into this partition. I've had some LVM troubles in the past and
used this emergency system to recover. On this partition I have some old
config files which contain old configuration info which has been used
in the past recover form similar trouble.

However these config files are not up to date due to the changes of
the past months. Some basics (like /dev/vg/root) however have not
changed and I was hoping (as was the case before) to do a vgcfgrestore
and at least get a bootable root_on_LVM system back. From there, do
another vgcfgrestore using more recent config files available on the
root_on_LVM system and thus get the most recent and uptodate
configuration back.

So I restored a previous configuration but alas,.. not with the hoped
result.

Can anyone advise me how to preceed from here?

Thanks in advance!

Jan Rhebergen




PS: Here is some informative output:

titan:/etc/lvmconf# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/ide/host0/bus0/target0/lun0/part3"  is 
associated to unknown VG "vg" (run vgscan)
pvscan -- inactive PV "/dev/ide/host0/bus0/target1/lun0/disc"   is 
associated to unknown VG "vg" (run vgscan)
pvscan -- total: 2 [149.77 GB] / in use: 2 [149.77 GB] / in no VG: 0 [0]

titan:/etc/lvmconf# lvm vgscan
  Reading all physical volumes.  This may take a while...
  VG data differs between PVs /dev/hda3 and /dev/hdb
  Volume group "vg" not found



titan:/etc/lvmconf# pvdata /dev/hdb
--- Physical volume ---
PV Name               /dev/hdb
VG Name               vg
PV Size               111.79 GB [234441648 secs] / NOT usable 32.19 MB 
[LVM: 137 KB]
PV#                   2
PV Status             NOT available
Allocatable           yes
Cur LV                1
PE Size (KByte)       32768
Total PE              3576
Free PE               528
Allocated PE          3048
PV UUID               r5BNbe-7xyz-SS53-89Vw-cHf0-wkGM-uChV9B

--- Volume group ---
VG Name               
VG Access             read/write
VG Status             NOT available/resizable
VG #                  1
MAX LV                256
Cur LV                9
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                2
Act PV                1
VG Size               149.69 GB
PE Size               32 MB
Total PE              4790
Alloc PE / Size       4015 / 125.47 GB
Free  PE / Size       775 / 24.22 GB
VG UUID               IqNxPQ-yO6B-d3qf-xZ6d-hFYD-fXNq-98dYNQ

--- List of logical volumes ---

pvdata -- logical volume struct at offset   0 is empty
pvdata -- logical volume struct at offset   1 is empty
pvdata -- logical volume "/dev/titan/hugepart" at offset   2

pvdata -- logical volume struct at offset 254 is empty
pvdata -- logical volume struct at offset 255 is empty
--- List of physical volume UUIDs ---

001: E2IXqI-x6Dr-NIBk-EnhJ-UZt8-gcTn-n0YCoG
002: r5BNbe-7xyz-SS53-89Vw-cHf0-wkGM-uChV9B
