Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7RGYGk6018432
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 12:34:16 -0400
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l7RGY93G008047
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 12:34:10 -0400
Received: from linux.interlinx.bc.ca (d38-139-100.home1.cgocable.net
	[72.38.139.100])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id 3D38B2803
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 12:34:09 -0400 (EDT)
Received: from [10.75.22.1] (pc.ilinx [10.75.22.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 7DC39EF6E3
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 12:34:07 -0400 (EDT)
Subject: Re: [linux-lvm] "cannot allocate memory" when trying to do a snapshot?
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <46D2FAFB.7010807@wpkg.org>
References: <46CEE6FF.1090000@wpkg.org> <46D2F715.9000308@wpkg.org>
	<1188231241.24432.1.camel@pc.ilinx>  <46D2FAFB.7010807@wpkg.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-lKtPPCcnoj9qtb4pv9/N"
Date: Mon, 27 Aug 2007 12:34:06 -0400
Message-Id: <1188232446.24432.3.camel@pc.ilinx>
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


--=-lKtPPCcnoj9qtb4pv9/N
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2007-08-27 at 18:25 +0200, Tomasz Chmielewski wrote:
>=20
> Looks like it's here:
>=20
> https://bugzilla.redhat.com/show_bug.cgi?id=3D208172

Yup.  That's the one my bug 191531 was dup'd to.

> Let's see if upgrading the kernel helps...

Let us know.

b.

--=20
My other computer is your Microsoft Windows server.

Brian J. Murrell

--=-lKtPPCcnoj9qtb4pv9/N
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBG0vz+l3EQlGLyuXARAke9AJ99pFVEPUL8DgcH1sYl2ieaxcML3gCeKBwX
HHM6qajpfJDzZjizP3DUmmw=
=xEzv
-----END PGP SIGNATURE-----

--=-lKtPPCcnoj9qtb4pv9/N--
