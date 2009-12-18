Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBI24b6S030423
	for <linux-lvm@redhat.com>; Thu, 17 Dec 2009 21:04:37 -0500
Received: from lo.gmane.org (lo.gmane.org [80.91.229.12])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBI24Llx030680
	for <linux-lvm@redhat.com>; Thu, 17 Dec 2009 21:04:22 -0500
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NLSCY-0000Et-Vd
	for linux-lvm@redhat.com; Fri, 18 Dec 2009 03:04:18 +0100
Received: from d67-193-197-208.home3.cgocable.net ([67.193.197.208])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 18 Dec 2009 03:04:18 +0100
Received: from brian by d67-193-197-208.home3.cgocable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 18 Dec 2009 03:04:18 +0100
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Thu, 17 Dec 2009 21:03:08 -0500
Message-ID: <1261101785.21162.712.camel@pc.interlinx.bc.ca>
References: <1261093282.21162.564.camel@pc.interlinx.bc.ca>
	<4B2AD174.40402@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-UJ1z3UmqPfBhf6QGNQQA"
In-Reply-To: <4B2AD174.40402@redhat.com>
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Re: brainfart: lilo'd a PV
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


--=-UJ1z3UmqPfBhf6QGNQQA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2009-12-17 at 19:48 -0500, Takahiro Yasui wrote:=20
>=20
> Yes. The area begin with "LABELONE" is PV label,

Looks like the LVM developers foresaw my brainfart and left the first
sector of the disk for me to bugger up without buggering up LVM.  :-)

> which is recorded in
> the first sector by default.

Hrm.  Do you really mean "first" there or second, which is sector 1 if
you start counting with 0?

> This is the description from the pvcreate
> man page.
>=20
>        --labelsector sector
>               By default the PV is labelled with an  LVM2  identifier  in=
  its
>               second  sector (sector 1).

Yes, this looks so.

>   This lets you use a different sector
>               near the start of the disk (between 0  and  3  inclusive  -=
  see
>               LABEL_SCAN_SECTORS in the source).  Use with care.

> You don't have any problem on the PV, do you?

I don't think I do:

# pvdisplay /dev/sda
  --- Physical volume ---
  PV Name               /dev/sda
  VG Name               datavol
  PV Size               931.51 GB / not usable 1.71 MB
  Allocatable           yes=20
  PE Size (KByte)       4096
  Total PE              238467
  Free PE               85356
  Allocated PE          153111
  PV UUID               C22uVB-4m26-5cvl-I11V-NXCm-mVNo-UTAXUH

But of course, I just want to get the opinion of the experts.

> I don't think you need something to repair the PV.

I don't think so either, but of course, do want to confirm my suspicion.

Thanx much for your insight.

b.


--=-UJ1z3UmqPfBhf6QGNQQA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAksq4tkACgkQl3EQlGLyuXB8RwCeMGLYW4MleynDT+oO+iOVy9/F
cWcAnR/A01oq1PWjrxCdO0PD/fqcAJ/M
=Nekt
-----END PGP SIGNATURE-----

--=-UJ1z3UmqPfBhf6QGNQQA--
