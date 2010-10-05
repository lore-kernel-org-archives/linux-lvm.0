Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o95EPQEY003972
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 10:25:26 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o95EPDfW023789
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 10:25:14 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o95EPCsN025078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 10:25:13 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o95EPCFR029173
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 10:25:12 -0400
Date: Tue, 5 Oct 2010 10:25:12 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <AANLkTi=5CZ+Z1vJv3qfdy0RMNiE0js-amQ9V7+d3iAff@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1010051017001.29065@bmsred.bmsi.com>
References: <AANLkTimHbA1DPLFeK9626dXZ03WVR6qsYFERQSMc8M5j@mail.gmail.com>
	<4CA9E8C3.4040106@cfl.rr.com>
	<AANLkTinbZtX1aw9J1Bw-=8=S51i0HcaOo5T8whu49ASt@mail.gmail.com>
	<AANLkTikg8U38VEwJOJY+=vSLLjeLK04VmtvmYBhpfjbV@mail.gmail.com>
	<AANLkTinJF0pg+fwt2R6S5C2w6g31N4qqwmnnepjcYnB8@mail.gmail.com>
	<AANLkTik6bkG0hc0_ZsW81S2kgYcDVVm6Zt_UhbWMdmpj@mail.gmail.com>
	<AANLkTimTBv67Q6qa4ONibbPxHz-eOufR+gR=Qe4-CE3H@mail.gmail.com>
	<AANLkTikmp+gSajt=Nnp7JuopFBQgzM1DsGmziyMOjeXW@mail.gmail.com>
	<AANLkTinq+3DzM0x1sOGJB6Kw93d3i+dezNy86B1SQRBP@mail.gmail.com>
	<Pine.LNX.4.64.1010050215180.26224@bmsred.bmsi.com>
	<AANLkTi=5CZ+Z1vJv3qfdy0RMNiE0js-amQ9V7+d3iAff@mail.gmail.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463799287-34327581-1286288712=:29065"
Subject: Re: [linux-lvm] mounting a filesystem on LVM2
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
To: LVM general discussion and development <linux-lvm@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463799287-34327581-1286288712=:29065
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, 5 Oct 2010, Tapas Mishra wrote:

> On Tue, Oct 5, 2010 at 11:54 AM, Stuart D. Gathman <stuart@bmsi.com> wrot=
e:
> > 3) an "LV" is a Logical Volume. =EF=BF=BDAn advanced user might want to=
 use an
> > =EF=BF=BD LV to simulate a disk, putting a partitional table on it. =EF=
=BF=BDUsually
> > =EF=BF=BD this is done by using the LV as a virtual disk for a Virtual =
Machine,
> > =EF=BF=BD which then partitions and uses the virtual disk as it pleases.
> > =EF=BF=BD You could also use fdisk/parted to partition an LV, and kpart=
ed to
> > =EF=BF=BD make the partitions available as separate block devices.
>=20
> This is exactly what I am looking at.
> A tool virt-manager (from Red Hat does that)
> how does it do ?
> While installing a guest OS in an LVM I do not have to create a swap I
> just point to the ISO on my server
> and rest is done.
> How is that part taken care of does virt-manager do it or the OS which
> is being installed some thing from that makes sure that when you are
> installing a guest OS in a virtualization environment then in an LVM
> it will do.
> Because I never needed to create partitions within LVM until I am
> doing this setup to clone the LVM on the server to a
> USB backup drive.

1) man kpartx

2) "partitions within LVM" doesn't make sense.  LVM is a software package,
   not a storage device, and it doesn't do partitions.
   You probably mean "partitions within an LV".

Here is an example of using kpartx:

# lvcreate -L1G -n test vg_sdg
# fdisk /dev/vg_sdg/test
...
# sfdisk -l /dev/vg_sdg/test

Disk /dev/vg_sdg/test: 130 cylinders, 255 heads, 63 sectors/track
Units =3D cylinders of 8225280 bytes, blocks of 1024 bytes, counting from 0

   Device Boot Start     End   #cyls    #blocks   Id  System
   /dev/vg_sdg/test1          0+     99     100-    803218+  83  Linux
   /dev/vg_sdg/test2        100     129      30     240975   82  Linux swap=
 / Solaris
   /dev/vg_sdg/test3          0       -       0          0    0  Empty
   /dev/vg_sdg/test4          0       -       0          0    0  Empty
# kpartx -l /dev/vg_sdg/test
vg_sdg-test1 : 0 1606437 /dev/vg_sdg/test 63
vg_sdg-test2 : 0 481950 /dev/vg_sdg/test 1606500
# kpartx -av /dev/vg_sdg/test
add map vg_sdg-test1 (253:6): 0 1606437 linear /dev/vg_sdg/test 63
add map vg_sdg-test2 (253:7): 0 481950 linear /dev/vg_sdg/test 1606500
# mke2fs /dev/mapper/vg_sdg-test1
mke2fs 1.41.9 (22-Aug-2009)
Filesystem label=3D
OS type: Linux
Block size=3D4096 (log=3D2)
Fragment size=3D4096 (log=3D2)
50288 inodes, 200804 blocks
10040 blocks (5.00%) reserved for the super user
First data block=3D0
Maximum filesystem blocks=3D209715200
7 block groups
32768 blocks per group, 32768 fragments per group
7184 inodes per group
Superblock backups stored on blocks:=20
        32768, 98304, 163840

	Writing inode tables: done                           =20
	Writing superblocks and filesystem accounting information: done

	This filesystem will be automatically checked every 29 mounts or
	180 days, whichever comes first.  Use tune2fs -c or -i to override.
# mount /dev/mapper/vg_sdg-test1 /mnt/tmp
# df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/dm-1             15481840  12143008   2552400  83% /
tmpfs                   512672       404    512268   1% /dev/shm
/dev/sda1               295561     95222    185079  34% /boot
/dev/dm-0             36124288  31419784   2869688  92% /home
/dev/dm-3             10321208   5969640   3827324  61% /video
/dev/sr1                  6828      6828         0 100% /media/U3 System
/dev/sdb1              7837760   2046560   5791200  27% /media/Cruzer
/dev/mapper/vg_sdg-test1
                        790556       808    749588   1% /mnt/tmp


--=20
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
---1463799287-34327581-1286288712=:29065--
