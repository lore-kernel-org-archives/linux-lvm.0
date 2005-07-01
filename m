Date: Fri, 1 Jul 2005 09:12:35 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] live lock?
Message-ID: <20050701141235.GH21889@null.msp.redhat.com>
References: <1120167747.5505.37.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HuscSE0D68UGttcd"
Content-Disposition: inline
In-Reply-To: <1120167747.5505.37.camel@localhost.localdomain>
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
To: mingz@ele.uri.edu, LVM general discussion and development <linux-lvm@redhat.com>


--HuscSE0D68UGttcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 30, 2005 at 05:42:27PM -0400, Ming Zhang wrote:
> i now met a PV that can not add or remove from a VG. i now do not know
> if it belongs to vg1 at all.
>=20
>=20
> [root@gs_lan root]# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/sda3" of VG "vg1" [102.64 GB / 60.28 GB
> free]
> pvscan -- inactive PV "/dev/sdb1" of VG "vg1" [137.78 GB / 129.97 GB
> free]
> pvscan -- total: 2 [240.44 GB] / in use: 2 [240.44 GB] / in no VG: 0 [0]
>=20
> [root@gs_lan root]# vgreduce vg1 /dev/sdb1
> vgreduce -- physical volume "/dev/sdb1" doesn't belong to volume group
> "vg1"
>=20
> [root@gs_lan root]# vgcreate vg2 /dev/sdb1
> vgcreate -- "/dev/sdb1" is not a new physical volume
> vgcreate -- physical volume "/dev/sdb1" already belongs to volume group
> "vg1"

Looks like you managed to get two VGs with the name vg1 on your system.  do=
 a
vgrename and see if you can access the inactive one.  ('vgrename vg1 vg2')

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


--HuscSE0D68UGttcd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCxU9T9QxUqFeMhxURAi7uAKCRJdyfnWP4m7Jlx0xQamIJGQXgmwCgt4Lo
h48xX2briZbS1VrnFIBb8WQ=
=Yl/m
-----END PGP SIGNATURE-----

--HuscSE0D68UGttcd--
