From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Volume group inaccessable after RAID metadice
    trouble.
Message-Id: <20020214111948.C10678@sistina.com>
References: <3C6AB5E9.8000300@nocrew.org>
MIME-Version: 1.0
In-Reply-To: <3C6AB5E9.8000300@nocrew.org>; from marbud@nocrew.org on Wed,
    Feb 13, 2002 at 07:52:25PM +0100
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
Date: Thu Feb 14 04:21:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Martin,

based on the error (vgscan -- ERROR "lv_read_all_lv(): number of LV" can'=
t
get data of volume group "vg1" from physical volume(s)), it looks like
vgscan counts a different number rather than 1 LV scanning the on-disk ta=
ble
of LV structures.

Could you send the output of "vgscan -d" to me in private email
(mge@sistina.com) and attach the file Martin_md0.vgda you created with
"dd if=3D/dev/md0 of=3DMartin_md0.vgda bs=3D1k count=3D1024" as well for =
further
investigation.

Regards,
Heinz    -- The LVM Guy --

On Wed, Feb 13, 2002 at 07:52:25PM +0100, Martin Budsj=F6 wrote:
> Hi!
>=20
> I have find myself in a troublesome spot. After a disk failure, with=20
> lots of IDE bus timeouts etc i managed to get the disk in error replace=
d=20
> and my raid5 set in full operation. But i can't get the volume group=20
> active any more.  The volume group in question is VG1.
>=20
> I have read one year worth of messages in this list archives, and i=20
> still can't se how i can recover my VG1.
>=20
> Please find the details below
>=20
> dent:/etc/lvmconf >sudo pvdata --version
> pvdata: Logical Volume Manager 1.0.1-rc4
> Heinz Mauelshagen, Sistina Software  03/10/2001 (IOP 10)
>=20
> dent:/etc/lvmconf >uname -a
> Linux dent 2.4.17 #4 Thu Jan 3 00:39:34 CET 2002 alpha unknown
>     The kernel is compiled with the  lvm-1.0.1-rc4-2.4.17 patch.
>=20
> dent:~ >sudo pvscan
> Password:
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/md0"    is associated to an unknown VG (run=
=20
> vgscan)
> pvscan -- ACTIVE   PV "/dev/sda7"  of VG "vg0" [1.86 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sda8"  of VG "vg0" [1.86 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sda9"  of VG "vg0" [68.00 MB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sda10" of VG "vg0" [68.00 MB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sda11" of VG "vg0" [68.00 MB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sda12" of VG "vg0" [68.00 MB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sda13" of VG "vg0" [56.00 MB / 0 free]
> pvscan -- WARNING: physical volume "/dev/hdg1" belongs to a meta device
> pvscan -- WARNING: physical volume "/dev/hde1" belongs to a meta device
> pvscan -- total: 10 [41.37 GB] / in use: 10 [41.37 GB] / in no VG: 0 [0=
]
>=20
>=20
> dent:~ >sudo vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "vg1"
> vgscan -- ERROR "lv_read_all_lv(): number of LV" can't get data of=20
> volume group "vg1" from physical volume(s)
> vgscan -- found active volume group "vg0"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volum=
e=20
> groups
>=20
> dent:~ >sudo vgchange -a y vg1
> vgchange -- volume group "vg1" does not exist
>=20
> dent:~ >sudo vgcfgrestore  -l -l -n vg1
> --- Volume group ---
> VG Name               vg1
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  1
> MAX LV                255
> Cur LV                1
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                255
> Cur PV                1
> Act PV                1
> VG Size               37.29 GB
> PE Size               4.00 MB
> Total PE              9545
> Alloc PE / Size       9324 / 36.42 GB
> Free  PE / Size       221 / 884.00 MB
> VG UUID               gK6O7c-YSy6-SHqF-6oiZ-L47x-PLqR-JsJzDq
>=20
> --- Logical volume ---
> LV Name                /dev/vg1/lv1
> VG Name                vg1
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 0
> LV Size                36.42 GB
> Current LE             9324
> Allocated LE           9324
> Allocation             next free
> Read ahead sectors     120
> Block device           58:1
>=20
>=20
> --- Physical volume ---
> PV Name               /dev/md0
> VG Name               vg1
> PV Size               37.29 GB / NOT usable 5.62 MB [LVM: 161.00 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              9545
> Free PE               221
> Allocated PE          9324
> PV UUID               6qOL59-G611-Groj-PMBU-y4lg-ZtdX-IhaOuQ
>=20
> dent:~ >cat /proc/mdstat
> Personalities : [raid1] [raid5]
> read_ahead 1024 sectors
> md0 : active raid5 hdg1[2] hdf1[1] hde1[0]
>       39102080 blocks level 5, 32k chunk, algorithm 2 [3/3] [UUU]
>=20
>=20
> dent:~ >sudo pvdisplay /dev/md0
> --- Physical volume ---
> PV Name               /dev/md0
> VG Name               vg1
> PV Size               37.29 GB / NOT usable 5.62 MB [LVM: 161.00 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              9545
> Free PE               221
> Allocated PE          9324
> PV UUID               6qOL59-G611-Groj-PMBU-y4lg-ZtdX-IhaOuQ
>=20
>=20
> dent:~ >sudo  pvdata  -v -L /dev/md0
>=20
> --- List of logical volumes ---
>=20
> --- Logical volume ---
> LV Name                /dev/vg1/lv1
> VG Name                vg1
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 0
> LV Size                36.42 GB
> Current LE             9324
> Allocated LE           9324
> Allocation             next free
> Read ahead sectors     120
> Block device           58:0
> read_ahead: 120
>=20
> pvdata -- logical volume struct at offset   1 is empty
> pvdata -- logical volume struct at offset   2 is empty
> pvdata -- logical volume struct at offset   3 is empty
> pvdata -- logical volume struct at offset   4 is empty
> -- stuff deleted --
> pvdata -- logical volume struct at offset 160 is empty
> pvdata -- logical volume struct at offset 161 is inconsistent
> pvdata -- logical volume struct at offset 162 is inconsistent
> pvdata -- logical volume struct at offset 163 is empty
> -- stuff deleted --
> pvdata -- logical volume struct at offset 253 is empty
> pvdata -- logical volume struct at offset 254 is empty
>=20
> dent:/etc/lvmconf >sudo pvdata -UPV /dev/md0
> --- Physical volume ---
> PV Name               /dev/md0
> VG Name               vg1
> PV Size               37.29 GB / NOT usable 5.62 MB [LVM: 161.00 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              9545
> Free PE               221
> Allocated PE          9324
> PV UUID               6qOL59-G611-Groj-PMBU-y4lg-ZtdX-IhaOuQ
>=20
> --- Volume group ---
> VG Name             =20
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                255
> Cur LV                1
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                255
> Cur PV                1
> Act PV                1
> VG Size               37.29 GB
> PE Size               4.00 MB
> Total PE              9545
> Alloc PE / Size       9324 / 36.42 GB
> Free  PE / Size       221 / 884.00 MB
> VG UUID               gK6O7c-YSy6-SHqF-6oiZ-L47x-PLqR-JsJzDq
> --- List of physical volume UUIDs ---
>=20
> 001: 6qOL59-G611-Groj-PMBU-y4lg-ZtdX-IhaOuQ
>=20
>=20
> dent:~ >sudo vgcfgrestore -v -n vg1 -t  /dev/md0
> vgcfgrestore -- locking logical volume manager
> vgcfgrestore -- restoring volume group "vg1" from "/etc/lvmconf/vg1.con=
f"
> vgcfgrestore -- checking existence of "/etc/lvmconf/vg1.conf"
> vgcfgrestore -- reading volume group data for "vg1" from=20
> "/etc/lvmconf/vg1.conf"
> vgcfgrestore -- reading physical volume data for "vg1" from=20
> "/etc/lvmconf/vg1.conf"
> vgcfgrestore -- reading logical volume data for "vg1" from=20
> "/etc/lvmconf/vg1.conf"
> vgcfgrestore -- checking volume group consistency of "vg1"
> vgcfgrestore -- checking volume group consistency of "vg1"
> vgcfgrestore -- backup of volume group "vg1"  is consistent
> vgcfgrestore -- test run for volume group "vg1" end
>=20
> vgcfgrestore -- unlocking logical volume manager
>=20
> dent:~ >sudo vgcfgrestore -v -n vg1  /dev/md0
> vgcfgrestore -- can't restore part of active volume group "vg1"
> vgcfgrestore [-d|--debug] [-f|--file VGConfPath] [-l[l]|--list [--list]=
]
>     [-n|--name VolumeGroupName] [-h|--help]
>     [-o|--oldpath OldPhysicalVolumePath] [-t|--test] [-v|--verbose]
>     [--version] [PhysicalVolumePath]
>=20
>=20
>=20
> Regards            Martin
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
