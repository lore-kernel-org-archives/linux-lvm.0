Return-Path: <root@srv.sistina.com>
Date: Mon, 19 Mar 2001 13:14:56 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Recovering PV's VG metadata
Message-ID: <20010319131456.C26986@sistina.com>
References: <3AB49365.2020606@inetnow.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3AB49365.2020606@inetnow.net>; from hne@inetnow.net on Sun, Mar 18, 2001 at 07:52:21PM +0900
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
Content-Type: text/plain; charset="iso-2022-jp"
To: linux-lvm@sistina.com

I understand:

 - you are not booting from hda or hdc

 - hdc still holds a valid LVM VGDA

 - likely the first sector of hda got blown away (by lilo)

 - you don't have any /etc/lvmconf/ VGDA backup files on disk/tape
   (if not so use vgcfgrestore(8) in order to restore metadata to /dev/hda!)


I'm assuming based on the data below:

 - your 2 physical volumes are equal in size

 - you had just 1 logical volume spread over both physical volumes using
   all of the VG's capacity

 - all of your VGDA with the exception of the physical volume structure,
   which was sitting at the very beginning of hda is still there and
   likely valid


*If* the above assumptions are correct, your option is to copy the first
sector of /dev/hdc over to /dev/hda with
"dd if=3D/dev/hdc bs=3D512 count=3D1 of=3D/dev/hda" *and* change it with a =
hex editor.

In order to find the correct offsets into the first sector on /dev/hda to
change, look at lvm.h (of LVM 0.8final!) and the definition of pv_disk_t in
that header file.

At least you need to change the physical number (pv_number); set it to 1.

In case the above assumptions are not correct for eg. the sizes of the PVs
differ, you need to change pv_size, pe_total and pe_allocated as well.

Please get back to me if this is the case.


BTW: we are working on the enhancement of our LVM checker in order
     to support such repairs. Not very helpfull for you nor, I know :(

Don't forget to check your /etc/lilo.conf to make sure, that lilo doesn't
tamper with the first sector on /dev/hda again!

--=20

Regards,
Heinz    -- The LVM Guy --


On Sun, Mar 18, 2001 at 07:52:21PM +0900, HopNet wrote:
> Hello all.  I would appreciate any help or pointers to recovering the VG
> data on a "blown" PV.
>=20
> My setup:
>   Logical Volume Manager 0.8 by Heinz Mauelshagen  04/11/1999  (IOP 6)
>   x86/OS SuSE 6.4 on system disk (scsi, non-LVM)
>   data on VG00 on hda & hdc (whole disk, no partitions)
>   only one LVol exists, and takes up whole VG.
>   hda & hdc are identical models of hard drives.
>   VG01 in examples is a NEW VG on scsi array and can be ignored.
>=20
> Problem:
>   OS disk got trashed & system wasn't bootable.
>   Reinstalled OS.  I think at this point, LILO, thinking hda was the
> boot drive, overwrote some of the VG data.
>   no LVMtab or conf files to vgcfgrestore from. :-(
>=20
> Now:
>   pvdata sees partial data on hda, and everything on hdc
>=20
> What I'm looking for:
>   Is there anyway to take common data from hdc and write it back to
> hda.  What tools are available for sector editing (LVM or general)?
>=20
> zeus:~ # pvdata -a /dev/hda
> --- Physical volume ---
> PV Name
> VG Name
> =1B$B&5=1B(BR
> PV Size               12.14 GB / NOT usable 3.21 MB [LVM: 16.09 MB]
> PV#                   0
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              3106
> Free PE               0
> Allocated PE          3106
>=20
> Segmentation fault
> zeus:~ # pvdata -N -P /dev/hdc
> --- Physical volume ---
> PV Name               /dev/hdc
> VG Name               vg00
> PV Size               12.14 GB / NOT usable 3.24 MB [LVM: 242 KB]
> PV#                   2
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              3106
> Free PE               0
> Allocated PE          3106
>=20
> --- List of physical volumes ---
>=20
> 000: /dev/hda
> 001: /dev/hdc
>=20
> zeus:~ # pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/sdb1" of VG "vg01" [21.26 GB / 11.26 GB
> free]
> pvscan -- inactive PV "/dev/hdc"  is associated to an unknown VG (run
> vgscan)
> pvscan -- total: 2 [33.4 GB] / in use: 2 [33.4 GB] / in no VG: 0 [0]
>=20
> zeus:~ #
>=20
>   If there is any other info that might be helpful, please ask.
>=20
> Thanks again,
>   Keith@HopNet
>=20
>=20
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm


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
