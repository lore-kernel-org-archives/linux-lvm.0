From: mark seddon <mark-seddon@partners-in-it.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20020124160246.JGB7206.mta05-svc.ntlworld.com@there>
Subject: [linux-lvm] LVM bug
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Jan 24 10:03:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-LVM@sistina.com

I have 2 VG's called vg00 and vg01, vg00 is the boot disk. The problem is=20
that vgdisplay displays incorrect info, ie .the wrong VG and other commands=
=20
such as lvcreate get confused as to which VG is which.=20

Here is the partition table vg00 is hda9 and vg01 is hda7.

Disk /dev/hda: 240 heads, 63 sectors, 1559 cylinders
Units =3D cylinders of 15120 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1             1         2     15088+  a0  IBM Thinkpad hibernation
/dev/hda2   *         3       279   2094120    7  HPFS/NTFS
/dev/hda3           280      1559   9676800    f  Win95 Ext'd (LBA)
/dev/hda5           280       418   1050808+   6  FAT16
/dev/hda6           419       557   1050808+   6  FAT16
/dev/hda7           558       696   1050808+  8e  Linux LVM
/dev/hda8           697       731    264568+  82  Linux swap
/dev/hda9           732      1559   6259648+  8e  Linux LVM

here is a vgdisplay output. Note it always display hda9

[root@cromlech 1.0.1-rc4]# vgdisplay vg01
--- Volume group ---
VG Name               vg00
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                255
Cur LV                6
Open LV               5
MAX LV Size           255.99 GB
Max PV                255
Cur PV                1
Act PV                1
VG Size               5.96 GB
PE Size               4.00 MB
Total PE              1527
Alloc PE / Size       737 / 2.88 GB
Free  PE / Size       790 / 3.09 GB
VG UUID               nbprU3-BaUv-VAwF-tG5r-rW3s-uRvy-3j7S3G


[root@cromlech 1.0.1-rc4]# vgdisplay vg00
--- Volume group ---
VG Name               vg00
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                255
Cur LV                6
Open LV               0
MAX LV Size           255.99 GB
Max PV                255
Cur PV                1
Act PV                1
VG Size               5.96 GB
PE Size               4.00 MB
Total PE              1527
Alloc PE / Size       737 / 2.88 GB
Free  PE / Size       790 / 3.09 GB
VG UUID               nbprU3-BaUv-VAwF-tG5r-rW3s-uRvy-3j7S3G

here is a session output which gives some more info on the problems=20
encountered. Note the lvscan output at the end showing 11 lv's 5 of which a=
re
duplicates.The lvmtab file seems to know which disk is which but the lv=20
cmmand set appears to get confused.

000[root@cromlech lvmtab.d]# strings vg00
vg00
nbprU3BaUvVAwFtG5rrW3suRvy3j7S3G
/dev/hda9
vg00
localhost.localdomain1011713900
V19lI6ULumseLKmET2KJ2cZoqoYmN6Z4
/dev/vg00/lvol1
vg00
/dev/vg00/lvol2
vg00
/dev/vg00/lvol3
vg00
@xa&
/dev/vg00/lvol4
vg00
@xaF
/dev/vg00/lvol5
vg00
@x=EF=BF=BDL
[root@cromlech lvmtab.d]# strings vg01
vg01
BSZ3UwVD67zlzW5uYp9tE5ptAR0QyH3X
/dev/hda7
vg01
localhost.localdomain1011747475
Afs43qT5mmjCFr2yr7YH8Um0WRKEPlJx
[root@cromlech lvmtab.d]# ls
vg00  vg01
[root@cromlech lvmtab.d]# lvscan
lvscan -- volume group "vg00" is NOT active; try -D
lvscan -- ACTIVE            "/dev/vg00/lvol1" [200.00 MB]
lvscan -- ACTIVE            "/dev/vg00/lvol2" [1.00 GB]
lvscan -- ACTIVE            "/dev/vg00/lvol3" [1.00 GB]
lvscan -- ACTIVE            "/dev/vg00/lvol4" [200.00 MB]
lvscan -- ACTIVE            "/dev/vg00/lvol5" [300.00 MB]
lvscan -- 5 logical volumes with 2.68 GB total in 1 volume group
lvscan -- 5 active logical volumes

[root@cromlech lvmtab.d]#
[root@cromlech lvmtab.d]# lvcreate -l50 vg00
lvcreate -- can't create logical volume: "vg00" isn't active

[root@cromlech lvmtab.d]# vgchange -ay vg00
vgchange -- volume group "vg00" successfully activated

[root@cromlech lvmtab.d]# lvcreate -l50 vg00
lvcreate -- doing automatic backup of "vg00"
lvcreate -- logical volume "/dev/vg00/lvol6" successfully created

[root@cromlech lvmtab.d]# lvscan
lvscan -- ACTIVE            "/dev/vg00/lvol1" [200.00 MB]
lvscan -- ACTIVE            "/dev/vg00/lvol2" [1.00 GB]
lvscan -- ACTIVE            "/dev/vg00/lvol3" [1.00 GB]
lvscan -- ACTIVE            "/dev/vg00/lvol4" [200.00 MB]
lvscan -- ACTIVE            "/dev/vg00/lvol5" [300.00 MB]
lvscan -- ACTIVE            "/dev/vg00/lvol6" [200.00 MB]
lvscan -- ACTIVE            "/dev/vg00/lvol1" [200.00 MB]
lvscan -- ACTIVE            "/dev/vg00/lvol2" [1.00 GB]
lvscan -- ACTIVE            "/dev/vg00/lvol3" [1.00 GB]
lvscan -- ACTIVE            "/dev/vg00/lvol4" [200.00 MB]
lvscan -- ACTIVE            "/dev/vg00/lvol5" [300.00 MB]
lvscan -- 11 logical volumes with 5.56 GB total in 2 volume groups
lvscan -- 11 active logical volumes


I'm running kernel 2.4.16 with LVM 1.0.1-rc4.

rgds

mark
