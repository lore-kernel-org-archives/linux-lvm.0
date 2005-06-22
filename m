Date: Wed, 22 Jun 2005 09:15:22 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] PV segments corrupted in vg1 : LVM corrupted
Message-ID: <20050622141522.GD22056@null.msp.redhat.com>
References: <3cd4d99305062204374db9549@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2qXFWqzzG3v1+95a"
Content-Disposition: inline
In-Reply-To: <3cd4d99305062204374db9549@mail.gmail.com>
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
To: Jeff Ewing <jeffiewing@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>


--2qXFWqzzG3v1+95a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2005 at 09:37:13PM +1000, Jeff Ewing wrote:
> After removing some logical volumes (backup,etc) and extending home
> logical volume, data in the whole volume group (vg1) has become
> corrupted: Root logical volume is mounted at boot time, but am unable
> to mount any other logical volumes in that volume group (var,home etc)
> after reboot.
>=20
> pvscan displays :  PV segment VG free_count mismatch: 0 !=3D 4294966485
>   Internal error: PV segments corrupted in vg1.
>   No matching physical volumes found
>=20
> vgdisplay, vgchange,vgscan display similiar message.
>=20
> Using 2 IDE drives, with 2 meta disks on each (mirrored across the drives=
).
> 1 meta disk contains boot
> 1 meta disk contains  LVM - 1 volume group, logical volumes for
> root,swap,var,usr,home
>=20
> vgcfgrestore fails.
>=20
> /etc/lvm/backup/vg1 contains (english) description of last known state of=
 the=20
> logical volumes. =20
> /etc/lvmconf/vg1.conf  is a binary file (may be out of date)
> /etc/lvmtab.d/vg1 appears to be the same binary file above (may be out of=
 date)
>=20
> System is Debian Unstable, running lvm2,udev,device mapper, kernel
> 2.6.8 compiled from Debian source. System appeared stable for 1 week
> after lvm changes, but failed on reboot.

Was your VG made with LVM1?  There has been a report similar to this one on
the list about LVM1 formatted VGs not working with the latest version of lv=
m2
=20
> 1. What command can be used to recreate the vg1.conf binary file from
> the english description backup? (vg1.conf modification date is older
> than changes)

This is an lvm1 file - all lvm2 files are in /etc/lvm/
=20
> 2. What is the VG free count and how can it be reset to 0?
>=20
> 3. What other tools available to fix broken lvm.

You could try going back to an older version of the lvm2 tools and see if it
fixes things.

--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
One Main Street SE, Suite 209
Minneapolis, MN 55414
  =20
Current GPG fingerprint =3D D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8=
715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...


--2qXFWqzzG3v1+95a
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCuXJ59QxUqFeMhxURAqzPAJ465nYKtlQumvhLY6AOLTiE4a5/hQCgjuIy
y+0sMtZmM3XYHmtPeI0VgRg=
=SLVC
-----END PGP SIGNATURE-----

--2qXFWqzzG3v1+95a--
