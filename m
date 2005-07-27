Received: from null.msp.redhat.com (null.msp.redhat.com [10.15.80.136])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j6RHOiaA025330
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2005 13:24:44 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.13.4/8.12.11) with ESMTP id j6RHOhfV015949
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2005 12:24:43 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.13.4/8.13.4/Submit) id j6RHOhXb015948
	for linux-lvm@redhat.com; Wed, 27 Jul 2005 12:24:43 -0500
Date: Wed, 27 Jul 2005 12:24:43 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] How to recover data corrupted by vgcreate
Message-ID: <20050727172443.GC4954@null.msp.redhat.com>
References: <008001c59203$1553fc70$7e01a8c0@asuspc>
	<ef523605066ee0d0a6b20345a70677dd@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0WzQiIesntPPsVaS"
Content-Disposition: inline
In-Reply-To: <ef523605066ee0d0a6b20345a70677dd@redhat.com>
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


--0WzQiIesntPPsVaS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2005 at 11:33:05AM -0500, Jonathan E Brassow wrote:
> I'm not familiar exactly with how the metadata gets laid on disk, but=20
> I would think you could just 'vgcreate vg_name /dev/hdd2' (you did this=
=20
> already) then 'lvcreate -n <lvname> -l <max size> vg_name'...  This of=20
> course assumes that the previous lv resided wholly on /dev/hdd2.  Then=20
> try mounting the new lv and see what happens.=20

Before you do that, try vgcfgrestore.
=20
> On Jul 26, 2005, at 11:57 AM, =E5=BC=B5=E5=BB=B7=E5=B7=9E wrote:=20
>=20
>=20
> > Hi,=20
> >  =20
> > I have a Linux PC with Fedora C3 installed.=20
> > The disk was partitioned automatically when Linux was installed.=20
> > So, LVM2 partition was created.=20
> > The CPU is damaged today and I move the disk to another Linux PC=20
> > and try to read data out.=20
> > The disk is connected to device /dev/hdd. /dev/hdd2 is the LVM2=20
> > partition.=20
> > But, I do a stupid thing. I invoke vgcreate command on /dev/hdd2.=20
> >  =20
> >     vgcreate vg_name /dev/hdd2=20
> >  =20
> > The partition seems to be lost.=20
> > How can I recover the data in /dev/hdd2?=20
> > It's very important data to me.=20
> > Thanks for any help.=20
> >  =20
> > Davis=20
> >  _______________________________________________=20
> > linux-lvm mailing list=20
> > linux-lvm@redhat.com=20
> > https://www.redhat.com/mailman/listinfo/linux-lvm=20
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
>=20

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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


--0WzQiIesntPPsVaS
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC58Nb9QxUqFeMhxURAle2AKDDw3B3vQMgt25WPj2rlpJOvmurNwCcDTE0
uuYdlhJpKoZ0rTnf4Esm6WM=
=3ZvH
-----END PGP SIGNATURE-----

--0WzQiIesntPPsVaS--
