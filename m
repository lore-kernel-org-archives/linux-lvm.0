Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0NHiXRB009826
	for <linux-lvm@redhat.com>; Fri, 23 Jan 2009 12:44:33 -0500
Received: from eu1sys200aog117.obsmtp.com (eu1sys200aog117.obsmtp.com
	[207.126.144.143])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n0NHiDfM025810
	for <linux-lvm@redhat.com>; Fri, 23 Jan 2009 12:44:14 -0500
Received: by fg-out-1718.google.com with SMTP id d23so2541664fga.32
	for <linux-lvm@redhat.com>; Fri, 23 Jan 2009 09:44:13 -0800 (PST)
Date: Fri, 23 Jan 2009 18:44:09 +0100
From: "F-D. Cami" <fcami@winsoft.fr>
Subject: Re: [linux-lvm] LVM Volume Size Question
Message-ID: <20090123184409.6517bef5@winsoft.fr>
In-Reply-To: <55636.1232730875@minneapolish3.com>
References: <55636.1232730875@minneapolish3.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: ctd@minneapolish3.com, LVM general discussion and development <linux-lvm@redhat.com>


Hi Mike,

Could you give us the output of :

vgdisplay -v vg
lvdisplay /dev/vg/myth

I think your myth LV is already 1.5TB, so you only need to run :
# mount -o remount,resize /dev/vg/myth
for the JFS filesystem to be resized.
Please backup everything before running that :)

However, since what you're doing essentially amounts to RAID0 without the
performance benefits (if you lose one drive, your data is lost), I'd run a full backup
and run the following commands to create a striped LV :

lvremove /dev/vg/myth
vgremove vg
pvremove /dev/sdb1
pvremove /dev/sdc1
dd if=/dev/zero of=/dev/sdb bs=4096 count=10000
dd if=/dev/zero of=/dev/sdb bs=4096 count=10000
pvcreate /dev/sdb
pvcreate /dev/sdc
vgcreate vg /dev/sdb /dev/sdc
lcreate -i 2 -I 8 -L 1700M -n myth vg /dev/sdb /dev/sdc
   (adjust 1700 to whatever your drives will take)
mkfs.jfs /dev/vg/myth

You will lose a bit of space but gain some performance ; the available VG size can
then be used for other LVs or snapshots.

Best,

Francois



On Fri, 23 Jan 2009 11:14:35 -0600
ctd@minneapolish3.com wrote:

> Hey there,
> 
> 
> 
> I have most likely a simple question concerning LVM that I figured someone might be able to provide some insight into.
> 
> 
> 
> I just setup LVM with both /dev/sdb1 and /dev/sdc1 being assigned to my “vg” volume group. There is only one logical volume “myth” off of “vg”.
> 
> 
> 
> My steps:
> 
> fdisk /dev/sdc [created 1 partition to span the entire drive of type 8e]
> emerge lvm2
> vgscan
> vgchange -a y 
> pvcreate /dev/sdc1
> vgcreate vg /dev/sdc1
> lvcreate -L900GB -nmyth vg
> mkfs.jfs /dev/vg/myth
> fdisk /dev/sdb [created 1 partition to span the entire drive of type 8e]
> pvcreate /dev/sdb1
> vgextend vg /dev/sdb1
> lvextend -L+700G /dev/vg/myth
> 
> 
> Sdb1: 700GB drive with one partition
> 
> Sdd1: 1TB drive with one partition
> 
> 
> My question is related to the space available in /dev/vg/myth. I
> would assume that I should have ~1.7TB of space on that logical
> partition, but df does not seems to indicate that. 
> 
> 
>  # df
> Filesystem           1K-blocks      Used Available Use% Mounted on
> …
> /dev/mapper/vg-myth  943656628 544996248 398660380  58% /mnt/store
> …
> mythserver michael # pvdisplay /dev/sdb1
>   --- Physical volume ---
>   PV Name               /dev/sdb1
>   VG Name               vg
>   PV Size               698.64 GB / not usable 2.34 MB
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              178850
>   Free PE               292
>   Allocated PE          178558
>   PV UUID               SetyUA-DkWL-zDDo-Wm-3avR-nJH8-OnUujv
> mythserver michael # pvdisplay /dev/sdc1
>   --- Physical volume ---
>   PV Name               /dev/sdc1
>   VG Name               vg
>   PV Size               931.51 GB / not usable 3.19 MB
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              238466
>   Free PE               0
>   Allocated PE          238466
>   PV UUID               DX11mo-r0Eh-jN5N-objS-oqo6-eVSU-MShkS2
> mythserver michael # lvextend -L+700G /dev/vg/myth
>   Extending logical volume myth to 2.27 TB
>   Insufficient free space: 179200 extents needed, but only 292 available
> 
> I am guessing that I should have run these commands to extend the logical volume to its desired size:
> vgextend vg /dev/sdb1
> lvextend -L+700G /dev/vg/myth
> 
> before creating the filesystem with this command which I am guessing locked the size to the 900GB with I used in my setup steps
> mkfs.jfs /dev/vg/myth
> 
> 	
> Does that sound like my issue?
> 
> Any thoughts on how to get out of this situation while ensuring no loss of my data that currently resides on /dev/mapper/vg-myth?
> 
> 
> I am thinking that the following steps should work:
> Copy all of my files on /dev/mapper/vg-myth to other paritions (I
> assume the call to mkfs.jfs below will delete all the contents of this
> partition)
> "lvreduce -L-641G /dev/vg/myth" (to get the size matched up with 931GB + 698GB [ 2.27TB – 931GB – 698GB)
> "mkfs.jfs /dev/vg/myth" (recreate the filesystem now that the size has been corrected) 
> remount /dev/vg/myth
> copy back the files
> 
> Thanks in advance
> Mike 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
