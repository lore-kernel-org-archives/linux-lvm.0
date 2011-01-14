Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p0EJPdMZ030618
	for <linux-lvm@redhat.com>; Fri, 14 Jan 2011 14:25:39 -0500
Received: from mail-yx0-f174.google.com (mail-yx0-f174.google.com
	[209.85.213.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p0EJPRhJ015775
	for <linux-lvm@redhat.com>; Fri, 14 Jan 2011 14:25:28 -0500
Received: by yxt3 with SMTP id 3so1253699yxt.33
	for <linux-lvm@redhat.com>; Fri, 14 Jan 2011 11:25:27 -0800 (PST)
From: Albert Everett <aeeverett@ualr.edu>
Date: Fri, 14 Jan 2011 13:25:24 -0600
Message-Id: <FB3E421C-2DDC-4BBE-9736-53762F26B425@ualr.edu>
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] moving LVMs to another machine
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

This is my first time trying to do this, so please forgive me if what I'm asking is trivial. I'm anxious not to loose data.

I have moved a Dell MD3000 with an MD1000 attached from one CentOS 4.5 x86_64 machine to another. I've installed Dell's drivers on the second machine and I see output below. 

/dev/sdb and sdc are on the MD3000; /dev/sdd, sde and sdf are on the MD1000. Filesystem on both is ext3, and I only used LVM to concatenate <2TB volumes because the MD3000 firmware required it@the time.

I did not actively deactivate any volume groups or logical volumes before I made this move.

Q: What are my next steps after lvscan to bring the two logical volumes back online? OS, etc are all on /dev/sda; the logical volumes just have extra stuff. 

Q: Am I right to assume that once lv0 and lv1 show as active, all I need to do is mount them somewhere, and that the filesystems they contain should be intact? I had no disk or controller failures that I know of.

Albert

[root@login-0-0 ~]# fdisk -l

Disk /dev/sda: 749.6 GB, 749606010880 bytes
255 heads, 63 sectors/track, 91134 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1        3060    24579418+  83  Linux
/dev/sda2            3061        6120    24579450   83  Linux
/dev/sda3            6121        8160    16386300   82  Linux swap
/dev/sda4            8161       91134   666488655    5  Extended
/dev/sda5            8161       91134   666488623+  83  Linux

Disk /dev/sdb: 1796.7 GB, 1796776919040 bytes
255 heads, 63 sectors/track, 218445 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1               1      218445  1754659431   8e  Linux LVM

Disk /dev/sdc: 1796.7 GB, 1796776919040 bytes
255 heads, 63 sectors/track, 218445 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sdc1               1      218445  1754659431   8e  Linux LVM

Disk /dev/sdd: 2186.1 GB, 2186136256512 bytes
255 heads, 63 sectors/track, 265782 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sdd1               1      265782  2134893883+  8e  Linux LVM

Disk /dev/sde: 2186.1 GB, 2186136256512 bytes
255 heads, 63 sectors/track, 265782 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sde1               1      265782  2134893883+  8e  Linux LVM

Disk /dev/sdf: 820.7 GB, 820745076736 bytes
255 heads, 63 sectors/track, 99783 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sdf1               1       99783   801506916   8e  Linux LVM

[root@login-0-0 ~]# pvscan
  PV /dev/sdd1   VG vg1   lvm2 [1.99 TB / 0    free]
  PV /dev/sde1   VG vg1   lvm2 [1.99 TB / 0    free]
  PV /dev/sdf1   VG vg1   lvm2 [764.38 GB / 2.75 GB free]
  PV /dev/sdb1   VG vg0   lvm2 [1.63 TB / 0    free]
  PV /dev/sdc1   VG vg0   lvm2 [1.63 TB / 0    free]
  Total: 5 [7.99 TB] / in use: 5 [7.99 TB] / in no VG: 0 [0   ]

[root@login-0-0 ~]# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "vg1" using metadata type lvm2
  Found volume group "vg0" using metadata type lvm2

[root@login-0-0 ~]# lvscan
  inactive          '/dev/vg1/lv1' [4.72 TB] inherit
  inactive          '/dev/vg0/lv0' [3.27 TB] inherit

[root@login-0-0 ~]# pvdisplay
  --- Physical volume ---
  PV Name               /dev/sdd1
  VG Name               vg1
  PV Size               8192.00 EB / not usable 8192.00 EB
  Allocatable           yes (but full)
  PE Size (KByte)       131072
  Total PE              16287
  Free PE               0
  Allocated PE          16287
  PV UUID               VSTyo3-r8rE-5lym-G6F7-683r-fdZm-Urm5af
   
  --- Physical volume ---
  PV Name               /dev/sde1
  VG Name               vg1
  PV Size               8192.00 EB / not usable 8192.00 EB
  Allocatable           yes (but full)
  PE Size (KByte)       131072
  Total PE              16287
  Free PE               0
  Allocated PE          16287
  PV UUID               eXd2Ee-L55A-bO43-ucXR-GnGM-n4fo-k0vOXP
   
  --- Physical volume ---
  PV Name               /dev/sdf1
  VG Name               vg1
  PV Size               764.38 GB / not usable 1.60 MB
  Allocatable           yes 
  PE Size (KByte)       131072
  Total PE              6115
  Free PE               22
  Allocated PE          6093
  PV UUID               4e0pIE-AoXc-2bb5-m6Q9-Eb2z-gmHW-Gu9Owl
   
  --- Physical volume ---
  PV Name               /dev/sdb1
  VG Name               vg0
  PV Size               8192.00 EB / not usable 8192.00 EB
  Allocatable           yes (but full)
  PE Size (KByte)       131072
  Total PE              13386
  Free PE               0
  Allocated PE          13386
  PV UUID               aX4eXc-5ADq-BTl2-sZzY-36kX-A0zx-bDKIQf
   
  --- Physical volume ---
  PV Name               /dev/sdc1
  VG Name               vg0
  PV Size               8192.00 EB / not usable 8192.00 EB
  Allocatable           yes (but full)
  PE Size (KByte)       131072
  Total PE              13386
  Free PE               0
  Allocated PE          13386
  PV UUID               fgu78M-yzS9-OPbV-2aXt-NgJP-A6dA-ZpQCkt
   
[root@login-0-0 ~]# vgdisplay
  --- Volume group ---
  VG Name               vg1
  System ID             
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  2
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               4.72 TB
  PE Size               128.00 MB
  Total PE              38689
  Alloc PE / Size       38667 / 4.72 TB
  Free  PE / Size       22 / 2.75 GB
  VG UUID               Qjb9Fq-o5Jy-MH1n-453l-gQqp-iqqN-49sUIS
   
  --- Volume group ---
  VG Name               vg0
  System ID             
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  4
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               3.27 TB
  PE Size               128.00 MB
  Total PE              26772
  Alloc PE / Size       26772 / 3.27 TB
  Free  PE / Size       0 / 0   
  VG UUID               DlYlrX-oFu7-S3rf-GVH0-5sVp-cuQh-0VGIdy
   
[root@login-0-0 ~]# lvdisplay
  --- Logical volume ---
  LV Name                /dev/vg1/lv1
  VG Name                vg1
  LV UUID                SNdEg6-nshz-xtzf-ml4R-jraE-ukEZ-eqK6hE
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                4.72 TB
  Current LE             38667
  Segments               3
  Allocation             inherit
  Read ahead sectors     0
   
  --- Logical volume ---
  LV Name                /dev/vg0/lv0
  VG Name                vg0
  LV UUID                fOvYHo-jj3e-qoZK-nvU8-7yu3-z19U-siuqOP
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                3.27 TB
  Current LE             26772
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
