From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Sorry to bother you...
Message-ID: <20030527154441.A9162@sistina.com>
References: <003c01c320a6$1f0299f0$4d00a8c0@epsilon>
Mime-Version: 1.0
In-Reply-To: <003c01c320a6$1f0299f0$4d00a8c0@epsilon>; from kim@nibland.org on Thu, May 22, 2003 at 11:07:09PM +0200
Content-Transfer-Encoding: quoted-printable
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
Date: Tue May 27 08:54:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Kim,

in case you have no backup, it is unlikely that you can retrieve a lot of
your data anyway, because important metadata (and data) of the reiserfs=20
is likely lost.

See my other mail today on linux-lvm for the 3 options you have to activa=
te your
VG with or without disk replacement.


On Thu, May 22, 2003 at 11:07:09PM +0200, Kim Kr=FCger-Monsen wrote:
> Hi!
>=20
> I'm really sorry to bother you, but I'm desperate and I don't know any =
more to do in order to get my LVM partitions back up again.
>=20
> I have a machine with three discs and together they formed one 226GB la=
rge partition using LVM. One of those discs crashed and the data is unrec=
overable, leaving me with two discs which still contains data, but how do=
 I extract the data?? I'm using reiserfs since it was the only filesystem=
 which could be resized on the fly as I understood it. Somehow the volume=
 group vg01 is nowhere to find any more after the crash, but I can still =
do a pvscan and see that the discs are intact.
>=20
> Please give me some hints here. I have searched and searched for inform=
ation and I can't find anything applicable in my case. I really need to g=
et to the data that's still there hidden... no backup is made due to anot=
her problem. :-(
>=20
>=20
> Disc number one with still intact information.
>=20
> --- Physical volume ---
> PV Name               /dev/hda8
> VG Name               vg01
> PV Size               24.66 GB [51710337 secs] / NOT usable 4.19 MB [LV=
M: 152 KB]
> PV#                   1
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              6311
> Free PE               0
> Allocated PE          6311
> PV UUID               13x8k8-ZCFk-aQib-FJXh-mDMj-QtG5-Xsfn4X
>=20
> Disc number two with still intact information.
>=20
> --- Physical volume ---
> PV Name               /dev/hdd1
> VG Name               vg01
> PV Size               115.04 GB [241254657 secs] / NOT usable 4.25 MB [=
LVM: 243 KB]
> PV#                   2
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              29448
> Free PE               0
> Allocated PE          29448
> PV UUID               knCAic-bPGx-jc7e-ZviH-etMb-s0t2-TBWh6H
>=20
>=20
>=20
> I have replaced the 80GB /dev/hdc1 with one 1GB drive just to see if it=
 had any effect, but no...
> Disc number three=20
>=20
> pvdisplay -- "/dev/hdc1" is a new physical volume of 1.02 GB
>=20
>=20
> [root@linux etc]# lvmdiskscan
> lvmdiskscan -- reading all disks / partitions (this may take a while...=
)
> lvmdiskscan -- /dev/hdc1  [       1.02 GB] Primary  LVM partition [0x8E=
]
> lvmdiskscan -- /dev/hdd1  [     115.04 GB] Primary  LVM partition [0x8E=
]
> lvmdiskscan -- /dev/hda1  [     509.38 MB] Primary  LINUX native partit=
ion [0x83]
> lvmdiskscan -- /dev/hda2  [       4.88 GB] Primary  LINUX native partit=
ion [0x83]
> lvmdiskscan -- /dev/hda3  [       4.88 GB] Primary  LINUX native partit=
ion [0x83]
> lvmdiskscan -- /dev/hda4  [      28.08 GB] Primary  Windows98 extended =
partition [0x0F]
> lvmdiskscan -- /dev/hda5  [       1.46 GB] Extended LINUX native partit=
ion [0x83]
> lvmdiskscan -- /dev/hda6  [       1.46 GB] Extended LINUX native partit=
ion [0x83]
> lvmdiskscan -- /dev/hda7  [     509.38 MB] Extended LINUX swap partitio=
n [0x82]
> lvmdiskscan -- /dev/hda8  [      24.66 GB] Extended LVM partition [0x8E=
]
> lvmdiskscan -- /dev/hdb1  [      42.95 GB] Primary  LINUX native partit=
ion [0x83]
> lvmdiskscan -- 4 disks
> lvmdiskscan -- 0 whole disks
> lvmdiskscan -- 0 loop devices
> lvmdiskscan -- 0 multiple devices
> lvmdiskscan -- 0 network block devices
> lvmdiskscan -- 11 partitions
> lvmdiskscan -- 3 LVM physical volume partitions
>=20
>=20
> [root@linux etc]# ll /etc/lvmconf/
> total 5514
> -rw-r-----    1 root     root      1256248 Mar  2 05:43 vg01.conf
> -rw-r-----    1 root     root      1009720 Mar  2 05:42 vg01.conf.1.old
> -rw-r-----    1 root     root       927528 Mar  2 05:39 vg01.conf.2.old
> -rw-r-----    1 root     root       848480 Mar  2 01:33 vg01.conf.3.old
> -rw-r-----    1 root     root       843600 Mar  2 01:32 vg01.conf.4.old
> -rw-r-----    1 root     root       434000 Mar  2 01:06 vg01.conf.5.old
> -rw-r-----    1 root     root       290956 Mar  2 01:04 vg01.conf.6.old
>=20
> /etc/lvmtab is empty same goes for the /etc/lvmtab.d directory
>=20
> The device /dev/vg01....  is also gone but I think it was there earlier=
 after the crash, but I have tried several ways of getting the info back =
so it might have been removed by issuing any of the commands??
>=20
> Thanks a bunch for any hints or directions in order to get the informat=
ion back...
>=20
>     /Kim
>=20

--=20

Regards,
Heinz    -- The LVM Guy --

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
