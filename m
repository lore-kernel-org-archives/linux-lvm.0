From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] HELP! 'can't get data of volume group "vg01" from physical volume(s)'
Message-ID: <20030626112150.A26711@sistina.com>
References: <20030626075653.GI16347@jensbenecke.de>
Mime-Version: 1.0
In-Reply-To: <20030626075653.GI16347@jensbenecke.de>; from lvm@jensbenecke.de on Thu, Jun 26, 2003 at 09:56:53AM +0200
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
Date: Thu Jun 26 04:37:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Jens,

did you use "vgremove /dev/hdb" before you changed the partition table
to use hdb4 as a PV ? (the metadata backup seems to reflect you did).

Because the partition table is located at the end of sector 1 on hdb and
there seems to be a PV staructure at the beginning still (strange if you
used vgremove on hdb), this should help:

# to save the existing partition sector
dd if=3D/dev/hdb of=3Dhdb.s1 bs=3D512 count=3D1

# to overwrite the start of the PV structure
dd if=3D/dev/zero of=3D/dev/hdb bs=3D128 count=3D1

vgscan;vgchange -ay

Regards,
Heinz    -- The LVM Guy --


On Thu, Jun 26, 2003 at 09:56:53AM +0200, Jens Benecke wrote:
> Hi,
>=20
> I had two PVs, hdc (whole disk) and hda4 (partition), in VG vg01. This
> VG contains one LV called 'home'.
>=20
> I wanted to add a 120G disk, hdb,  so I did 'pvcreate /dev/hdb'. After
> some discusssion it was decided that we did not want to give the whole
> disk to LVM, so I partitioned the disk (thinking that the PV structures
> would be overwritten that way) and did 'pvcreate /dev/hdb4', the other
> three partitions being normal non-LVM partitions.
>=20
> Then we decided to change our file system to ReiserFS so I added hdb4 t=
o
> the vg01 group, created a LV "newhome" inside (spanning the hdb4
> partition), formatted this LV with REiserfs, and copied everything from
> the (still mounted) 'home' LV over.
>=20
> Then I rebooted.
>=20
> After the reboot LVM didn't recognize any VGs any more, told me my four
> PVs (!!) belonged to an unknown VG "vg01" and vgscan told me $SUBJECT.
>=20
> pvscan:
>=20
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/ide/host0/bus1/target0/lun0/part1"  is asso=
ciated to unknown VG "vg01" (run vgscan)
> pvscan -- inactive PV "/dev/ide/host0/bus0/target0/lun0/part4"  is asso=
ciated to unknown VG "vg01" (run vgscan)
> pvscan -- inactive PV "/dev/ide/host0/bus0/target1/lun0/disc"  is assoc=
iated to unknown VG "vg01" (run vgscan)
> pvscan -- inactive PV "/dev/ide/host0/bus0/target1/lun0/part4"  is asso=
ciated to unknown VG "vg01" (run vgscan)
>=20
> vgscan:
>=20
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data o=
f volume group "vg01" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volum=
e group
>=20
>=20
> "pvdata" on each of the partitions looks OK, there is vg01 as a volume
> group etc:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> (none):  root# pvdata /dev/ide/host0/bus1/target0/lun0/part1
> --- Physical volume ---
> PV Name               /dev/ide/host0/bus1/target0/lun0/part1
> VG Name               vg01
> PV Size               12.65 GB [26520417 secs] / NOT usable 1.42 MB [LV=
M: 242 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              3237
> Free PE               0
> Allocated PE          3237
> PV UUID               wO50uo-ApVO-0jmr-4RZC-Ggof-O4Ut-6txGOD
>=20
> --- Volume group ---
> VG Name
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                2
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                3
> Act PV                3
> VG Size               155.75 GB
> PE Size               4 MB
> Total PE              39871
> Alloc PE / Size       39871 / 155.75 GB
> Free  PE / Size       0 / 0
> VG UUID               ijDVbZ-OFN9-izvN-r2aY-nzaA-SzPl-ra9bHg
>=20
> --- List of logical volumes ---
>=20
> pvdata -- logical volume "/dev/vg01/home" at offset   0
> pvdata -- logical volume "/dev/vg01/newhome" at offset   1
> pvdata -- logical volume struct at offset   2 is empty
> (...)
> pvdata -- logical volume struct at offset 254 is empty
> pvdata -- logical volume struct at offset 255 is empty
> --- List of physical volume UUIDs ---
>=20
> 001: wO50uo-ApVO-0jmr-4RZC-Ggof-O4Ut-6txGOD
> 002: glxYRM-F0DD-ByTO-sFPi-wFNd-ju9V-yW7ieU
> 003: 1yC41U-Jmxg-0NmS-dqKT-Wznu-yYwx-0t92sD
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> (none):  root# pvdata /dev/ide/host0/bus0/target0/lun0/part4
> --- Physical volume ---
> PV Name               /dev/ide/host0/bus0/target0/lun0/part4
> VG Name               vg01
> PV Size               36.19 GB [75890304 secs] / NOT usable 3.81 MB [LV=
M: 266 KB]
> PV#                   2
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              9263
> Free PE               0
> Allocated PE          9263
> PV UUID               glxYRM-F0DD-ByTO-sFPi-wFNd-ju9V-yW7ieU
>=20
> --- Volume group ---
> VG Name
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                2
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                3
> Act PV                3
> VG Size               155.75 GB
> PE Size               4 MB
> Total PE              39871
> Alloc PE / Size       39871 / 155.75 GB
> Free  PE / Size       0 / 0
> VG UUID               ijDVbZ-OFN9-izvN-r2aY-nzaA-SzPl-ra9bHg
>=20
> --- List of logical volumes ---
>=20
> pvdata -- logical volume "/dev/vg01/home" at offset   0
> pvdata -- logical volume "/dev/vg01/newhome" at offset   1
> pvdata -- logical volume struct at offset   2 is empty
> (...)
> pvdata -- logical volume struct at offset 254 is empty
> pvdata -- logical volume struct at offset 255 is empty
> --- List of physical volume UUIDs ---
>=20
> 001: wO50uo-ApVO-0jmr-4RZC-Ggof-O4Ut-6txGOD
> 002: glxYRM-F0DD-ByTO-sFPi-wFNd-ju9V-yW7ieU
> 003: 1yC41U-Jmxg-0NmS-dqKT-Wznu-yYwx-0t92sD
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>=20
> The current backup of the metadata looks OK as well:
>=20
> (none):  root# vgcfgrestore -ll -n vg01
> vgcfgrestore -- INFO: using backup file "/etc/lvmconf/vg01.conf"
> --- Volume group ---
> VG Name               vg01
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                2
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                3
> Act PV                3
> VG Size               155.75 GB
> PE Size               4 MB
> Total PE              39871
> Alloc PE / Size       39871 / 155.75 GB
> Free  PE / Size       0 / 0
> VG UUID               ijDVbZ-OFN9-izvN-r2aY-nzaA-SzPl-ra9bHg
>=20
> --- Logical volume ---
> LV Name                /dev/vg01/home
> VG Name                vg01
> LV Write Access        read/write
> LV Status              NOT available
> LV #                   1
> # open                 0
> LV Size                48.83 GB
> Current LE             12500
> Allocated LE           12500
> Allocation             next free
> Read ahead sectors     128
> Block device           58:0
>=20
> --- Logical volume ---
> LV Name                /dev/vg01/newhome
> VG Name                vg01
> LV Write Access        read/write
> LV Status              NOT available
> LV #                   2
> # open                 0
> LV Size                106.92 GB
> Current LE             27371
> Allocated LE           27371
> Allocation             next free
> Read ahead sectors     120
> Block device           58:1
>=20
>=20
> --- Physical volume ---
> PV Name               /dev/ide/host0/bus1/target0/lun0/part1
> VG Name               vg01
> PV Size               12.65 GB [26520417 secs] / NOT usable 1.42 MB [LV=
M: 242 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              3237
> Free PE               0
> Allocated PE          3237
> PV UUID               wO50uo-ApVO-0jmr-4RZC-Ggof-O4Ut-6txGOD
>=20
> --- Physical volume ---
> PV Name               /dev/ide/host0/bus0/target0/lun0/part4
> VG Name               vg01
> PV Size               36.19 GB [75890304 secs] / NOT usable 3.81 MB [LV=
M: 266 KB]
> PV#                   2
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              9263
> Free PE               0
> Allocated PE          9263
> PV UUID               glxYRM-F0DD-ByTO-sFPi-wFNd-ju9V-yW7ieU
>=20
> --- Physical volume ---
> PV Name               /dev/ide/host0/bus0/target1/lun0/part4
> VG Name               vg01
> PV Size               106.92 GB [224235270 secs] / NOT usable 4.35 MB [=
LVM: 338 KB]
> PV#                   3
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              27371
> Free PE               0
> Allocated PE          27371
> PV UUID               1yC41U-Jmxg-0NmS-dqKT-Wznu-yYwx-0t92sD
>=20
>=20
>=20
> I want to get at my data. No matter what. At the moment I have twenty
> scientists banging at my door because they need to be able to continue =
their
> research.=20
>=20
> I actually have their data on the disks twice ... once in the 'home' an=
d once
> in the 'newhome' LV. So I need a way to persuade LVM that hdb (the 'dis=
c' PV
> above) is no longer to be managed by lvm, _without_ destroying its part=
ition
> table (because hdb4 _is_ needed).
>=20
> Or, to make LVM recognize 'half' a VG (which contains a complete LV tho=
ugh) so
> I can get at the 'home' LV or the 'newhome' LV.
>=20
>=20
>=20
> Do you have any ideas?
>=20
>=20
>=20
>=20
> --=20
>=20
> mfg, Jens Benecke=09
>  =20
> QOTD: The Internet is not a network of machines. It's a network of PEOP=
LE.
>       That's where its real power comes from.
>  =20
> http://www.rb-hosting.de - Webhosting mit Extras
> Werbefreies Hosting ab =A47 - SSH-Zugang ab =A419 - G=FCnstiger Traffic
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
