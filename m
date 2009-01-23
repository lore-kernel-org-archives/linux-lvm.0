Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0NIIaOb029329
	for <linux-lvm@redhat.com>; Fri, 23 Jan 2009 13:18:36 -0500
Received: from eu1sys200aog120.obsmtp.com (eu1sys200aog120.obsmtp.com
	[207.126.144.149])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n0NIIKdh015671
	for <linux-lvm@redhat.com>; Fri, 23 Jan 2009 13:18:21 -0500
Received: by mu-out-0910.google.com with SMTP id w1so2970581mue.2
	for <linux-lvm@redhat.com>; Fri, 23 Jan 2009 10:18:20 -0800 (PST)
Date: Fri, 23 Jan 2009 19:18:16 +0100
From: "F-D. Cami" <fcami@winsoft.fr>
Subject: Re: [linux-lvm] LVM Volume Size Question
Message-ID: <20090123191816.7ae9a465@winsoft.fr>
In-Reply-To: <34915.1232733765@minneapolish3.com>
References: <34915.1232733765@minneapolish3.com>
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


Mike,

df reports filesystem sizes, not block device sizes.
You now only need to backup and grow the filesystem.
Yes, what I meant was an improvement in performance at some space
cost, if all you need is space, don't do it. 
And, yes, the 2nd dd should be sdc :)

Cheers

F


On Fri, 23 Jan 2009 12:02:45 -0600
ctd@minneapolish3.com wrote:

>   BODY { font-family:Arial, Helvetica, sans-serif;font-size:12px;
> }Francois,
>  Here is the output you requested:
>  mythserver michael # vgdisplay -v vg
>      Using volume group(s) on command line
>      Finding volume group "vg"
>    --- Volume group ---
>    VG Name               vg
>    System ID
>    Format                lvm2
>    Metadata Areas        4
>    Metadata Sequence No  10
>    VG Access             read/write
>    VG Status             resizable
>    MAX LV                0
>    Cur LV                1
>    Open LV               1
>    Max PV                0
>    Cur PV                2
>    Act PV                2
>    VG Size               1.59 TB
>    PE Size               4.00 MB
>    Total PE              417316
>    Alloc PE / Size       417024 / 1.59 TB
>    Free  PE / Size       292 / 1.14 GB
>    VG UUID               2a2Vzo-3HUx-gUU0-EYk3-md1s-PgAg-MM0bQ6
>    --- Logical volume ---
>    LV Name                /dev/vg/myth
>    VG Name                vg
>    LV UUID                4Auu9y-47vW-6BBd-Rdd5-PP63-3sYB-lvmNmQ
>    LV Write Access        read/write
>    LV Status              available
>    # open                 1
>    LV Size                1.59 TB
>    Current LE             417024
>    Segments               2
>    Allocation             inherit
>    Read ahead sectors     auto
>    - currently set to     256
>    Block device           254:0
>    --- Physical volumes ---
>    PV Name               /dev/sdc1
>    PV UUID               DX11mo-r0Eh-jN5N-objS-oqo6-eVSU-MShkS2
>    PV Status             allocatable
>    Total PE / Free PE    238466 / 0
>    PV Name               /dev/sdb1
>    PV UUID               SetyUA-DkWL-zDDo-W8Om-3avR-nJH8-OnUujv
>    PV Status             allocatable
>    Total PE / Free PE    178850 / 292
>  mythserver michael # lvdisplay /dev/vg/myth
>    --- Logical volume ---
>    LV Name                /dev/vg/myth
>    VG Name                vg
>    LV UUID                4Auu9y-47vW-6BBd-Rdd5-PP63-3sYB-lvmNmQ
>    LV Write Access        read/write
>    LV Status              available
>    # open                 1
>    LV Size                1.59 TB
>    Current LE             417024
>    Segments               2
>    Allocation             inherit
>    Read ahead sectors     auto
>    - currently set to     256
>    Block device           254:0
>  So it does appear that /dev/vg/myth is the full 1.59TB.  Any reason
> that it appears that the output of df does not agree with this or am I
> confused?
>  Regarding your recommended steps, I understand that those steps will
> not eliminate my reliance on the two drives not failing but the steps
> will setup a stripped mapping which can improve performance, right?
>  In my situation, the directory mapped to /dev/vg/myth is just used
> to store recorded programs from mythtv.  Therefore, the data is not
> critical, but the desire is to present a directory that is as big as
> possible to allow mythtv to not run out of recording space (I think
> 1.6TB should do it!!!).
>  Also, I assume that the second "dd" command line you wrote should
> have referenced /dev/sdc and not sdb, correct?
>  Thanks a ton for your insight.
>  Take it easy,
>  Mike
>  On Fri 09/01/23 10:44 , "F-D. Cami" fcami@winsoft.fr sent:
>  Hi Mike,
>  Could you give us the output of :
>  vgdisplay -v vg
>  lvdisplay /dev/vg/myth
>  I think your myth LV is already 1.5TB, so you only need to run :
>  # mount -o remount,resize /dev/vg/myth
>  for the JFS filesystem to be resized.
>  Please backup everything before running that :)
>  However, since what you're doing essentially amounts to RAID0
> without the
>  performance benefits (if you lose one drive, your data is lost), I'd
> run a full backup
>  and run the following commands to create a striped LV :
>  lvremove /dev/vg/myth
>  vgremove vg
>  pvremove /dev/sdb1
>  pvremove /dev/sdc1
>  dd if=/dev/zero of=/dev/sdb bs=4096 count=10000
>  dd if=/dev/zero of=/dev/sdb bs=4096 count=10000
>  pvcreate /dev/sdb
>  pvcreate /dev/sdc
>  vgcreate vg /dev/sdb /dev/sdc
>  lcreate -i 2 -I 8 -L 1700M -n myth vg /dev/sdb /dev/sdc
>     (adjust 1700 to whatever your drives will take)
>  mkfs.jfs /dev/vg/myth
>  You will lose a bit of space but gain some performance ; the
> available VG size can
>  then be used for other LVs or snapshots.
>  Best,
>  Francois
>  On Fri, 23 Jan 2009 11:14:35 -0600
>  ctd@minneapolish3.com [1] wrote:
>  > Hey there,
>  > 
>  > 
>  > 
>  > I have most likely a simple question concerning LVM that I figured
> someone might be able to provide some insight into.
>  > 
>  > 
>  > 
>  > I just setup LVM with both /dev/sdb1 and /dev/sdc1 being assigned
> to my “vg” volume group. There is only one logical volume
> “myth” off of “vg”.
>  > 
>  > 
>  > 
>  > My steps:
>  > 
>  > fdisk /dev/sdc [created 1 partition to span the entire drive of
> type 8e]
>  > emerge lvm2
>  > vgscan
>  > vgchange -a y 
>  > pvcreate /dev/sdc1
>  > vgcreate vg /dev/sdc1
>  > lvcreate -L900GB -nmyth vg
>  > mkfs.jfs /dev/vg/myth
>  > fdisk /dev/sdb [created 1 partition to span the entire drive of
> type 8e]
>  > pvcreate /dev/sdb1
>  > vgextend vg /dev/sdb1
>  > lvextend -L+700G /dev/vg/myth
>  > 
>  > 
>  > Sdb1: 700GB drive with one partition
>  > 
>  > Sdd1: 1TB drive with one partition
>  > 
>  > 
>  > My question is related to the space available in /dev/vg/myth. I
>  > would assume that I should have ~1.7TB of space on that logical
>  > partition, but df does not seems to indicate that. 
>  > 
>  > 
>  >  # df
>  > Filesystem           1K-blocks      Used Available Use% Mounted on
>  > …
>  > /dev/mapper/vg-myth  943656628 544996248 398660380  58% /mnt/store
>  > …
>  > mythserver michael # pvdisplay /dev/sdb1
>  >   --- Physical volume ---
>  >   PV Name               /dev/sdb1
>  >   VG Name               vg
>  >   PV Size               698.64 GB / not usable 2.34 MB
>  >   Allocatable           yes
>  >   PE Size (KByte)       4096
>  >   Total PE              178850
>  >   Free PE               292
>  >   Allocated PE          178558
>  >   PV UUID               SetyUA-DkWL-zDDo-Wm-3avR-nJH8-OnUujv
>  > mythserver michael # pvdisplay /dev/sdc1
>  >   --- Physical volume ---
>  >   PV Name               /dev/sdc1
>  >   VG Name               vg
>  >   PV Size               931.51 GB / not usable 3.19 MB
>  >   Allocatable           yes (but full)
>  >   PE Size (KByte)       4096
>  >   Total PE              238466
>  >   Free PE               0
>  >   Allocated PE          238466
>  >   PV UUID               DX11mo-r0Eh-jN5N-objS-oqo6-eVSU-MShkS2
>  > mythserver michael # lvextend -L+700G /dev/vg/myth
>  >   Extending logical volume myth to 2.27 TB
>  >   Insufficient free space: 179200 extents needed, but only 292
> available
>  > 
>  > I am guessing that I should have run these commands to extend the
> logical volume to its desired size:
>  > vgextend vg /dev/sdb1
>  > lvextend -L+700G /dev/vg/myth
>  > 
>  > before creating the filesystem with this command which I am
> guessing locked the size to the 900GB with I used in my setup steps
>  > mkfs.jfs /dev/vg/myth
>  > 
>  >  
>  > Does that sound like my issue?
>  > 
>  > Any thoughts on how to get out of this situation while ensuring no
> loss of my data that currently resides on /dev/mapper/vg-myth?
>  > 
>  > 
>  > I am thinking that the following steps should work:
>  > Copy all of my files on /dev/mapper/vg-myth to other paritions (I
>  > assume the call to mkfs.jfs below will delete all the contents of
> this
>  > partition)
>  > "lvreduce -L-641G /dev/vg/myth" (to get the size matched up with
> 931GB + 698GB [ 2.27TB – 931GB – 698GB)
>  > "mkfs.jfs /dev/vg/myth" (recreate the filesystem now that the size
> has been corrected) 
>  > remount /dev/vg/myth
>  > copy back the files
>  > 
>  > Thanks in advance
>  > Mike 
>  > 
>  > _______________________________________________
>  > linux-lvm mailing list
>  > linux-lvm@redhat.com [2]
>  > https://www.redhat.com/mailman/listinfo/linux-lvm
>  > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>  _______________________________________________
>  linux-lvm mailing list
>  linux-lvm@redhat.com [3]
>  https://www.redhat.com/mailman/listinfo/linux-lvm
>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>  
> 
> Links:
> ------
> [1] mailto:ctd@minneapolish3.com
> [2] mailto:linux-lvm@redhat.com
> [3] mailto:linux-lvm@redhat.com
