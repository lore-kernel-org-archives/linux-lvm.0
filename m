Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3HAM5ei015771
	for <linux-lvm@redhat.com>; Thu, 17 Apr 2014 06:22:05 -0400
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3HAM3mA003139
	for <linux-lvm@redhat.com>; Thu, 17 Apr 2014 06:22:03 -0400
Received: from gateway.linuxnetwork.fr (unknown [82.241.253.92])
	by smtp4-g21.free.fr (Postfix) with ESMTP id A14904C8062
	for <linux-lvm@redhat.com>; Thu, 17 Apr 2014 12:21:57 +0200 (CEST)
Received: from netstation (netstation.linuxnetwork.fr [192.168.0.1])
	by gateway.linuxnetwork.fr (Postfix) with ESMTP id EB68834E61
	for <linux-lvm@redhat.com>; Thu, 17 Apr 2014 12:22:01 +0200 (CEST)
Date: Thu, 17 Apr 2014 12:23:15 +0200
From: "L.M.J" <linuxmasterjedi@free.fr>
Message-ID: <20140417122315.4c3687ea@netstation>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM issues after replacing linux mdadm RAID5 drive
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

Hi,

  For the third time, I had to change a failed drive from my home linux RAID5
  box. Previous time went right and this time, I don't know what I did wrong,
  but I broke my RAID5. Well, at least, he won't start.
  /dev/sdb was the failed drive
  /dev/sdc and /dev/sdd are OK.
  
  I tried to reassamble the RAID with this command after I replace sdb and
  create a new partition :
  ~# mdadm -Cv /dev/md0 --assume-clean --level=5
  --raid-devices=3 /dev/sdc1 /dev/sdd1 /dev/sdb1

  Well, I gues I did a mistake here, I should have done this instead :
  ~# mdadm -Cv /dev/md0 --assume-clean --level=5
  --raid-devices=3 /dev/sdc1 /dev/sdd1 missing

  Maybe this wipe out my data...

  Let's go futher, then, pvdisplay, pvscan, vgdisplay returns empty
  information :-(

  Google helped me, and I did this :
  ~# dd if=/dev/md0 bs=512 count=255 skip=1 of=/tmp/md0.txt
   
	[..]
	physical_volumes {
		pv0 {
			id = "5DZit9-6o5V-a1vu-1D1q-fnc0-syEj-kVwAnW"
			device = "/dev/md0"
			status = ["ALLOCATABLE"]
			flags = []
			dev_size = 7814047360
			pe_start = 384
			pe_count = 953863
		}
	}
	logical_volumes {

		lvdata {
			id = "JiwAjc-qkvI-58Ru-RO8n-r63Z-ll3E-SJazO7"
			status = ["READ", "WRITE", "VISIBLE"]
			flags = []
			segment_count = 1
	[..]



  Since I saw lvm information, I guess I haven't lost all information yet...

  I tried an unhoped command :
  ~# pvcreate --uuid "5DZit9-6o5V-a1vu-1D1q-fnc0-syEj-kVwAnW" --restorefile /etc/lvm/archive/lvm-raid_00302.vg /dev/md0

  Then,
  ~# vgcfgrestore lvm-raid

  ~# lvs -a -o +devices
  LV     VG       Attr   LSize   Origin Snap%  Move Log Copy%  Convert  Devices 
  lvdata lvm-raid -wi-a- 450,00g                                       /dev/md0(148480)
  lvmp   lvm-raid -wi-a-  80,00g                                       /dev/md0(263680)

  Then :
  ~# lvchange -ay /dev/lvm-raid/lv*

  I was quite happy until now.
  Problem appears now when I try to mount those 2 LV (lvdata & lvmp) as ext4 partition :
  ~# mount /home/foo/RAID_mp/

  ~# mount | grep -i mp
     /dev/mapper/lvm--raid-lvmp on /home/foo/RAID_mp type ext4 (rw)

  ~# df -h /home/foo/RAID_mp
     Filesystem                  Size  Used Avail Use% Mounted on
     /dev/mapper/lvm--raid-lvmp   79G   61G   19G  77% /home/foo/RAID_mp


  Here is the big problem 
  ~# ls -la /home/foo/RAID_mp
     total 0

  Worst on the other LVM :
  ~# mount /home/foo/RAID_data 
     mount: wrong fs type, bad option, bad superblock on /dev/mapper/lvm--raid-lvdata,
       missing codepage or helper program, or other error
       In some cases useful info is found in syslog - try
       dmesg | tail  or so


  I bet I recover the LVM structure but the data are wiped out, don't you think ?

  ~# fsck -n -v /dev/mapper/lvm--raid-lvdata
     fsck from util-linux-ng 2.17.2
     e2fsck 1.41.11 (14-Mar-2010)
     fsck.ext4: Group descriptors look bad... trying backup blocks...
     fsck.ext4: Bad magic number in super-block when using the backup blocks
     fsck.ext4: going back to original superblock
     fsck.ext4: Device or resource busy while trying to open /dev/mapper/lvm--raid-lvdata
     Filesystem mounted or opened exclusively by another program?


   
  Any help is welcome if you have any idea how to rescue me pleassse !

 

  
 
-- 
 LMJ
 "May the source be with you my young padawan"
