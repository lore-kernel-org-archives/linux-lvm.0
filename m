Return-Path: <vincent.Guillet@altair-services.fr>
From: vincent.Guillet@altair-services.fr
Message-ID: <C1256A62.0033E9DE.00@mail.ccbp.fr>
Date: Tue, 5 Jun 2001 11:56:11 +0200
Mime-Version: 1.0
Content-Disposition: inline
Content-transfer-encoding: quoted-printable
Subject: [linux-lvm] Compaq Smart Array DL 350: logical units not recognized
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi,

First of all, I would like to thank you for developping lvm, which seem=
s to
me both simple and great.
We intend to use it for our production needs on a Compaq Smart Array
plateform (for hardware mirroring).

For our development platform, we created two logical units with the Com=
paq
utilities for Smart Array: /dev/ida/c0d0 for system and /dev/ida/c0d1fo=
r
data

Then we installed the Mandrake 8.0 with lvm-9._beta2 included.
/etc/modules.conf has been updated for lvm.

1) fdisk recognizes both the logical units

   P=E9riph=E9rique Amorce    D=E9but       Fin    Blocs   Id  Syst=E8m=
e
/dev/ida/c0d0p1   *        10      1204   4875600    5  Etendue
/dev/ida/c0d0p3             1         9     36704   12  Diagnostics Com=
paq
/dev/ida/c0d0p5            10        71    252944   82  Echange Linux
/dev/ida/c0d0p6            72       133    252944   83  Linux
/dev/ida/c0d0p7           134       196    257024   83  Linux
/dev/ida/c0d0p8           197       710   2097104   83  Linux
/dev/ida/c0d0p9           711       810    407984   83  Linux
/dev/ida/c0d0p10          811       842    130544   83  Linux
/dev/ida/c0d0p11          843      1204   1476944   83  Linux


   P=E9riph=E9rique Amorce    D=E9but       Fin    Blocs   Id  Syst=E8m=
e
/dev/ida/c0d1p1   *         1      3153  12864224    5  Etendue
/dev/ida/c0d1p5             1       501   2044048   8e  Linux LVM
/dev/ida/c0d1p6           502      1002   2044064   8e  Linux LVM
/dev/ida/c0d1p7          1003      1252   1019984   8e  Linux LVM
/dev/ida/c0d1p8          1253      1502   1019984   8e  Linux LVM
/dev/ida/c0d1p9          1503      1752   1019984   8e  Linux LVM
/dev/ida/c0d1p10         1753      2002   1019984   8e  Linux LVM
/dev/ida/c0d1p11         2003      2252   1019984   8e  Linux LVM
/dev/ida/c0d1p12         2253      2502   1019984   8e  Linux LVM
/dev/ida/c0d1p13         2503      2752   1019984   8e  Linux LVM
/dev/ida/c0d1p14         2753      3002   1019984   8e  Linux LVM
/dev/ida/c0d1p15         3003      3153    616064   8e  Linux LVM

2) Here is /proc/partitions

cat /proc/partitions  | more
major minor  #blocks  name     rio rmerge rsect ruse wio wmerge wsect w=
use
runni
ng use aveq

  72     0    4912320 ida/c0d0 11787 14122 203912 7880 9229 7505 136224=

900870 068750 908750
  72     1          1 ida/c0d0p1 3 0 6 0 0 0 0 0 0 0 0
  72     3      36704 ida/c0d0p3 3 0 6 0 0 0 0 0 0 0 0
  72     5     252944 ida/c0d0p5 2 0 16 0 0 0 0 0 0 0 0
  72     6     252944 ida/c0d0p6 1729 2139 30938 1420 3304 3176 52152
203550 0 50200 204970
  72     7     257024 ida/c0d0p7 510 3022 28214 5170 3951 246 33576 116=
330
0 45450 121500
  72     8    2097104 ida/c0d0p8 8968 8884 142774 1290 1789 2807 38808
560180 025730 561470
  72     9     407984 ida/c0d0p9 25 3 182 0 62 587 5192 8690 0 1640 869=
0
  72    10     130544 ida/c0d0p10 23 65 662 0 110 689 6392 10910 0 2770=

10910
  72    11    1476944 ida/c0d0p11 12 3 78 0 13 0 104 1210 0 520 1210
  72    16   12864240 ida/c0d1 102 18 240 0 0 0 0 0 0 0 0
  72    17          1 ida/c0d1p1 4 0 8 0 0 0 0 0 0 0 0
  72    21    2044048 ida/c0d1p5 3 0 6 0 0 0 0 0 0 0 0
  72    22    2044064 ida/c0d1p6 4 0 8 0 0 0 0 0 0 0 0
  72    23    1019984 ida/c0d1p7 4 0 8 0 0 0 0 0 0 0 0
  72    24    1019984 ida/c0d1p8 4 0 8 0 0 0 0 0 0 0 0
  72    25    1019984 ida/c0d1p9 4 0 8 0 0 0 0 0 0 0 0
  72    26    1019984 ida/c0d1p10 4 0 8 0 0 0 0 0 0 0 0
  72    27    1019984 ida/c0d1p11 4 0 8 0 0 0 0 0 0 0 0
  72    28    1019984 ida/c0d1p12 4 0 8 0 0 0 0 0 0 0 0
  72    29    1019984 ida/c0d1p13 4 0 8 0 0 0 0 0 0 0 0
  72    30    1019984 ida/c0d1p14 4 0 8 0 0 0 0 0 0 0 0
  72    31     616064 ida/c0d1p15 4 0 8 0 0 0 0 0 0 0 0
   3     0     663054 hda 0 0 0 0 0 0 0 0 0 0 0

3) The problem is the following:

# lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...=
)
lvmdiskscan -- /dev/ida/c0d0p1  [       4.65 GB] DOS extended partition=

[0x5]
lvmdiskscan -- /dev/ida/c0d0p3  [      35.84 MB] Primary   [0x12]
lvmdiskscan -- /dev/ida/c0d0p5  [     247.02 MB] Extended LINUX swap
partition [0x82]
lvmdiskscan -- /dev/ida/c0d0p6  [     247.02 MB] Extended LINUX native
partition [0x83]
lvmdiskscan -- /dev/ida/c0d0p7  [        251 MB] Extended LINUX native
partition [0x83]
lvmdiskscan -- /dev/ida/c0d0p8  [          2 GB] Extended LINUX native
partition [0x83]
lvmdiskscan -- /dev/ida/c0d0p9  [     398.42 MB] Extended LINUX native
partition [0x83]
lvmdiskscan -- /dev/ida/c0d0p10 [     127.48 MB] Extended LINUX native
partition [0x83]
lvmdiskscan -- /dev/ida/c0d0p11 [       1.41 GB] Extended LINUX native
partition [0x83]
lvmdiskscan -- /dev/ida/c0d1p1  [       4.65 GB] DOS extended partition=

[0x5]
lvmdiskscan -- /dev/ida/c0d1p5  [     247.02 MB] Extended LINUX swap
partition [0x82]
lvmdiskscan -- /dev/ida/c0d1p6  [     247.02 MB] Extended LINUX native
partition [0x83]

lvmdiskscan -- /dev/ida/c0d1p7  [        251 MB] Extended LINUX native
partition [0x83]
lvmdiskscan -- /dev/ida/c0d1p8  [          2 GB] Extended LINUX native
partition [0x83]
lvmdiskscan -- /dev/ida/c0d1p9  [     398.42 MB] Extended LINUX native
partition [0x83]
lvmdiskscan -- /dev/ida/c0d1p10 [     127.48 MB] Extended LINUX native
partition [0x83]
lvmdiskscan -- /dev/ida/c0d1p11 [       1.41 GB] Extended LINUX native
partition [0x83]
lvmdiskscan -- no valid disks / partitions found
lvmdiskscan -- please check your disk device special files!

As you can see, lvmdiskscan sees everthing in double, as if c0d1 was
pointing to c0d0.

But the system works fine out of lvm. I can mount /dev/ida/c0d1p8 on /t=
est
and create a file
# mount /dev/ida/c0d1p8 /test
# touch /test/test
# ls /test
lost+found/  test
# umount /test

pvcreate reacts the same way
# pvcreate /dev/ida/c0d1p14
pvcreate -- extended partition "/dev/ida/c0d1p14" doesn't exist
     -> actually, /dev/ida/c0d0p14 does not exist but c0d1p14 does

# pvcreate /dev/ida/c0d1p5
pvcreate -- can't use Linux SWAP partition "/dev/ida/c0d1p5"
     -> /dev/ida/c0d0p5 is indeed a swap partition, see lvmdiskscan

# pvcreate /dev/ida/c0d1p6
pvcreate -- invalid partition type 0x83 for "/dev/ida/c0d1p6" (must be
0x8e)
     -> In fact, c0d1p6 is of 0x8e type (see fdisk) , but c0d0p6 is ind=
eed
of 0x83 type

I've been seeking around the internet for solutions or similar bugs but=
 I
just found one similar:

     http://lists.sistina.com/pipermail/linux-lvm/2000-October/005262.h=
tml


Any help ?

Thanks,

Vincent Guillet
=
