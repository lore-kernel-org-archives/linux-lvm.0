Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9CJx0r14849
	for <linux-lvm@redhat.com>; Tue, 12 Oct 2004 15:59:00 -0400
Received: from clown.omnifarious.org (dsl231-056-102.sea1.dsl.speakeasy.net
	[216.231.56.102])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9CJwxP9017782
	for <linux-lvm@redhat.com>; Tue, 12 Oct 2004 15:58:59 -0400
Date: Tue, 12 Oct 2004 12:58:53 -0700
From: Eric Hopper <hopper@omnifarious.org>
Message-ID: <20041012195853.GA6352@omnifarious.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
Subject: [linux-lvm] LVM2 lockup while snapshotting root
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


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I tried to snapshot LVM2 the root partition and (probably not to the
surprise of most of you) hung my system.  In thinking about this
problem, I think there is a solution.  I do not know precisely what
causes the problem, but it can only be one of two things.

First, it could be updates to /etc/lvm while the filesystem is
suspended.  This shouldn't be done at all.  First, a journal of what the
planned change is should be written to /etc/lvm, the filesystem
suspended, the change made, the filesystem unsuspended, then a marker
indicating that the change succeeded to /etc/lvm.

Second, it could be the fact that the LVM executable is demand paged.
It could be that a page of the executable is read in while the
filesystem is suspended.  This is trickier to solve, and having the
problem is much more excusable than the first.

The second problem can be solved by creating a temporary ramdisk,
mounting it off of /tmp, copying lvm.static there, then forking and
execing that lvm.static to do what the person asked.  When it finishes,
the original wakes back up to the new snapshotted reality (it was
sitting in a 'waitpid' call the whole time) and removes the ramdisk.

I may implement this (perhaps using a wrapper perl script), as I would
like to be able to snapshot my root filesystem.  If anybody knows that
I'm wrong about something, please tell me before I start.

Thanks,
--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBbDd9jtsvlOwvazYRAlu+AJ9PAe8gQ10kpJb7Z6ytUGGygXunFQCg41kp
yYeAv++WaUGPdZLCVn5nTSI=
=Qss+
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
