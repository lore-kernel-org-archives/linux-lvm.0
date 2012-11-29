Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qATCS2Qk009004
	for <linux-lvm@redhat.com>; Thu, 29 Nov 2012 07:28:02 -0500
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qATCS0Zm032225
	for <linux-lvm@redhat.com>; Thu, 29 Nov 2012 07:28:01 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1Te3Cq-0004ZS-If
	for linux-lvm@redhat.com; Thu, 29 Nov 2012 13:27:04 +0100
Received: from d67-193-214-242.home3.cgocable.net ([67.193.214.242])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 29 Nov 2012 13:27:04 +0100
Received: from brian by d67-193-214-242.home3.cgocable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 29 Nov 2012 13:27:04 +0100
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Thu, 29 Nov 2012 07:26:24 -0500
Message-ID: <k97k9f$6kf$1@ger.gmane.org>
References: <1045065586.477.16.camel@dev-ehopper.tiecommerce.com>
	<20030214172615.GA2438@fib011235813.fsnet.co.uk>
	<loom.20121128T142616-703@post.gmane.org>
	<50B6183E.9020404@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig3EB6FB29FA9854E84ECAC80C"
In-Reply-To: <50B6183E.9020404@redhat.com>
Subject: Re: [linux-lvm] How to handle Bad Block relocation with LVM?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig3EB6FB29FA9854E84ECAC80C
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 12-11-28 08:57 AM, Zdenek Kabelac wrote:
>=20
> Sorry, no automated tool.

Pity,

> You could possibly pvmove separated PEs manually with set of pvmove
> commands.

So, is the basic premise to just find the PE that is sitting on a bad
block and just pvmove it into an LV created just for the purpose of
holding PEs that are on bad blocks?

So what happens when I pvmove a PE out of an LV?  I take it LVM moves
the data (or at least tries in this case) on the PE being pvmoved onto
another PE before moving it?

Oh, but wait.  pvmove (typically) moves PEs between physical volumes.
Can it be used to remap PEs like this?

> But I'd strongly recommend to get rid of such broken driver quickly the=
n
> you loose any more data - IMHO it's the most efficient solution cost &
> time.

I'm not overly worried.  There is no critical data on that disk/machine
and it's fully backed up twice a day.  I do appreciate your concern and
warning though.

Cheers,
b.



--------------enig3EB6FB29FA9854E84ECAC80C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with undefined - http://www.enigmail.net/

iEYEARECAAYFAlC3VHAACgkQl3EQlGLyuXBq1ACgsSs3ltHV1YDKA1CNJG9nPaFD
Qi4An1AXMvc1xFWgyGUZUFmqSmoLQ7OD
=ERQq
-----END PGP SIGNATURE-----

--------------enig3EB6FB29FA9854E84ECAC80C--
