Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBMD6N118477
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 08:06:23 -0500
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBMD6GuR012998
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 08:06:16 -0500
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1EpQ91-0001y1-Ab
	for linux-lvm@redhat.com; Thu, 22 Dec 2005 13:06:10 +0000
Date: Thu, 22 Dec 2005 13:06:07 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20051222130607.GT10278@strugglers.net>
References: <20051222122513.GP10278@strugglers.net>
	<20051222124346.78978.qmail@web36211.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ImbhesNbK26zUpL9"
Content-Disposition: inline
In-Reply-To: <20051222124346.78978.qmail@web36211.mail.mud.yahoo.com>
Subject: Re: [linux-lvm] Recovery of data in LVM from a corrupt disk
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


--ImbhesNbK26zUpL9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2005 at 04:43:46AM -0800, Hale India wrote:
>=20
>    Hi
>    I tried to see my data from knoppix, but for what I remember knoppiux
>    does not support LVM.

It does as I have used knoppix LVM support several times.

http://www.justfuckinggoogleit.com/search?q=3Dknoppix+lvm

>    From your links I found
>    http://dcs.nac.uci.edu/~strombrg/EXT3-filesystem-recovery-in-LVM2.html
>    Which seems to give some tricks. I don't know if this is capable to
>    work.

There is plenty of good information there.

>    But it seems that LVM project does not take care about that and I find
>    very bad for such a project to give no exit way for such a problem.

I agree that people who aren't willing to do any research or
diagnostic work when they have a failure caused by their broken
hardware should not use LVM or Linux, or computers.

>    It should have some recovery guide documentation in the project.

I would rather they continued developing the software as opposed to
paying people to write documentation covering every possible outcome
of hardware problems which users still will not read.

--ImbhesNbK26zUpL9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDqqS/IJm2TL8VSQsRAnePAJ0WVXFlZsWtq5a2LKvsIy9fZOfPQgCg/i+l
eWJRervjf4LxsnnFOu0qcnA=
=Jw7g
-----END PGP SIGNATURE-----

--ImbhesNbK26zUpL9--
