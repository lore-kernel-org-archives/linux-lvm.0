Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1RKLFgR012529
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2009 15:21:15 -0500
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1RKJjNU019335
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2009 15:19:45 -0500
Received: from linux.interlinx.bc.ca (d193-213-184.home3.cgocable.net
	[67.193.213.184])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id E54462803
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2009 15:19:46 -0500 (EST)
Received: from [IPv6:2001:4978:161:0:218:f3ff:fee1:65cc] (pc.interlinx.bc.ca
	[IPv6:2001:4978:161:0:218:f3ff:fee1:65cc])
	by linux.interlinx.bc.ca (Postfix) with ESMTP id B5AE3802C
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2009 15:19:53 -0500 (EST)
Subject: Re: [linux-lvm] vgchange doesn't enable found VGs
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <20090227200000.GF6714@agk.fab.redhat.com>
References: <1235748997.1193.15.camel@pc.interlinx.bc.ca>
	<49A814EA.3090902@redhat.com>
	<1235752705.1193.32.camel@pc.interlinx.bc.ca>
	<49A81CA2.7080907@redhat.com>
	<1235755830.1193.40.camel@pc.interlinx.bc.ca>
	<20090227200000.GF6714@agk.fab.redhat.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-fdgy+95sIzpIrt/cscTB"
Date: Fri, 27 Feb 2009 15:19:45 -0500
Message-Id: <1235765985.1193.49.camel@pc.interlinx.bc.ca>
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


--=-fdgy+95sIzpIrt/cscTB
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2009-02-27 at 20:00 +0000, Alasdair G Kergon wrote:
> On Fri, Feb 27, 2009 at 12:30:30PM -0500, Brian J. Murrell wrote:
> >     cache_dir =3D "/etc/lvm/cache"
>=20
> The cache_dir must be *writeable*.

And persistent or just writable?

Interestingly enough, RHEL5.2's /etc/rwtab (the files and directories
that need to be made "magically" writable -- through bind mounting to
either persistent storage or tmpfs) has:

files   /etc/lvm/.cache

That's starting to look like a type methinks.

> If you're attempting to use read-only root, then move it somewhere else
> (is /var writeable? or make a ramfs) or delete that directory *and*
> change

Ahhh.  "a ramfs".  So persistence is not a requirement it seems.

b.


--=-fdgy+95sIzpIrt/cscTB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmoSt8ACgkQl3EQlGLyuXCJ+ACfc61pgGhWKPcPQBfGNkmHICYs
sn8AoKZfSvgVCSS5wNfVRbPjzTf/bdnA
=pUaa
-----END PGP SIGNATURE-----

--=-fdgy+95sIzpIrt/cscTB--
