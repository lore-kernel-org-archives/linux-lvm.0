Date: Thu, 23 Aug 2001 19:54:02 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] segfault running vgscan
Message-ID: <20010823195402.A23333@sistina.com>
References: <20010823145432.A20622@sistina.com> <20010823225107.2238.qmail@web20301.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
In-Reply-To: <20010823225107.2238.qmail@web20301.mail.yahoo.com>; from bwlang@yahoo.com on Thu, Aug 23, 2001 at 03:51:07PM -0700
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

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 23, 2001 at 03:51:07PM -0700, Brad Langhorst wrote:
> the static vs dynamic link bit gave me the idea to try
> compiling lvm statically - seems to work now.
>=20
> i can't upgrade glibc since its already at 2.2.4 which
> is the most recent (as far as I can tell)

Interesting that i have the exact opposite problem with version 2.2.3 of
glibc...I think more research is required.  Has anyone else seen a problem
like this?

> lets hope it doesn't just appear to work...

Yes!

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
"Facts are useless!  You can use facts to prove almost anything that's even
remotely true.  Facts schmacts."  --Homer Simpson
-----End Obligatory Humorous Quote------------------------------------------

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7haWqpE6/iGtdjLERAiGwAJ9Bj9znGsuKeRfDOddG3yuj0dskXgCgj5Xz
TBhqWjkckm08Ao+lbZtjjzw=
=ECYg
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
