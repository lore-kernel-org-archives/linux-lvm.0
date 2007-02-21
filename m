Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1LLNKvS028832
	for <linux-lvm@redhat.com>; Wed, 21 Feb 2007 16:23:20 -0500
Received: from mhw.ulib.iupui.edu (mail@mhw.ulib.iupui.edu [134.68.171.23])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1LLNJmi020123
	for <linux-lvm@redhat.com>; Wed, 21 Feb 2007 16:23:19 -0500
Received: from mwood by mhw.ulib.iupui.edu with local (Exim 4.62)
	(envelope-from <mwood@mhw.ulib.iupui.edu>) id 1HJyvm-00035T-Cb
	for linux-lvm@redhat.com; Wed, 21 Feb 2007 16:23:18 -0500
Date: Wed, 21 Feb 2007 16:23:18 -0500
From: "Mark H. Wood" <mwood@IUPUI.Edu>
Subject: Re: [linux-lvm] LVM - History
Message-ID: <20070221212318.GA8141@IUPUI.Edu>
References: <628454.24513.qm@web32913.mail.mud.yahoo.com>
	<87f94c370702210853i643ef08co7667e9bf5e77f126@mail.gmail.com>
	<45DC80B3.6000001@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <45DC80B3.6000001@free.fr>
Sender: "Mark H. Wood,UL 0115A,+1 317 274 0749," <mwood@mhw.ulib.iupui.edu>
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


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Maybe you should define the scope of "LVM" for your purposes.  The
basic idea goes waaaaay back.  Netware 4 had the ability to divvy up a
partition, slice off pieces, and stick them together into one or more
logical volumes.  Most mainframe and mini OSes could at least paste
multiple physical disk volumes together to form larger logical
volumes.  The ANSI X3.27 tape label standard from the 1970s or so (my
copy is at home now) (last edition is from 1987) defines a way to do
this with *open-reel tapes*.

It's interesting to look at how the idea developed over time.  Logical
volume management started out as a way to make a single large logical
volume out of multiple rather dinky physical volumes.  Nowadays it's
typically used in the opposite fashion:  take a huge physical volume
and carve it into multiple smaller logical volumes.  You can still
make logical volumes bigger than the biggest available physical
volume, though, and there are sites which do.  (I haven't needed that
much storage in a single block address space since the 1990s, but YMMV.)

--=20
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
Typically when a software vendor says that a product is "intuitive" he
means the exact opposite.


--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFF3LhGs/NR4JuTKG8RAqHzAJ0ZgCy7/jGvHfEjAijntWcFJRG2DACfca4R
H/5NRA3xuiX1bJwSbeyGkII=
=FJkW
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
