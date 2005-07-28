Date: Thu, 28 Jul 2005 12:32:18 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] how to access the partition on LV?
Message-ID: <20050728173218.GH4954@null.msp.redhat.com>
References: <1122563861.9888.1.camel@localhost.localdomain>
	<20050728164523.GF4954@null.msp.redhat.com>
	<1122570830.9888.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GXtmylMy6DdaH5oR"
Content-Disposition: inline
In-Reply-To: <1122570830.9888.10.camel@localhost.localdomain>
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
To: Ming Zhang <mingz@ele.uri.edu>
Cc: LVM general discussion and development <linux-lvm@redhat.com>


--GXtmylMy6DdaH5oR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2005 at 01:13:50PM -0400, Ming Zhang wrote:
> On Thu, 2005-07-28 at 11:45 -0500, AJ Lewis wrote:
> > On Thu, Jul 28, 2005 at 11:17:41AM -0400, Ming Zhang wrote:
> > > I think this is a very common question but i can not find the answer.
> > > any idea on how to access the partition on these lv since no device
> > > node?
> > >=20
> > >=20
> > > [root@fc3-i386-2 ~]# fdisk /dev/vg1/v1 -l
> > >=20
> > > Disk /dev/vg1/v1: 469 MB, 469762048 bytes
> > > 255 heads, 63 sectors/track, 57 cylinders
> > > Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
> > >=20
> > >        Device Boot      Start         End      Blocks   Id  System
> > > /dev/vg1/v1p1               1          13      104391   83  Linux
> > > /dev/vg1/v1p2              14          57      353430   83  Linux
> >=20
>=20
> the problem is that we export a LV via iscsi to a remote box and become
> a scsi disk. so it is partitioned and utilized. then it does have
> partition on it. even it is exported to a linux box, u possibly will
> use /dev/sdx1 instead of directly use /dev/sdx, rite?

Ahh - I see.  Well, on the node exporting the LVs, you don't access it.  I
dunno if kpartx or some other partitioning tool could do it - it might.  But
as far as the standard partion handling code goes, LVs don't exist.  I know
why you're doing it this way - I don't know why you want to access the
partitions on the exporting (target) node.  Do you really need to?
=20
> > You don't.  Don't put partition tables on LVs.  The whole point of using
> > LVM is you don't need to partition anymore, and your block devices can =
be
> > dynamic.  If you another block devices, you lvcreate it.  If you don't
> > have enough space in your VG, you add a PV to it, then lvcreate the new
> > block device.  Have you read through the HOWTO referenced below?
>=20
> i can not see this HOWTO, where u referenced it?

It's at the bottom of all messages that go to the linux-lvm ML -
http://tldp.org/HOWTO/LVM-HOWTO/=20
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


--GXtmylMy6DdaH5oR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC6Rai9QxUqFeMhxURAoIPAJ9m1QDXsF4nVzMsuDaMbgoY61zhfgCeLbFk
3Yloqyhtl+WFkyMXXruoW/I=
=ZhTL
-----END PGP SIGNATURE-----

--GXtmylMy6DdaH5oR--
