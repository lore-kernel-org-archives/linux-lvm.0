Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5GCB3TT004531
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 08:11:03 -0400
Received: from mail.gmx.net (mail.gmx.de [213.165.64.21])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k5GCB1ex005946
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 08:11:02 -0400
Received: from pavian (pavian.at.ds9 [192.168.0.104])
	by mailer.at.ds9 (Postfix) with ESMTP id 69FD875706
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 14:12:02 +0200 (CEST)
From: "Cisco" <cisco66@gmx.de>
Subject: AW: [linux-lvm] please help: unable to get rid of LV
Date: Fri, 16 Jun 2006 14:11:59 +0200
MIME-Version: 1.0
In-Reply-To: <20060616113527.DCB4275706@mailer.at.ds9>
Message-Id: <20060616121202.69FD875706@mailer.at.ds9>
Content-Transfer-Encoding: 8bit
Reply-To: cisco66@gmx.de,
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
Content-Type: text/plain; charset="utf-8"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi again,

i now manged to restore the uuid on /dev/md2, and i'm now able again to
access all LV's.
But i can't get rid of LV06:

e2fsck -f /dev/mapper/clv06
e2fsck 1.39 (29-May-2006)
Die Dateisystem Gr��e ( laut SuperBlock) ist 14417920 Blocks
Die physikalische Gr��e von Ger�t ist 7864320 Blocks
Entweder der SuperBlock oder die Partionstabelle ist besch�digt!
Abbrechen<j>? ja

translation: the superblock tells that the filesystem is 14417920 blocks
big, but the physical size is 7864320.
#lvremove /dev/vg00/lv06
  Can't remove open logical volume "lv06"
here i'm stuck again ...


> -----Urspr�ngliche Nachricht-----
> Von: linux-lvm-bounces@redhat.com 
> [mailto:linux-lvm-bounces@redhat.com] Im Auftrag von Cisco
> Gesendet: Freitag, 16. Juni 2006 13:35
> An: 'LVM general discussion and development'
> Betreff: [linux-lvm] please help: unable to get rid of LV
> 
>  Hi,
> 
> i have the following setup:
> 
> /dev/md2 --RAID1 (2x250GB)
> /dev/md0 --RAID-5 (4x160GB)
> 
> both md-devices are added to LVM (2)
>  
> Library version:   1.02.03 (2006-02-08)
> Driver version:    4.3.0
> 
> There are 1 VG and 10 LV's created. VG00 and LV00-LV09 
> Everything worked fine until i obviously did a mistake 
> rezising the LV06.
> (I resized othe LV's without problem before but with LV06 i 
> forgot something
> ...)
> 
> Now i moved all other LV's to /dev/md0 with pvmove -n ..., 
> exept for LV06 However i couldn't "lvremove" the LV06 (error: 
> can't remove open lv or so) I wasn't also able to deactivate 
> the lv nor the vg.
> 
> So i tried to pvremove -ff the /dev/md2 PV (maybe the first 
> big mistake) Then i did a pvcreate on /dev/md2 again.
> 
> Now everything seems to be messed up:
> 
> #pvdisplay
>   Couldn't find device with uuid 
> 'faoJTZ-VDvh-Gqtd-V0jJ-qbMD-w8be-RvV4Dq'.
>   --- Physical volume ---
>   PV Name               unknown device
>   VG Name               vg00
>   PV Size               232,88 GB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              59618
>   Free PE               51938
>   Allocated PE          7680
>   PV UUID               faoJTZ-VDvh-Gqtd-V0jJ-qbMD-w8be-RvV4Dq
> 
>   --- Physical volume ---
>   PV Name               /dev/md0
>   VG Name               vg00
>   PV Size               460,16 GB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              117800
>   Free PE               63272
>   Allocated PE          54528
>   PV UUID               eydC5O-MF3B-oysT-KvoA-pu1D-o54H-GpPmkL
> 
>   --- NEW Physical volume ---
>   PV Name               /dev/md2
>   VG Name
>   PV Size               232,89 GB
>   Allocatable           NO
>   PE Size (KByte)       0
>   Total PE              0
>   Free PE               0
>   Allocated PE          0
>   PV UUID               L4624h-V1WS-AaXi-4leU-6QBD-9Cs6-4d3NBt
> 
> 
> The "unknown" device still contains the data of LV06. This 
> data is not important so i just want consistency back.
> 
> #lvremove vg00/lv06
>   Couldn't find device with uuid 
> 'faoJTZ-VDvh-Gqtd-V0jJ-qbMD-w8be-RvV4Dq'.
>   Couldn't find all physical volumes for volume group vg00.
>   Couldn't find device with uuid 
> 'faoJTZ-VDvh-Gqtd-V0jJ-qbMD-w8be-RvV4Dq'.
>   Couldn't find all physical volumes for volume group vg00.
>   Volume group "vg00" not found
> 
> Also, my cryptsetup gives errors:
>  #/etc/init.d/cryptdisks start
> Starting crypto disks: clv00(starting)...
> Command failed: Es ist ein Block-Device notwendig (a block device is
> necessary)
>  clv01(starting)...
> Command failed: Es ist ein Block-Device notwendig  clv02(starting)...
> Command failed: Es ist ein Block-Device notwendig  clv04(starting)...
> Command failed: Es ist ein Block-Device notwendig  clv05(starting)...
> Command failed: Es ist ein Block-Device notwendig  clv07(starting)...
> Command failed: Es ist ein Block-Device notwendig  clv08(starting)...
> Command failed: Es ist ein Block-Device notwendig  clv09(starting)...
> Command failed: Es ist ein Block-Device notwendig
>  swap0(running) swap1(running).
> 
> Any ideas what i can do now ?
> 
> Thanks in advance,
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
