From: "Eric M. Hopper" <hopper@omnifarious.org>
Subject: Re: [linux-lvm] Segment Failure ,while doing lvcreate
Message-ID: <20011025074500.A4615@omnifarious.org>
References: <20011025114525.88548.qmail@web16301.mail.tpe.yahoo.com> <3BD80807.4725174F@carolina.rr.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <3BD80807.4725174F@carolina.rr.com>; from jedgecombe@carolina.rr.com on Thu, Oct 25, 2001 at 08:39:35AM -0400
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
Date: Thu Oct 25 07:44:01 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 25, 2001 at 08:39:35AM -0400, Jason Edgecombe wrote:
> hi,
>=20
>   recompile lvm tools with the -O0 flag (no optimization).
> this is because of redhat's 7.x borken gcc compiler
>=20
> I believe that this fix is in the archive.

	Which version of their compiler are you using?  Is it
gcc-2.96-88, or gcc-2.96-96?  Is it even earlier?

	Does gcc 3.0.1 have this same problem?  Are you sure the bug
isn't in the code?  (i.e. having a non-volatile variable randomly
modified under your nose, or some such that would tend to not work so
well under optimization.)

	If gcc-2.96-96 doesn't have the problem, RH 7.2 should work just
fine.

Have fun (if at all possible),
--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE72AlLjtsvlOwvazYRAoZVAJ41yXoOzuFxwOWpldA3LkELpHgMhACg6lT3
qG0FbCCF9vE0bQO8Mj8H9PM=
=R4S+
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
