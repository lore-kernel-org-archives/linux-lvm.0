Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i66KuT025915
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 16:56:29 -0400
Received: from polop.usc.edu (polop.usc.edu [128.125.10.9])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i66KuNXn023989
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 16:56:23 -0400
Received: from polop.usc.edu (localhost.localdomain [127.0.0.1])
	by polop.usc.edu (8.12.11/8.12.11) with ESMTP id i66KuNdK004682
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 13:56:23 -0700
Received: (from garrick@localhost)
	by polop.usc.edu (8.12.11/8.12.11/Submit) id i66KuNuw004680
	for linux-lvm@redhat.com; Tue, 6 Jul 2004 13:56:23 -0700
Date: Tue, 6 Jul 2004 13:56:23 -0700
From: Garrick Staples <garrick@usc.edu>
Subject: Re: [linux-lvm] dm kernel patch size
Message-ID: <20040706205622.GR11597@polop.usc.edu>
References: <20040706191502.GL11597@polop.usc.edu>
	<20040706204647.GC1506@chaos.ao.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+/lp9f/wU8jZ28Xb"
Content-Disposition: inline
In-Reply-To: <20040706204647.GC1506@chaos.ao.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--+/lp9f/wU8jZ28Xb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2004 at 04:46:47PM -0400, Dan Merillat alleged:
> On Tue, 06 Jul 2004, Garrick Staples wrote:
>=20
> > Can someone comment on the size of the dm kernel patches?  They seem to=
 be far
> > too large and patch far more than just dm.  It appears that they patch =
between
> > different kernel versions.
>=20
> Last I checked they include the andrew morton -mm patchset as well.
>=20
> --Dan

Do the dm targets require the mm patchset?  Is it possible to get _just_ the
new dm targets?

--=20
Garrick Staples, Linux/HPCC Administrator
University of Southern California

--+/lp9f/wU8jZ28Xb
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFA6xH20SBUxJbm9HMRAtFCAJ9Mw6BiMADRfz+WCDHS0+q6+mKnyACgnZbH
TQbarjFCPRdIREB0jqG+JXQ=
=gcG+
-----END PGP SIGNATURE-----

--+/lp9f/wU8jZ28Xb--
