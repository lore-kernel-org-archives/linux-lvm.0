Date: Tue, 9 Oct 2001 11:45:51 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgcreate blackhole
Message-ID: <20011009114551.D25020@sistina.com>
References: <E15qhEx-00076f-00@hermes.sistina.com> <3BC2405B.B6BDBE97@bellatlantic.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3BC2405B.B6BDBE97@bellatlantic.net>; from sarma@bellatlantic.net on Mon, Oct 08, 2001 at 08:10:03PM -0400
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
Content-Type: text/plain; charset="windows-1254"
To: linux-lvm@sistina.com

This should be fixed in CVS.
Please fetch the code form there and try (follow instructions at
www.sistina.com).

Regards,
Heinz    -- The LVM Guy --


On Mon, Oct 08, 2001 at 08:10:03PM -0400, Uday Bhaskar Sarma Seetamraju wro=
te:
> % uname -a
> Linux linux1.localdomain 2.4.3-20mdk #1 Sun Apr 15 23:03:10 CEST 2001 i68=
6 Unknown
> (Mandrake Distribution 8.0)
>=20
> % cat /proc/lvm/global
> LVM module version 0.9.1_beta2 (18/01/2001)
> <see rest of output below>
>=20
> % vgcreate --version
> vgcreate: unrecognized option `--version'
> Logical Volume Manager 0.9
> Heinz Mauelshagen, Sistina Software  13/11/2000  (IOP 10)
> ...
>=20
> Summary: VGCREATE finishes nicely (verbose output below).
>         But a VGSCAN immediately after vgcreate , shows nothing changed.
>=20
> A little longer Summary of the problem:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Have had LVM up for a little while now.
> Wanted to add LVM over RAID1 (ref: my previous email help).
> Created two devices md0 and md1 (see the raidtab below).
> Had the same identical problem with md0.  After reading
> the linux-lvm list, I tried it with md1 only, butno difference.
> So, I am writing this email re: the md1 experience only.
>=20
> Note: All the lvm commands were run ONLY in linux-single-user mode.
>     But some of the LVM volumes were mounted while running the
>     cgvreate, pvcreate commands.   From my prior experience
>     and by the man pages, it doesn't matter, but then....
>=20
> DETAILS of the PROBLEM
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Run the command
>     % vgcreate -v MKP4 /dev/md1
> (See detailed output below).
>=20
> vgscan does not show MKP4.  PVSCAN shows unknown volume.  see listing bel=
ow.
>=20
> After that any attempt to modify the LVM setup (eg: vgextend, pvcreate, e=
tc...) give the following error.  Ofcourse, pvscan and vgscan do not give e=
rrors.
>=20
>     pvcreate -- ERROR: VGDA in kernel and lvmtab are NOT consistent; plea=
se run vgscan
>=20
> Rebooting does not help.
> Deleting the /etc/lvmtab and /etc/lvmtab.d didn't make any difference.
> I understand that the /etc/lvmconf directory is more of a backup.
> And that directory has a MKP4.conf in it! (I guess vgcreate
> does say that its doing so).
>=20
> To see if md0 and md1 are functionally ok, I did a pvcreate -ff
> to remove any links between the raid1 devices and any known or unknown
> VGs.  Then I did a mke2fs /dev/md0 and /dev/md1 and mounted them and
> used them just fine as regular linux-e2fs file systems.
>=20
> The LVM came with the version Mandrake 8.0 distribution.
> I used the LV modules out of the 'box'.
> Just in case it makes a difference, I found this about the gcc that came
> with the 8.0 distribution of Mandrake (after having read some comments
> about using gcc versions > 2.95.2)
> % gcc --version
> 2.96
>=20
> Also, noted that /etc/rc.d/rc.sysinit loads up LVM before it
> loads up the raid module and devices.  So, I moved the script lines
> to load up LVM AFTER raid.  No difference at all.   If any difference
> it should be if I had no problems with the vgcreate...
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> % vgcreate -v MKP4 /dev/md1
> vgcreate -- checking volume group name
> vgcreate -- checking volume group directory existence
> vgcreate -- locking logical volume manager
> vgcreate -- checking volume group "MKP4" existence
> vgcreate -- counting all existing volume groups
> vgcreate -- reading all physical volume data from disks
> vgcreate -- checking if all given physical volumes in command line are new
> vgcreate -- checking physical volumes name "/dev/md1"
> vgcreate -- checking physical volume "/dev/md1"
> vgcreate -- getting size of physical volume "/dev/md1"
> vgcreate -- size of physical volume "/dev/md1"  is 4194048 sectors
> vgcreate -- checking for new physical volume "/dev/md1"
> vgcreate -- checking for identical physical volumes on command line
> vgcreate -- 1 physical volume will be inserted into volume group "MKP4"
> vgcreate -- checking command line arguments
> vgcreate -- INFO: maximum of 256 physical volumes
> vgcreate -- INFO: maximum of 256 logical volumes
> vgcreate -- setting up volume data for creation
> vgcreate -- INFO: using default physical extent size 4 MB
> vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
> vgcreate -- storing volume group data on disk(s)
> vgcreate -- removing any invalid special files of volume group "MKP4"
> vgcreate -- creating volume group directory /dev/MKP4
> vgcreate -- creating VGDA for volume group "MKP4" in kernel
> vgcreate -- inserting volume group "MKP4" into "/etc/lvmtab"
> vgcreate -- checking volume group name "MKP4"
> vgcreate -- checking volume group consistency of "MKP4"
> vgcreate -- checking existence of "/etc/lvmtab.d"
> vgcreate -- storing volume group data of "MKP4" in "/etc/lvmtab.d/MKP4.tm=
p"
> vgcreate -- storing physical volume data of "MKP4" in "/etc/lvmtab.d/MKP4=
.tmp"
> vgcreate -- storing logical volume data of volume group "MKP4" in "/etc/l=
vmtab.d/MKP4.tmp"
> vgcreate -- renaming "/etc/lvmtab.d/MKP4.tmp" to "/etc/lvmtab.d/MKP4"
> vgcreate -- doing automatic backup of volume group "MKP4"
> vgcreate -- checking volume group name "MKP4"
> vgcreate -- checking volume group consistency of "MKP4"
> vgcreate -- checking existence of "/etc/lvmconf"
> vgcreate -- storing volume group data of "MKP4" in "/etc/lvmconf/MKP4.con=
f.tmp"
> vgcreate -- storing physical volume data of "MKP4" in "/etc/lvmconf/MKP4.=
conf.tmp"
> vgcreate -- storing logical volume data of volume group "MKP4" in "/etc/l=
vmconf/MKP4.conf.tmp"
> vgcreate -- checking existence of "/etc/lvmconf/MKP4.conf.tmp"
> vgcreate -- checking existence of "/etc/lvmconf/MKP4.conf"
> vgcreate -- renaming "/etc/lvmconf/MKP4.conf.tmp" to "/etc/lvmconf/MKP4.c=
onf"
> vgcreate -- unlocking logical volume manager
> vgcreate -- volume group "MKP4" successfully created and activated
>=20
>=20
> % pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/md0"   is in no VG  [2 GB]
> pvscan -- ACTIVE   PV "/dev/md1"    is associated to an unknown VG (run v=
gscan)
> pvscan -- ACTIVE   PV "/dev/hda7"  of VG "migataa"      [2 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda8"  of VG "migataa"      [2 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda10" of VG "maakompa.old" [2 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda11" of VG "maakompa.old" [2 GB / 0 free]
> pvscan -- inactive PV "/dev/hda12" is in no VG  [3.08 GB]
> pvscan -- inactive PV "/dev/hdc7"  is in no VG  [2.05 GB]
> pvscan -- ACTIVE   PV "/dev/hdc8"  of VG "NFS"          [2.04 GB / 0 free]
> pvscan -- inactive PV "/dev/hdc10" is in no VG  [2.05 GB]
> pvscan -- ACTIVE   PV "/dev/hdc11" of VG "DBMS"         [2.04 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdc12" of VG "WEB"          [2.04 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdc14" of VG "AUDIO"        [3 GB / 4 MB free]
> pvscan -- total: 13 [28.32 GB] / in use: 9 [19.15 GB] / in no VG: 4 [9.18=
 GB]
>=20
> % vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "migataa"
> vgscan -- found active volume group "maakompa.old"
> vgscan -- found active volume group "NFS"
> vgscan -- found active volume group "DBMS"
> vgscan -- found active volume group "WEB"
> vgscan -- found active volume group "AUDIO"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: you may not have an actual VGDA backup of your volume =
groups
>=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> lvmdiskscan -- reading all disks / partitions (this may take a while...)
> lvmdiskscan -- /dev/md0   [          2 GB] free multiple device
> lvmdiskscan -- /dev/md1   [          2 GB] free multiple device
> lvmdiskscan -- /dev/hda1  [          3 GB] Primary  LINUX native partitio=
n [0x83]
> lvmdiskscan -- /dev/hda2  [      16.08 GB] DOS extended partition [0x5]
> lvmdiskscan -- /dev/hda5  [    1023.72 MB] Extended LINUX swap partition =
[0x82]
> lvmdiskscan -- /dev/hda6  [          2 GB] Extended  [0xFD]
> lvmdiskscan -- /dev/hda7  [          2 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda8  [          2 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda9  [          2 GB] Extended  [0xFD]
> lvmdiskscan -- /dev/hda10 [          2 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda11 [          2 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda12 [       3.08 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdc1  [          8 GB] Primary  LVM partition [0x8E]
> lvmdiskscan -- /dev/hdc2  [      20.63 GB] DOS extended partition [0x5]
> lvmdiskscan -- /dev/hdc5  [       2.05 GB] Extended LINUX native partitio=
n [0x83]
> lvmdiskscan -- /dev/hdc6  [          2 GB] Extended  [0xFD]
> lvmdiskscan -- /dev/hdc7  [       2.05 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdc8  [       2.05 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdc9  [          2 GB] Extended  [0xFD]
> lvmdiskscan -- /dev/hdc10 [       2.05 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdc11 [       2.05 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdc12 [       2.05 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdc13 [       1.24 GB] Extended LINUX swap partition =
[0x82]
> lvmdiskscan -- /dev/hdc14 [       3.01 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- 2 disks
> lvmdiskscan -- 0 whole disks
> lvmdiskscan -- 0 loop devices
> lvmdiskscan -- 2 multiple devices
> lvmdiskscan -- 0 network block devices
> lvmdiskscan -- 22 partitions
> lvmdiskscan -- 12 LVM physical volume partitions
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> (Cut n pasted via Win98 telnet window).
> % cat /etc/lvmconf/MKP4.conf
> =B4       MKP4=05=99TS=04b=05=EF=04=E0=05]=05=BD=B0=06=02=05=8E=B3=064=C6=
=05=C8=04*=06n=040=01=BE=95=026=03=16=03=ABn=E6=02!=05=06=03=04=01=01=01=01=
=EC=06 =FF=01P=D1<=83ieT9rIw
> AlvcgJKpcvjcKLiwzfUn0d2j8=BCP=05@=D8!=02@=C8!=02@ =FC=FF=BF=D8!=02@
> =BF=05@=04=E4#=02@=EC1=05@=D8!=02@=01=94[=01@=8E=FFw=01K+=01@=D0=FC=FF=BF=
@Z=01@%=89=14T=01@=D8!=02@=FCG=05@=D8!=02@`=D3@,#=02@X$=02@=14V=01@=14T=01@=
@Z=01@7=89
> =90=FC=FF=BF`=D3@=94[=01@=18$=02@=D8!=02@
> =BF=05@=B0=FC=FF=BF=CE=D2@=C0=C07=89=BCP=05@,=1F=17@,=FD=FF=BF=84Y=01@=C8=
=FC=FF=BF=02HM=01=04=04=12=18=80=80=9AHI=01=E4=01=1C</dev/md1MKP4linux1.loc=
aldoma
> in1002404658=01   =01=02=FF? =FF=018=A6mV8n8epwTZdxyRRHZw4n2t2c8u2uyiJK=
=FC0=020=020=020=020=020=020=020=020=020=020=02
> 0=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=
=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=02=
0=020=020=02
> 0=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=
=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=02=
0=020=020=02
> 0=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=
=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=02=
0=020=020=02
> 0=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=
=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=02=
0=020=020=02
> 0=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=
=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=02=
0=020=020=02
> 0=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=
=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=020=02=
0=020=020=02
> 0=020=020=020=020=02
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> % cat /proc/lvm/global
> LVM module version 0.9.1_beta2 (18/01/2001)
>=20
> Total:  7 VGs  9 PVs  6 LVs (6 LVs open 6 times)
>=20
> Global: 95531 bytes malloced   IOP version: 10   0:15:46 active
>=20
> VG:  migataa  [2 PV, 1 LV/1 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 4186112 /1022 total  4186112 /1022 used  0 /0 free
>   PVs: [AA] hda7                   2093056 /511      2093056 /511        =
    0 /0
>        [AA] hda8                   2093056 /511      2093056 /511        =
    0 /0
>     LV:  [AWDL  ] 1                          4186112 /1022     1x open
>=20
> VG:  maakompa.old  [2 PV, 1 LV/1 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 4186112 /1022 total  4186112 /1022 used  0 /0 free
>   PVs: [AA] hda10                  2093056 /511      2093056 /511        =
    0 /0
>        [AA] hda11                  2093056 /511      2093056 /511        =
    0 /0
>     LV:  [AWDL  ] 1                          4186112 /1022     1x open
>=20
> VG:  NFS  [1 PV, 1 LV/1 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 2142208 /523 total  2142208 /523 used  0 /0 free
>   PV:  [AA] hdc8                   2142208 /523      2142208 /523        =
    0 /0
>     LV:  [AWDL  ] 1                          2142208 /523      1x open
>=20
> VG:  DBMS  [1 PV, 1 LV/1 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 2142208 /523 total  2142208 /523 used  0 /0 free
>   PV:  [AA] hdc11                  2142208 /523      2142208 /523        =
    0 /0
>     LV:  [AWDL  ] 1                          2142208 /523      1x open
>=20
> VG:  WEB  [1 PV, 1 LV/1 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 2142208 /523 total  2142208 /523 used  0 /0 free
>   PV:  [AA] hdc12                  2142208 /523      2142208 /523        =
    0 /0
>     LV:  [AWDL  ] 1                          2142208 /523      1x open
>=20
> VG:  AUDIO  [1 PV, 1 LV/1 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 3149824 /769 total  3145728 /768 used  4096 /1 free
>   PV:  [AA] hdc14                  3149824 /769      3145728 /768        =
 4096 /1
>     LV:  [AWDL  ] 1                          3145728 /768      1x open
>=20
> VG:  MKP4  [1 PV, 0 LV/0 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 2093056 /511 total  0 /0 used  2093056 /511 free
>   PV:  [AA] md1                    2093056 /511            0 /0        20=
93056 /511
>     LVs: none
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> % cat /proc/partitions
> major minor  #blocks  name     rio rmerge rsect ruse wio wmerge wsect wus=
e running use aveq
>=20
>    9     0    2097024 md0 0 0 0 0 0 0 0 0 0 0 0
>    9     1    2097024 md1 0 0 0 0 0 0 0 0 0 0 0
>   58     0    4186112 lvma 0 0 0 0 0 0 0 0 0 0 0
>   58     1    4186112 lvmb 0 0 0 0 0 0 0 0 0 0 0
>   58     2    2142208 lvmc 0 0 0 0 0 0 0 0 0 0 0
>   58     3    2142208 lvmd 0 0 0 0 0 0 0 0 0 0 0
>   58     4    2142208 lvme 0 0 0 0 0 0 0 0 0 0 0
>   58     5    3145728 lvmf 0 0 0 0 0 0 0 0 0 0 0
>    3     0   20010312 hda 1390 3000 20768 15590 529 1540 15918 11310 0 15=
500 26900
>    3     1    3145432 hda1 733 1240 15778 6810 503 1417 15432 10780 0 670=
0 17590
>    3     2          1 hda2 9 0 18 160 0 0 0 0 0 160 160
>    3     5    1048288 hda5 2 0 16 10 0 0 0 0 0 10 10
>    3     6    2097112 hda6 5 0 34 430 1 0 8 0 0 430 430
>    3     7    2097112 hda7 101 875 2030 480 18 9 224 460 0 670 940
>    3     8    2097112 hda8 17 5 44 220 0 0 0 0 0 220 220
>    3     9    2097112 hda9 17 0 58 280 6 114 246 20 0 300 300
>    3    10    2097112 hda10 87 875 1924 640 0 0 0 0 0 640 640
>    3    11    2097112 hda11 21 5 70 250 1 0 8 50 0 300 300
>    3    12    3233632 hda12 11 0 22 200 0 0 0 0 0 200 200
>   22     0   30016224 hdc 971 3525 9346 4700 30 124 518 90 0 4730 4790
>   22     1    8388544 hdc1 9 0 18 30 0 0 0 0 0 30 30
>   22     2          1 hdc2 9 0 18 220 0 0 0 0 0 220 220
>   22     5    2146000 hdc5 39 0 300 320 19 10 232 30 0 330 350
>   22     6    2097112 hdc6 34 0 92 300 1 0 8 0 0 300 300
>   22     7    2146000 hdc7 11 0 22 160 0 0 0 0 0 160 160
>   22     8    2146000 hdc8 91 880 1960 370 1 0 8 10 0 380 380
>   22     9    2097112 hdc9 13 0 50 180 6 114 246 20 0 200 200
>   22    10    2146000 hdc10 11 0 22 140 0 0 0 0 0 140 140
>   22    11    2146000 hdc11 91 880 1960 300 1 0 8 10 0 310 310
>   22    12    2146000 hdc12 91 880 1960 270 1 0 8 10 0 280 280
>   22    13    1305328 hdc13 2 0 16 30 0 0 0 0 0 30 30
>   22    14    3154000 hdc14 91 885 1970 290 1 0 8 10 0 300 300
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> % cat /etc/raidtab
> raiddev /dev/md0
>         raid-level      1
>         nr-raid-disks   2
>         nr-spare-disks  0
>         chunk-size      4
>         persistent-superblock 1
>         device          /dev/hda6
>         raid-disk       0
>         device          /dev/hdc6
>         raid-disk       1
>=20
> raiddev /dev/md1
>         raid-level      1
>         nr-raid-disks   2
>         nr-spare-disks  0
>         chunk-size      4
>         persistent-superblock 1
>         device          /dev/hda9
>         raid-disk       0
>         device          /dev/hdc9
>         raid-disk       1
>=20
>=20
> % cat /proc/mdstat
> Personalities : [raid1]
> read_ahead 1024 sectors
> md1 : active raid1 hdc9[1] hda9[0]
>       2097024 blocks [2/2] [UU]
>=20
> md0 : active raid1 hdc6[1] hda6[0]
>       2097024 blocks [2/2] [UU]
>=20
> unused devices: <none>
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> % fdisk -l /dev/hda
> Disk /dev/hda: 16 heads, 63 sectors, 39703 cylinders
> Units =3D cylinders of 1008 * 512 bytes
>=20
>    Device Boot    Start       End    Blocks   Id  System
> /dev/hda1   *         1      6241   3145432+  83  Linux
> /dev/hda2          6242     39703  16864848    5  Extended
> /dev/hda5          6242      8321   1048288+  82  Linux swap
> /dev/hda6          8322     12482   2097112+  fd  Linux raid autodetect
> /dev/hda7         12483     16643   2097112+  8e  Linux LVM
> /dev/hda8         16644     20804   2097112+  8e  Linux LVM
> /dev/hda9         20805     24965   2097112+  fd  Linux raid autodetect
> /dev/hda10        24966     29126   2097112+  8e  Linux LVM
> /dev/hda11        29127     33287   2097112+  8e  Linux LVM
> /dev/hda12        33288     39703   3233632+  8e  Linux LVM
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> % fdisk -l /dev/hdc
> Disk /dev/hdc: 16 heads, 63 sectors, 59556 cylinders
> Units =3D cylinders of 1008 * 512 bytes
>=20
>    Device Boot    Start       End    Blocks   Id  System
> /dev/hdc1   *         1     16644   8388544+  8e  Linux LVM
> /dev/hdc2         16645     59556  21627648    5  Extended
> /dev/hdc5         16645     20902   2146000+  83  Linux
> /dev/hdc6         20903     25063   2097112+  fd  Linux raid autodetect
> /dev/hdc7         25161     29418   2146000+  8e  Linux LVM
> /dev/hdc8         29419     33676   2146000+  8e  Linux LVM
> /dev/hdc9         33677     37837   2097112+  fd  Linux raid autodetect
> /dev/hdc10        37935     42192   2146000+  8e  Linux LVM
> /dev/hdc11        42193     46450   2146000+  8e  Linux LVM
> /dev/hdc12        46451     50708   2146000+  8e  Linux LVM
> /dev/hdc13        50709     53298   1305328+  82  Linux swap
> /dev/hdc14        53299     59556   3154000+  8e  Linux LVM
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> [EoInfo]
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
