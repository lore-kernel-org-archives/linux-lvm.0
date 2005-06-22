Received: from null.msp.redhat.com (null.msp.redhat.com [10.15.80.136])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j5MEx0i9026412
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 10:59:00 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.13.4/8.12.11) with ESMTP id j5MEwxGF008696
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 09:58:59 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.13.4/8.13.4/Submit) id j5MEwxtE008695
	for linux-lvm@redhat.com; Wed, 22 Jun 2005 09:58:59 -0500
Date: Wed, 22 Jun 2005 09:58:59 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] lvm2 2.01.12 fails to read lvm1 metadata
Message-ID: <20050622145859.GE22056@null.msp.redhat.com>
References: <20050622074627.GA1892@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5L6AZ1aJH5mDrqCQ"
Content-Disposition: inline
In-Reply-To: <20050622074627.GA1892@wavehammer.waldi.eu.org>
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
To: linux-lvm@redhat.com


--5L6AZ1aJH5mDrqCQ
Content-Type: multipart/mixed; boundary="5CUMAwwhRxlRszMD"
Content-Disposition: inline


--5CUMAwwhRxlRszMD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2005 at 09:46:27AM +0200, Bastian Blank wrote:
> I got three reports that lvm 2.01.12 can't read lvm1 metadata.
>=20
> Bastian

Hey Bastian - I'm seeing this too.  The attached patch lets me scan and
activate format1 volumes.  This has not been tested extensively, so it may =
not
be the correct fix, but it's something to get people going again.  See if it
fixes things for you - or the people you're getting reports from.

Again - this is an experimental patch - please treat it with caution.

Regards,
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


--5CUMAwwhRxlRszMD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="fix_format1.patch"
Content-Transfer-Encoding: quoted-printable

? cscope.out
Index: import-export.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /cvs/lvm2/LVM2/lib/format1/import-export.c,v
retrieving revision 1.76
diff -u -p -r1.76 import-export.c
--- import-export.c	14 Jun 2005 17:54:47 -0000	1.76
+++ import-export.c	22 Jun 2005 14:53:36 -0000
@@ -241,7 +241,8 @@ int import_vg(struct pool *mem,
=20
 	vg->extent_size =3D vgd->pe_size;
 	vg->extent_count =3D vgd->pe_total;
-	vg->free_count =3D vgd->pe_total - vgd->pe_allocated;
+	/* The free count is adjusted in pv_manip.c at assign_peg_to_lvseg */
+	vg->free_count =3D vgd->pe_total;
 	vg->max_lv =3D vgd->lv_max;
 	vg->max_pv =3D vgd->pv_max;
 	vg->alloc =3D ALLOC_NORMAL;

--5CUMAwwhRxlRszMD--

--5L6AZ1aJH5mDrqCQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCuXyz9QxUqFeMhxURAltGAJ0SCC9MxkEdsA/9/wGtXsXJ8eoTowCgz1OI
KIiT4uGqm8BIcPfZTx8wllY=
=zfts
-----END PGP SIGNATURE-----

--5L6AZ1aJH5mDrqCQ--
