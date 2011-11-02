Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pA2EIi1P005331
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 10:18:44 -0400
Received: from mhw.ulib.iupui.edu (mhw.ulib.iupui.edu [134.68.171.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA2EIhIU010252
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 10:18:43 -0400
Received: from mwood by mhw.ulib.iupui.edu with local (Exim 4.76)
	(envelope-from <mwood@IUPUI.Edu>) id 1RLbeM-0006Ny-Ag
	for linux-lvm@redhat.com; Wed, 02 Nov 2011 10:18:42 -0400
Date: Wed, 2 Nov 2011 10:18:42 -0400
From: "Mark H. Wood" <mwood@IUPUI.Edu>
Message-ID: <20111102141842.GC17976@IUPUI.Edu>
References: <604704853.1651560.1320172792894.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
	<4EB1190A.30501@ankh.org>
	<581100587.20111102124129@marki-online.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-ripemd160;
	protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Content-Disposition: inline
In-Reply-To: <581100587.20111102124129@marki-online.net>
Subject: Re: [linux-lvm] N00b Question: Logical Volume without a Logical
 Volume Group ?
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


--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 02, 2011 at 12:41:29PM +0100, Marek Podmaka wrote:
> Wednesday, November 2, 2011, 11:18:50, James Hawtin wrote:
> > Personally even with LVM I would still write a partition table the disk,
> > this helps show the disk as being used to other system administrators,
> > however there would be one partition on it of type 8e, and on that I=20
> > would create a PV (physical volume), this PV can then be used to create
>=20
> How do you extend the PV then? For example extend the LUN on storage
> or just resize a RAID1+0 set by adding 2 new disks... Resizing the
> block device is no problem, resizing the PV also, but to resize the
> PV, you need to resize the partition also - and if I remember well,
> the kernel won't re-read the new partition table while it is used...

That's just it -- normally you don't change the size of a PV.  That's
the reason for VGs, which can be expanded anytime by adding new PVs.

To add capacity from a SAN, you could either:

1.  create a new LUN, create a PV on it, and add it to a VG; or
2.  expand the LUN, create a new PV in the added space, and add it to a
    VG.

In case (2) you'd need to have partitioned the LUN before building the
first PV on (a partition of) it, so that there can be multiple PVs on
the LUN.

There is weirdness in the SAN case because you have two LVM
implementations layered up:  one in the SAN fabric and another in the
client host.  Come to think of it:  your hardware RAID probably has
its own LVM implementation too, though it is probably a bare-bones one.

--=20
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
Asking whether markets are efficient is like asking whether people are smar=
t.

--bAmEntskrkuBymla
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEAREDAAYFAk6xUUIACgkQs/NR4JuTKG8/eACgkdu81q+VWpUf8dCy7gvDDypX
uY4An2403GquxhEFARk/Dq7u1lmUS0Gf
=pc4q
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--
