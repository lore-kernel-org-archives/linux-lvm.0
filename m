Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8QKS4r02068
	for <linux-lvm@redhat.com>; Sun, 26 Sep 2004 16:28:04 -0400
Received: from clown.omnifarious.org (dsl231-056-102.sea1.dsl.speakeasy.net
	[216.231.56.102])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8QKS3bm007804
	for <linux-lvm@redhat.com>; Sun, 26 Sep 2004 16:28:03 -0400
Date: Sun, 26 Sep 2004 13:27:57 -0700
From: Eric Hopper <hopper@omnifarious.org>
Subject: Re: [linux-lvm] which files, which physical volumes?
Message-ID: <20040926202757.GG32455@omnifarious.org>
References: <41538691.2040807@myself.gen.nz>
	<20040924061754.GD13943@percy.comedia.it>
	<4153BF33.6030008@myself.gen.nz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p7qwJlK53pWzbayA"
Content-Disposition: inline
In-Reply-To: <4153BF33.6030008@myself.gen.nz>
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
To: linux-lvm@redhat.com


--p7qwJlK53pWzbayA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 24, 2004 at 06:31:15PM +1200, Steve Wray wrote:
> So is there any other way to decomission that physical volume that
> doesn't involve pvmove?

I end up using lvcreate (with some options) to create a new logical
volume that has no extents on the physical volume you want to move off
of, and has the exact same number of extents as the logical volume you
want to move.  Then use dd to copy the blocks from the filesystem you
want to move (which has to be unmounted, or mounted read-only) onto the
new one.  Then unmount the old one, lvremove it, and change fstab and
things so the new one is mounted in its place.

It's ugly and stupid.  But, since pvmove doesn't seem to work yet, I
think that's the best that can be done.  I'm sorely disappointed that
LVM2 was even put into the production kernel without pvmove working.
:-(

I know LVM2 and the device mapper concept are much better than LVM1.
But, pvmove is a core piece of functionality.  It's like releasing a
filesystem for which the lstat call doesn't work or something similar.

*sigh*,
--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--p7qwJlK53pWzbayA
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD4DBQFBVyZMjtsvlOwvazYRAlEUAJianZ7ZVnz8YgP1DbvH/SkLosDTAKCYsVIG
hpQLO7rSiRhVXiaLCobokQ==
=shRi
-----END PGP SIGNATURE-----

--p7qwJlK53pWzbayA--
