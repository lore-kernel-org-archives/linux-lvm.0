From: "Eric M. Hopper" <hopper@omnifarious.org>
Subject: Re: [linux-lvm] Segment Failure ,while doing lvcreate
Message-ID: <20011026075717.B8741@omnifarious.org>
References: <20011025114525.88548.qmail@web16301.mail.tpe.yahoo.com> <3BD80807.4725174F@carolina.rr.com> <20011025074500.A4615@omnifarious.org> <3BD80A4E.9C3E4A3E@carolina.rr.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline
In-Reply-To: <3BD80A4E.9C3E4A3E@carolina.rr.com>; from jedgecombe@carolina.rr.com on Thu, Oct 25, 2001 at 08:49:18AM -0400
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Oct 26 07:56:02 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 25, 2001 at 08:49:18AM -0400, Jason Edgecombe wrote:
> "Eric M. Hopper" wrote:
> >         If gcc-2.96-96 doesn't have the problem, RH 7.2 should work just
> > fine.
>=20
> I suspect that the problem will be in RH 7.2 also.
>=20
>  I was reading the roswell archive and someone from redhat said that all
> 7.x release will be binary compatible, i.e. they all have that buggy
> gcc.
>=20
> I may be wrong on this though.

	Just because it's 2.96 doesn't mean it's buggy.  Apparently
their latest version happens to have the same bug, but that didn't
necessarily have to be true.  I doubt the bug is an inherent 'feature'
of their calling conventions.

	I've actually had a lot of luck with gcc 2.96 fixing problems
for me.  But, I'm a C++ developer.  :-)

Have fun (if at all possible),
--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE72V2tjtsvlOwvazYRAhj8AJ9diwVarz9fLf+04RrutbrCbwtOAwCdG/fF
ApnodMLwYpuIKkqHHmyHFCA=
=J7W2
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--
