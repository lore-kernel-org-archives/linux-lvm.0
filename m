Date: Thu, 28 Jul 2005 11:45:23 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] how to access the partition on LV?
Message-ID: <20050728164523.GF4954@null.msp.redhat.com>
References: <1122563861.9888.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zGX6P/PxmcOG18lb"
Content-Disposition: inline
In-Reply-To: <1122563861.9888.1.camel@localhost.localdomain>
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


--zGX6P/PxmcOG18lb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2005 at 11:17:41AM -0400, Ming Zhang wrote:
> I think this is a very common question but i can not find the answer.
> any idea on how to access the partition on these lv since no device
> node?
>=20
>=20
> [root@fc3-i386-2 ~]# fdisk /dev/vg1/v1 -l
>=20
> Disk /dev/vg1/v1: 469 MB, 469762048 bytes
> 255 heads, 63 sectors/track, 57 cylinders
> Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
>=20
>        Device Boot      Start         End      Blocks   Id  System
> /dev/vg1/v1p1               1          13      104391   83  Linux
> /dev/vg1/v1p2              14          57      353430   83  Linux

You don't.  Don't put partition tables on LVs.  The whole point of using LVM
is you don't need to partition anymore, and your block devices can be dynam=
ic.
If you another block devices, you lvcreate it.  If you don't have enough sp=
ace
in your VG, you add a PV to it, then lvcreate the new block device.  Have y=
ou
read through the HOWTO referenced below?

--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat                                    E-Mail: alewis@redhat.com
One Main Street SE, Suite 209
Minneapolis, MN 55414
  =20
Current GPG fingerprint =3D D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8=
715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...


--zGX6P/PxmcOG18lb
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC6Quj9QxUqFeMhxURAihOAJ9w9FvW8l0KamnppJA+oTT3c1sdlQCgqDE1
ErYOCBayv+lC+YKesUXEToM=
=AacO
-----END PGP SIGNATURE-----

--zGX6P/PxmcOG18lb--
