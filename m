Return-Path: <lewis@sistina.com>
Date: Mon, 12 Feb 2001 09:09:56 -0600
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] 0.9.1-beta4 install bug
Message-ID: <20010212090956.B7307@sistina.com>
References: <3A85CE89.67D252D7@wrkhors.com> <17316403266.20010211154237@lopez.at> <20010211193524.B5840@colombina.comedia.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Content-Disposition: inline
In-Reply-To: <20010211193524.B5840@colombina.comedia.it>; from bluca@comedia.it on Sun, Feb 11, 2001 at 07:35:24PM +0100
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

--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 11, 2001 at 07:35:24PM +0100, Luca Berra wrote:
> On Sun, Feb 11, 2001 at 03:42:37PM +0100, Adalbert Michelic wrote:
> > Hi,
> >=20
> > * On Sunday, February 11, 2001 at 00:28, Steven Lembark wrote:
> > >         ./configure --prefix=3D/opt/lvm/0.9.1
> >=20
> > > leaves only the man pages in the prefix dir, exec's still go
> > > to /sbin.  this is bad news since it will blow off the entire
> > > LVM installation the next time i test an install. =20
> [...]
> > > so, prefix should set eprefix & friends which should leave the
> > > binaries in /opt/lvm/0.9.1/sbin, etc.
> >=20
> > You have to set --exec-prefix either - --prefix does _not_ modify
> > --exec-prefix as far as i can see.
>=20
> if you want to change the behaviour do this
> and rerun autoconf
> (NOTE exec_prefix should be set to "", not "/", because it is used as in
> sbindir=3D${exec_prefix}/sbin )

Hmm...does it matter?  It never has for me...

Anywho, thanks for that patch; it's exactly what I was thinking would fix
Steven's problem.

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
THE LESSER-KNOWN PROGRAMMING LANGUAGES #16:
C- This language was named for the grade received by its creator when he
submitted it as a class project in a graduate programming class.  C- is
best described as a "low-level" programming language.  In fact, the
language generally requires more C- statements than machine-code statements
to execute a given task.  In this respect, it is very similar to COBOL.
-----End Obligatory Humorous Quote------------------------------------------

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6h/zEpE6/iGtdjLERAihOAJ0bKRXxNnuCUadZhE8Br1CP77MGzACgjw8j
FZzWTSt0GeDjfI/02RKYMD8=
=7LB1
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
