Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5MKbinO007184
	for <linux-lvm@redhat.com>; Mon, 22 Jun 2009 16:37:44 -0400
Received: from mail.bercot.org (ks358108.kimsufi.com [91.121.151.81])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n5MKbUhe003801
	for <linux-lvm@redhat.com>; Mon, 22 Jun 2009 16:37:31 -0400
Received: from david.huperie (localhost.localdomain [127.0.0.1])
	by mail.bercot.org (Postfix) with ESMTP id 1B8A765929
	for <linux-lvm@redhat.com>; Mon, 22 Jun 2009 22:24:46 +0200 (CEST)
Date: Mon, 22 Jun 2009 22:37:31 +0200
From: David BERCOT <debian@bercot.org>
Subject: Re: [linux-lvm] device-mapper: reload ioctl failed: Invalid argument
Message-ID: <20090622223731.62a63d7c@david.huperie>
In-Reply-To: <20090622180935.0f00db1d@david-eee>
References: <20090622180935.0f00db1d@david-eee>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Hi,

I'm sorry to disturb you again, but I'm completly lost :-(

Do you have any idea of a command (or a tool) I can use to verify my
logical volumes ? I used pvck & vgck but everything seems ok.
At boot, I have :
couldn't find device with uuid 'dy...' (/dev/sda5)
couldn't find device with uuid 'ZE...' (/dev/sdb5)
[no error on /dev/sdc5 & /dev/sdd]
Inconsistent length: 512 1024
Inconsistent length: 512 1024
Inconsistent length: 512 1024
Inconsistent length: 512 1024
Inconsistent length: 2560 92768
Inconsistent length: 90208 90267
PV segment pe_alloc_count mismatch: 95328 !=3D 99995
PV segment VG free-count mismatch: 95387 !=3D 90720
Internal error: PV segments corrupted in VG_Wilco
LV LV_Racine! segment 1 has inconsistant PV area 0
etc...

If I'm not on the right ml (I'm a newbie), please, do you know another
one (or a forum) ?

Thank you.

David.

Le Mon, 22 Jun 2009 18:09:35 +0200,
David BERCOT <debian@bercot.org> a =C3=A9crit :
>Hi again,
>
>I fixed my partition table problem and, now, it seems ok with my LVM
>volumes. But I can't mount them :-(
>
># vgscan -ay
>  device-mapper: reload ioctl failed: Invalid argument
>  device-mapper: reload ioctl failed: Invalid argument
>  device-mapper: reload ioctl failed: Invalid argument
>  device-mapper: reload ioctl failed: Invalid argument
>  device-mapper: reload ioctl failed: Invalid argument
>  device-mapper: reload ioctl failed: Invalid argument
>  6 logical volume(s) in volume group "VG_Wilco" now active
>
>At the boot, I have other errors like :
>Internal error: PV segments corrupted in VG_Wilco
>PV segment pe_alloc...
>
>I've tried fsck but I can't...
>
>Do you know if I can recover my LV ?
>
>Here are some commands :
>
># fdisk -l
>Disk /dev/sda: 400.0 GB, 400088457216 bytes
>255 heads, 63 sectors/track, 48641 cylinders
>Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
>Disk identifier: 0x0009efa1
>
>   Device Boot      Start         End      Blocks   Id  System
>/dev/sda1   *           1          30      240943+  83  Linux
>/dev/sda2              31       48641   390467857+   5  Extended
>/dev/sda5              31       48641   390467826   8e  Linux LVM
>
>Disk /dev/sdb: 400.0 GB, 400088457216 bytes
>255 heads, 63 sectors/track, 48641 cylinders
>Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
>Disk identifier: 0xace22e9e
>
>   Device Boot      Start         End      Blocks   Id  System
>/dev/sdb1               1       48641   390708801    5  Extended
>/dev/sdb5               1       48641   390708769+  8e  Linux LVM
>
>Disk /dev/sdc: 400.0 GB, 400088457216 bytes
>255 heads, 63 sectors/track, 48641 cylinders
>Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
>Disk identifier: 0xcfcecfce
>
>   Device Boot      Start         End      Blocks   Id  System
>/dev/sdc1               1       48641   390708801    5  Extended
>/dev/sdc5               1       48641   390708769+  8e  Linux LVM
>
>Disk /dev/sdd: 640.1 GB, 640135028736 bytes
>255 heads, 63 sectors/track, 77825 cylinders
>Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
>Disk identifier: 0x00000000
>
>   Device Boot      Start         End      Blocks   Id  System
>
># pvscan -v
>  PV /dev/sda5   VG VG_Wilco   lvm2 [372.38 GB / 0    free]
>  PV /dev/sdb5   VG VG_Wilco   lvm2 [372.61 GB / 0    free]
>  PV /dev/sdc5   VG VG_Wilco   lvm2 [372.61 GB / 0    free]
>  PV /dev/sdd    VG VG_Wilco   lvm2 [596.17 GB / 0    free]
>  Total: 4 [1.67 TB] / in use: 4 [1.67 TB] / in no VG: 0 [0   ]
>
># pvdisplay
>  --- Physical volume ---
>  PV Name               /dev/sda5
>  VG Name               VG_Wilco
>  PV Size               372.38 GB / not usable 4.24 MB
>  Allocatable           yes (but full)
>  PE Size (KByte)       4096
>  Total PE              95328
>  Free PE               0
>  Allocated PE          95328
>  PV UUID               dyVLCp-3kAD-wneq-VxVh-Nyr5-q6mn-wf6kjT
>  =20
>  --- Physical volume ---
>  PV Name               /dev/sdb5
>  VG Name               VG_Wilco
>  PV Size               372.61 GB / not usable 3.53 MB
>  Allocatable           yes (but full)
>  PE Size (KByte)       4096
>  Total PE              95387
>  Free PE               0
>  Allocated PE          95387
>  PV UUID               ZEmHeZ-0DnH-VsvK-m9ju-7fdd-z2UH-5kTp4X
>  =20
>  --- Physical volume ---
>  PV Name               /dev/sdc5
>  VG Name               VG_Wilco
>  PV Size               372.61 GB / not usable 3.53 MB
>  Allocatable           yes (but full)
>  PE Size (KByte)       4096
>  Total PE              95387
>  Free PE               0
>  Allocated PE          95387
>  PV UUID               kgMwfG-ugM6-dFeK-8358-EoZO-RuIJ-S0FqVv
>  =20
>  --- Physical volume ---
>  PV Name               /dev/sdd
>  VG Name               VG_Wilco
>  PV Size               596.17 GB / not usable 344.00 KB
>  Allocatable           yes (but full)
>  PE Size (KByte)       4096
>  Total PE              152620
>  Free PE               0
>  Allocated PE          152620
>  PV UUID               U3KSpz-6Yf6-QX03-erXL-AnPg-qxF9-1TTFXM
>  =20
># vgscan -v
>  Reading all physical volumes.  This may take a while...
>  Found volume group "VG_Wilco" using metadata type lvm2
>
># vgdisplay
>  --- Volume group ---
>  VG Name               VG_Wilco
>  System ID            =20
>  Format                lvm2
>  Metadata Areas        5
>  Metadata Sequence No  17
>  VG Access             read/write
>  VG Status             resizable
>  MAX LV                0
>  Cur LV                6
>  Open LV               0
>  Max PV                0
>  Cur PV                4
>  Act PV                4
>  VG Size               1.67 TB
>  PE Size               4.00 MB
>  Total PE              438722
>  Alloc PE / Size       438722 / 1.67 TB
>  Free  PE / Size       0 / 0  =20
>  VG UUID               37QI9O-qCAT-v0un-oiKV-G1zm-b753-Df2ZAS
>  =20
># lvscan -v
>  ACTIVE            '/dev/VG_Wilco/LV_Racine' [4.00 GB] inherit
>  ACTIVE            '/dev/VG_Wilco/LV_Swap' [2.00 GB] inherit
>  ACTIVE            '/dev/VG_Wilco/LV_Tmp' [4.00 GB] inherit
>  ACTIVE            '/dev/VG_Wilco/LV_Usr' [4.00 GB] inherit
>  ACTIVE            '/dev/VG_Wilco/LV_Var' [4.00 GB] inherit
>  ACTIVE            '/dev/VG_Wilco/LV_Data' [1.66 TB] inherit
>
># lvdisplay
>  --- Logical volume ---
>  LV Name                /dev/VG_Wilco/LV_Racine
>  VG Name                VG_Wilco
>  LV UUID                a4gSjS-fyAn-1l3H-2QNu-XbUM-QNj8-AA2GjL
>  LV Write Access        read/write
>  LV Status              available
>  # open                 0
>  LV Size                4.00 GB
>  Current LE             1024
>  Segments               1
>  Allocation             inherit
>  Read ahead sectors     auto
>  - currently set to     256
>  Block device           253:2
>  =20
>  --- Logical volume ---
>  LV Name                /dev/VG_Wilco/LV_Swap
>  VG Name                VG_Wilco
>  LV UUID                AfV0D5-Tl4w-qDlO-WN1B-9Pgu-fHse-ep59Uo
>  LV Write Access        read/write
>  LV Status              available
>  # open                 0
>  LV Size                2.00 GB
>  Current LE             512
>  Segments               1
>  Allocation             inherit
>  Read ahead sectors     auto
>  - currently set to     256
>  Block device           253:3
>  =20
>  --- Logical volume ---
>  LV Name                /dev/VG_Wilco/LV_Tmp
>  VG Name                VG_Wilco
>  LV UUID                ZTR2cx-sK3b-fE97-3CrS-13ei-bfmB-KiKNAR
>  LV Write Access        read/write
>  LV Status              available
>  # open                 0
>  LV Size                4.00 GB
>  Current LE             1024
>  Segments               1
>  Allocation             inherit
>  Read ahead sectors     auto
>  - currently set to     256
>  Block device           253:4
>  =20
>  --- Logical volume ---
>  LV Name                /dev/VG_Wilco/LV_Usr
>  VG Name                VG_Wilco
>  LV UUID                cFPa5E-A3bC-3rRX-OdmW-oFk3-zJP5-VKbLGf
>  LV Write Access        read/write
>  LV Status              available
>  # open                 0
>  LV Size                4.00 GB
>  Current LE             1024
>  Segments               1
>  Allocation             inherit
>  Read ahead sectors     auto
>  - currently set to     256
>  Block device           253:5
>  =20
>  --- Logical volume ---
>  LV Name                /dev/VG_Wilco/LV_Var
>  VG Name                VG_Wilco
>  LV UUID                jmOoJB-41DR-EMce-hK2h-Ud6V-DCeM-md0V4f
>  LV Write Access        read/write
>  LV Status              available
>  # open                 0
>  LV Size                4.00 GB
>  Current LE             1024
>  Segments               1
>  Allocation             inherit
>  Read ahead sectors     auto
>  - currently set to     256
>  Block device           253:6
>  =20
>  --- Logical volume ---
>  LV Name                /dev/VG_Wilco/LV_Data
>  VG Name                VG_Wilco
>  LV UUID                TNWdWb-oqkZ-noHk-LqZz-MKYg-LTd2-Suv0Qf
>  LV Write Access        read/write
>  LV Status              available
>  # open                 0
>  LV Size                1.66 TB
>  Current LE             434114
>  Segments               5
>  Allocation             inherit
>  Read ahead sectors     auto
>  - currently set to     256
>  Block device           253:7
>
>Thanks.
>
>David.
