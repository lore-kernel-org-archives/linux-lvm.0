Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3SH9vnb011792
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 13:09:57 -0400
Received: from mhw.ulib.iupui.edu (mail@mhw.ulib.iupui.edu [134.68.171.23])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3SH9lqC002920
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 13:09:47 -0400
Received: from mwood by mhw.ulib.iupui.edu with local (Exim 4.69)
	(envelope-from <mwood@IUPUI.Edu>) id 1JqWrK-0003YP-7C
	for linux-lvm@redhat.com; Mon, 28 Apr 2008 13:09:46 -0400
Date: Mon, 28 Apr 2008 13:09:46 -0400
From: "Mark H. Wood" <mwood@IUPUI.Edu>
Subject: Re: [linux-lvm] How to move /usr from LVM back to non-LVM?
Message-ID: <20080428170946.GB10409@IUPUI.Edu>
References: <4814E782.9080805@Media-Brokers.com> <4815553F.5030806@free.fr>
	<4815FA96.1090302@Media-Brokers.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline
In-Reply-To: <4815FA96.1090302@Media-Brokers.com>
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


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I usually set up three partitions:

/boot
/
LVM

I don't use an initrd.  I give '/boot' a partition -- the first
partition -- to avoid any possibility of problems with the BIOS being
able to find secondary loaders, kernels, and the like.  So little goes
here that I can be very generous and never have to think about
resizing, and it'll still be tiny w.r.t. modern drive sizes.

The root volume is a partition because I don't do initrd.  Mostly it's
just mount points, critical libraries, kernel modules, and ~root.
Again, I can size it generously without significant waste.

Everything else, even swap, goes into LVM so it's easy to resize.
I've not yet found time to play with snapshotting.

If the box maker provides a diagnostic partition image, it goes in
between '/boot' and '/'.

On a server box, this is all atop hardware RAID.

--=20
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
Typically when a software vendor says that a product is "intuitive" he
means the exact opposite.


--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAkgWBNoACgkQs/NR4JuTKG9GaQCeIqjDDq2avxySCh6QzxM1+lO5
m5cAnjs6wybPBQ5Xre1aPQY/mkUojRAC
=PWY6
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
