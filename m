Return-Path: <root@srv.sistina.com>
Date: Tue, 29 May 2001 21:11:28 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: Help! Upgrade 2.2.18 -> 2.4.4 killed a PV
Message-ID: <20010529211128.B27030@sistina.com>
References: <20010529010628.E1971@jensbenecke.de> <20010529093436.A792@jensbenecke.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010529093436.A792@jensbenecke.de>; from jens@jensbenecke.de on Tue, May 29, 2001 at 09:34:36AM +0200
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

Jens,
you need to run pvcreate on the invalid PV before running vgcfgrestore.

Regards,
Heinz    -- The LVM Guy --

On Tue, May 29, 2001 at 09:34:36AM +0200, Jens Benecke wrote:
> On Tue, May 29, 2001 at 01:06:28AM +0200, Jens Benecke wrote:
> > Hello,
> >=20
> > I upgraded to 2.2.4 (0.9.1-beta2) from 2.2.18 (LVM 0.9) and this seems =
to
> > have killed one of my PVs. I tried the 0.9 utilities and updated to
> > 0.9.1-beta7 when I noticed the problems. No change. Booting back to 2.2=
.18
> > didn't help, the PV was gone there as well.
>=20
> follow-up:
>=20
> vgcfgrestore doesn't work, because LVM thinks my hdc1 is no PV. Here's the
> output:
>=20
>=20
> vgcfgrestore -n data -ll:
> 	--- Volume group ---
> 	VG Name               data
> 	VG Access             read/write
> 	VG Status             NOT available/resizable
> 	VG #                  0
> 	MAX LV                256
> 	Cur LV                1
> 	Open LV               0
> 	MAX LV Size           255.99 GB
> 	Max PV                256
> 	Cur PV                2
> 	Act PV                2
> 	VG Size               95.44 GB
> 	PE Size               4 MB
> 	Total PE              24432
> 	Alloc PE / Size       24432 / 95.44 GB
> 	Free  PE / Size       0 / 0
> 	VG UUID               ec0e1J-hf9c-2DVg-VMGE-Qn1c-HPgl-z1jMGO
> =09
> 	--- Logical volume ---
> 	LV Name                /dev/data/archiv
> 	VG Name                data
> 	LV Write Access        read/write
> 	LV Status              NOT available
> 	LV #                   1
> 	# open                 0
> 	LV Size                95.44 GB
> 	Current LE             24432
> 	Allocated LE           24432
> 	Allocation             next free
> 	Read ahead sectors     120
> 	Block device           58:0
> =09
> =09
> 	--- Physical volume ---
> 	PV Name               /dev/hdc1
> 	VG Name               data
> 	PV Size               76.33 GB / NOT usable 3.96 MB [LVM: 197 KB]
> 	PV#                   1
> 	PV Status             NOT available
> 	Allocatable           yes (but full)
> 	Cur LV                1
> 	PE Size (KByte)       4096
> 	Total PE              19539
> 	Free PE               0
> 	Allocated PE          19539
> 	PV UUID               Re4KFN-ES3b-K2zz-EIer-iYKv-i7wX-lHTPGN
> =09
> 	--- Physical volume ---
> 	PV Name               /dev/hda1
> 	VG Name               data
> 	PV Size               19.12 GB / NOT usable 2.27 MB [LVM: 140 KB]
> 	PV#                   2
> 	PV Status             NOT available
> 	Allocatable           yes (but full)
> 	Cur LV                1
> 	PE Size (KByte)       4096
> 	Total PE              4893
> 	Free PE               0
> 	Allocated PE          4893
> 	PV UUID               qT529c-dwfb-utXE-1Ds4-18AV-0I6O-2cHdfR
>=20
>=20
> vgcfgrestore -v -n data /dev/hdc1:
> 	vgcfgrestore -- locking logical volume manager
> 	vgcfgrestore -- restoring volume group "data" from "/etc/lvmconf/data.co=
nf"
> 	vgcfgrestore -- checking existence of "/etc/lvmconf/data.conf"
> 	vgcfgrestore -- reading volume group data for "data" from "/etc/lvmconf/=
data.conf"
> 	vgcfgrestore -- reading physical volume data for "data" from "/etc/lvmco=
nf/data.conf"
> 	vgcfgrestore -- reading logical volume data for "data" from "/etc/lvmcon=
f/data.conf"
> 	vgcfgrestore -- checking volume group consistency of "data"
> 	vgcfgrestore -- checking volume group consistency of "data"
> 	vgcfgrestore -- reading physical volume "/dev/hdc1"
> 	vgcfgrestore -- ERROR "pv_read(): PV identifier invalid" reading physica=
l volume "/dev/hdc1"
>=20
>=20
> Thank you!
>=20
> --=20
> Jens Benecke             /* Nobody will ever see this error message :-) */
>                             panic("Cannot initialize video hardware\n");
>                                   -- Linux 2.0.38,  arch/m68k/atari/atafb=
.c
> http://www.hitchhikers.de/ - Die kostenlose Mitfahrzentrale f=EF=BF=BDr g=
anz Europa
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
