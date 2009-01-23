Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0NHHNP7026490
	for <linux-lvm@redhat.com>; Fri, 23 Jan 2009 12:17:58 -0500
Received: from sitemail.siteprotect.com (fw.mfg.onr.siteprotect.com
	[64.26.60.152])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0NHFKB7007473
	for <linux-lvm@redhat.com>; Fri, 23 Jan 2009 12:15:52 -0500
Received: from localhost (localhost [127.0.0.1])
	by app00.sm.onr.chicago.hostway (Postfix) with ESMTP id 38416D0C0FF
	for <linux-lvm@redhat.com>; Fri, 23 Jan 2009 11:14:35 -0600 (CST)
MIME-Version: 1.0
Message-ID: <55636.1232730875@minneapolish3.com>
Content-Type: text/plain; charset="utf-8"
Date: Fri, 23 Jan 2009 11:14:35 -0600
From: ctd@minneapolish3.com
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM Volume Size Question
Reply-To: ctd@minneapolish3.com,
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
To: linux-lvm@redhat.com

Hey there,



I have most likely a simple question concerning LVM that I figured someone might be able to provide some insight into.



I just setup LVM with both /dev/sdb1 and /dev/sdc1 being assigned to my “vg” volume group. There is only one logical volume “myth” off of “vg”.



My steps:

fdisk /dev/sdc [created 1 partition to span the entire drive of type 8e]
emerge lvm2
vgscan
vgchange -a y 
pvcreate /dev/sdc1
vgcreate vg /dev/sdc1
lvcreate -L900GB -nmyth vg
mkfs.jfs /dev/vg/myth
fdisk /dev/sdb [created 1 partition to span the entire drive of type 8e]
pvcreate /dev/sdb1
vgextend vg /dev/sdb1
lvextend -L+700G /dev/vg/myth


Sdb1: 700GB drive with one partition

Sdd1: 1TB drive with one partition


My question is related to the space available in /dev/vg/myth. I
would assume that I should have ~1.7TB of space on that logical
partition, but df does not seems to indicate that. 


 # df
Filesystem           1K-blocks      Used Available Use% Mounted on
…
/dev/mapper/vg-myth  943656628 544996248 398660380  58% /mnt/store
…
mythserver michael # pvdisplay /dev/sdb1
  --- Physical volume ---
  PV Name               /dev/sdb1
  VG Name               vg
  PV Size               698.64 GB / not usable 2.34 MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              178850
  Free PE               292
  Allocated PE          178558
  PV UUID               SetyUA-DkWL-zDDo-Wm-3avR-nJH8-OnUujv
mythserver michael # pvdisplay /dev/sdc1
  --- Physical volume ---
  PV Name               /dev/sdc1
  VG Name               vg
  PV Size               931.51 GB / not usable 3.19 MB
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              238466
  Free PE               0
  Allocated PE          238466
  PV UUID               DX11mo-r0Eh-jN5N-objS-oqo6-eVSU-MShkS2
mythserver michael # lvextend -L+700G /dev/vg/myth
  Extending logical volume myth to 2.27 TB
  Insufficient free space: 179200 extents needed, but only 292 available

I am guessing that I should have run these commands to extend the logical volume to its desired size:
vgextend vg /dev/sdb1
lvextend -L+700G /dev/vg/myth

before creating the filesystem with this command which I am guessing locked the size to the 900GB with I used in my setup steps
mkfs.jfs /dev/vg/myth

	
Does that sound like my issue?

Any thoughts on how to get out of this situation while ensuring no loss of my data that currently resides on /dev/mapper/vg-myth?


I am thinking that the following steps should work:
Copy all of my files on /dev/mapper/vg-myth to other paritions (I
assume the call to mkfs.jfs below will delete all the contents of this
partition)
"lvreduce -L-641G /dev/vg/myth" (to get the size matched up with 931GB + 698GB [ 2.27TB – 931GB – 698GB)
"mkfs.jfs /dev/vg/myth" (recreate the filesystem now that the size has been corrected) 
remount /dev/vg/myth
copy back the files

Thanks in advance
Mike 
