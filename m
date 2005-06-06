Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j56L6AO21511
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2005 17:06:10 -0400
Received: from dcs.nac.uci.edu (dcs.nac.uci.edu [128.200.34.32])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j56L6430025615
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2005 17:06:05 -0400
Subject: Re: [linux-lvm] grub and lvm
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <1118076618.4482.7.camel@rich>
References: <1118074394.4482.2.camel@rich>  <42A47B70.4060000@berbee.com>
	<1118076618.4482.7.camel@rich>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-YjH8tK2EGNiuNvUQ0E2m"
Date: Mon, 06 Jun 2005 14:06:00 -0700
Message-Id: <1118091960.3998.62.camel@seki.nac.uci.edu>
Mime-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-YjH8tK2EGNiuNvUQ0E2m
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Just a guess, but maybe what you're seeing is grub's inability to read
LVM partitions?

ISTR that grub has built-in knowledge of common linux filesystems, which
is why you don't have to rerun grub like you do with lilo - because ISTR
that lilo is saving a list of blocks to read somewhere for boot time, so
that it won't need filesystem knowledge.

But I wouldn't be surprised a bit of an ext3 over LVM2 isn't represented
on-disk differently from just ext3, which might mean that grub would
need LVM2 knowledge.

Just a totally-wild-guess.  HTH.

On Mon, 2005-06-06 at 09:50 -0700, rich turner wrote:
> using a partition works fine. but i am trying to understand why i can't
> write my grub bootloader to a disk that is being used as a physical
> volume. is grub and lvm using the same part of the disk for its own use?
>=20
>=20
> On Mon, 2005-06-06 at 11:36 -0500, Alan Jurgensen wrote:
> > You may want to create a Linux LVM partition, and using that in lvm=20
> > (pvcreate /dev/hdb1)...
> >=20
> >=20
> > rich turner wrote:
> >=20
> > >i have a volume group built on a physical volume that is the
> > >disk /dev/hdb. when i write the grub bootloader to that disk, it appea=
rs
> > >that the bootloader overwrites part or all of the lvm data on that dis=
k,
> > >essentially wiping out my volume group. does anyone know if that is
> > >normal or if lvm and grub indeed share the same place on the disk?
> > >
> > >_______________________________________________
> > >linux-lvm mailing list
> > >linux-lvm@redhat.com
> > >https://www.redhat.com/mailman/listinfo/linux-lvm
> > >read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > > =20
> > >
> >=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20

--=-YjH8tK2EGNiuNvUQ0E2m
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBCpLq4o0feVm00f/8RAiBmAKCWwsdveig9XlIFlo/72HKWCCCHiQCglg03
MKvrUXbaH3LbW40I8qvzTKI=
=bDUv
-----END PGP SIGNATURE-----

--=-YjH8tK2EGNiuNvUQ0E2m--
