Date: Mon, 10 Sep 2001 11:08:51 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] lvcreate segfaults
Message-ID: <20010910110851.A18882@sistina.com>
References: <20010906073254.A10735@sistina.com> <Pine.A41.4.21.0109071104190.38880-100000@gigue.dlib.indiana.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline
In-Reply-To: <Pine.A41.4.21.0109071104190.38880-100000@gigue.dlib.indiana.edu>; from jomarqua@indiana.edu on Fri, Sep 07, 2001 at 11:05:34AM -0500
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 07, 2001 at 11:05:34AM -0500, John Marquart wrote:
> Thanks AJ,
> 	Me and my trusty ddd had figured out the same thing - that an
> extra printf inserted into the function fixed it.  It is a darn weird bug
> though.
> 	Thanks for the link - made a much nicer cleaner patch then my
> own. :)

Hmm...sounds like there must be a race condition in there somewhere...very
odd.  That's the only thing I can think of that would make the difference,
since the printf could serialize the code somewhat...and it was a dual-proc
machine, so...

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 60F3 160D C0D5 2C4B 751B  4FF9 6F67 E9BC 44CD D=
E95

-----Begin Obligatory Humorous Quote----------------------------------------
"We succeed because our competitors are idiots" - anonymous
-----End Obligatory Humorous Quote------------------------------------------

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7nOWTb2fpvETN3pURAm5ZAKCGuFcF6Qn2hbDejLUA4C6BixAS3QCgmZGQ
dSOnM7NVH7DTxdIGk8jfcqM=
=ASlN
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
