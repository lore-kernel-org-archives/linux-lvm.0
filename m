Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n39DCJ3I024480
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 09:12:19 -0400
Received: from mhw.ulib.iupui.edu (mhw.ulib.iupui.edu [134.68.171.23])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n39DAPKe002738
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 09:11:31 -0400
Received: from mwood by mhw.ulib.iupui.edu with local (Exim 4.69)
	(envelope-from <mwood@IUPUI.Edu>) id 1Lru1Q-0005Pm-FD
	for linux-lvm@redhat.com; Thu, 09 Apr 2009 09:10:24 -0400
Date: Thu, 9 Apr 2009 09:10:24 -0400
From: "Mark H. Wood" <mwood@IUPUI.Edu>
Subject: Re: [linux-lvm] Will LVM2 ever be able to do striped mirrors "raid
	10"? >>> Use HARDWARE RAID CONTROLLERS
Message-ID: <20090409131024.GA15822@IUPUI.Edu>
References: <49DCA275.8070203@Calva.COM> <49DDA10D.3070005@awerner.homeip.net>
	<1239277513.4484.234.camel@breeves.fab.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline
In-Reply-To: <1239277513.4484.234.camel@breeves.fab.redhat.com>
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


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2009 at 12:45:13PM +0100, Bryn M. Reeves wrote:
> On Thu, 2009-04-09 at 09:17 +0200, Axel Werner wrote:
> > also working good with linux are LSI Logic MEgaRaids. BUT... they dont=
=20
> > support GNU Linux , only RH Enterprise and Suse Enterprise are=20
>=20
> What are you talking about? The megaraid driver has been in the kernel
> for years now. It's been a very long time since you had to use
> out-of-tree modules for these cards (even if the vendors still provide
> their own packaged binary modules).

He probably is referring to the userland tools for managing the
controllers, which are useless on most distros.  Which makes the
hardware much less valuable, since you have to down the system and get
into the adaptor's BIOS just to look at it, let alone adjust it.  See
for example *any* HP storage or system-management product.  The tools
will not even load -- they depend on versions of libstdc++ that do not
and will never exist in most distros.

The megaraid (and cciss) drivers *have* been in-kernel for a long time
now and *do* work well -- once you get the adaptor set up from BIOS.
As long as you're happy to set-and-forget, they are good choices.

--=20
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
Friends don't let friends publish revisable-form documents.

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.10 (GNU/Linux)

iEYEARECAAYFAknd88AACgkQs/NR4JuTKG9X4QCfWGv8E1UdcHn+EDNbxxAS8vUU
A30AnAiq1bYuNpB7rVghob9eBlOQFeps
=01Ro
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
