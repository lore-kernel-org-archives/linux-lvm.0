Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7QBqTV15630
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 07:52:29 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.188])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7QBqQNL030736
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 07:52:27 -0400
Message-ID: <430F0279.2090901@gmx.net>
Date: Fri, 26 Aug 2005 13:52:25 +0200
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] free space and no free PE
References: <430EF633.5050609@chwing.com>
In-Reply-To: <430EF633.5050609@chwing.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Antoine schrieb:
> Hi
>=20
> I'm trying to remove a PV from a VG but I'm unable to perform the pvmove =

> because the free PE doesn't match the free space on the VG.. at all.
Who do you come to this conlusion??? vgdisplay shows 677 free PE's and=20
the only free PE in your PV is 677 on /dev/sdb1. So what???

The free PEs have nothing to do with the df output. You have to shrink=20
your filesystem (what might be not possible, not all fs's support this)=20
to get as much free PE's as your PV has.

Ex.: You wanna remove /dev/sdb1, shrink your filesystem to (size - 16.87=20
GB, or better less ;-) ), shrink your LV the same way, pvmove the=20
extends on the PV, remove the PV from the VG.

Ciao
Klaus

>=20
> check output below, anyone has a clue why ? and how to correct this ?
>=20
> pitch:~# df -h /mnt/test
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/mapper/vg1-test   64G   16G   45G  27% /mnt/test
> pitch:~#
> pitch:~#
> pitch:~# vgdisplay vg1
>   --- Volume group ---
>   VG Name               vg1
>   System ID
>   Format                lvm2
>   Metadata Areas        3
>   Metadata Sequence No  6
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                1
>   Open LV               1
>   Max PV                0
>   Cur PV                3
>   Act PV                3
>   VG Size               67.64 GB
>   PE Size               4.00 MB
>   Total PE              17317
>   Alloc PE / Size       16640 / 65.00 GB
>   Free  PE / Size       677 / 2.64 GB
>   VG UUID               V9T0P5-PCML-z92w-GZot-Utlt-7GFF-z83i99
> pitch:~# pvmove --version
>   LVM version:     2.01.04 (2005-02-09)
>   Library version: 1.01.00-ioctl (2005-01-17)
>   Driver version:  4.1.1
>=20
> pitch:~# pvdisplay
>   --- Physical volume ---
>   PV Name               /dev/sda1
>   VG Name               vg1
>   PV Size               16.87 GB / not usable 0
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              4318
>   Free PE               0
>   Allocated PE          4318
>   PV UUID               64vFFO-7kRV-oAYa-6dxH-vLod-XClo-wX3h54
>=20
>   --- Physical volume ---
>   PV Name               /dev/sdb1
>   VG Name               vg1
>   PV Size               16.87 GB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              4318
>   Free PE               677
>   Allocated PE          3641
>   PV UUID               tAGCYo-8wGA-Y1Nr-8d0T-Wn0d-k9PW-Nf5bYj
>=20
>   --- Physical volume ---
>   PV Name               /dev/sdc1
>   VG Name               vg1
>   PV Size               33.91 GB / not usable 0
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              8681
>   Free PE               0
>   Allocated PE          8681
>   PV UUID               ZYn0Lr-rVyB-9geT-pbfN-VQCg-vhcO-kHCYin
>=20
> pitch:~# lvdisplay
>   --- Logical volume ---
>   LV Name                /dev/vg1/test
>   VG Name                vg1
>   LV UUID                Bge5z0-EWMD-vnQs-a08Y-beJR-uyFO-dxg0sj
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                65.00 GB
>   Current LE             16640
>   Segments               5
>   Allocation             contiguous
>   Read ahead sectors     0
>   Block device           254:1


--=20
Mit freundlichen Gr=EF=BF=BDssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
/ \
