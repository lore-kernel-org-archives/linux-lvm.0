Received: from null.msp.redhat.com (null.msp.redhat.com [10.15.80.136])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j6SGfXaA018045
	for <linux-lvm@redhat.com>; Thu, 28 Jul 2005 12:41:33 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.13.4/8.12.11) with ESMTP id j6SGfXAN002926
	for <linux-lvm@redhat.com>; Thu, 28 Jul 2005 11:41:33 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.13.4/8.13.4/Submit) id j6SGfXZL002925
	for linux-lvm@redhat.com; Thu, 28 Jul 2005 11:41:33 -0500
Date: Thu, 28 Jul 2005 11:41:33 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] How to recover data corrupted by vgcreate
Message-ID: <20050728164133.GE4954@null.msp.redhat.com>
References: <008001c59203$1553fc70$7e01a8c0@asuspc>
	<ef523605066ee0d0a6b20345a70677dd@redhat.com>
	<20050727172443.GC4954@null.msp.redhat.com>
	<d80ca5b9b93015efc1c96978ccd99874@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dx1O6sYEs5STvSrm"
Content-Disposition: inline
In-Reply-To: <d80ca5b9b93015efc1c96978ccd99874@redhat.com>
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


--Dx1O6sYEs5STvSrm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2005 at 10:00:02AM -0500, Jonathan E Brassow wrote:
>=20
> On Jul 27, 2005, at 12:24 PM, AJ Lewis wrote:
>=20
> >On Wed, Jul 27, 2005 at 11:33:05AM -0500, Jonathan E Brassow wrote:
> >>I'm not familiar exactly with how the metadata gets laid on disk, but
> >>I would think you could just 'vgcreate vg_name /dev/hdd2' (you did=20
> >>this
> >>already) then 'lvcreate -n <lvname> -l <max size> vg_name'...  This of
> >>course assumes that the previous lv resided wholly on /dev/hdd2.  Then
> >>try mounting the new lv and see what happens.
> >
> >Before you do that, try vgcfgrestore.
> >
>=20
> AJ, when he did the initial 'vgcreate' was part of the process to=20
> create a backup copy of the metadata?  If so, vgcfgrestore could work. =
=20
> But otherwise, I'm not sure were the old metadata would be stored,=20
> since this disk is from a different machine...  Seems odd to me that=20
> vgcreate would blow over the old vg if it knew about it.  If it did not=
=20
> know (or detect the old vg), how would it know to backup the metadata?

Not sure, but if the reason the disk was moved was because a cpu went out, =
i'm
assuming the old root fs is also on that disk - hoping so anyway ;)  If so,
the old root fs can be mounted and /etc/lvm/archive can be checked for a va=
lid
copy of the metadata.  (Assuming root wasn't on lvm...)

As to why vgcreate didn't recognize the old VG...that's very odd - not sure
what went wrong there...

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


--Dx1O6sYEs5STvSrm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC6Qq99QxUqFeMhxURAu5WAJ9ZDRewNngymO3Lie5L7x20avIsJwCgrXf2
Sa9/SxJVdgw97taOpIVGRNE=
=yCi1
-----END PGP SIGNATURE-----

--Dx1O6sYEs5STvSrm--
