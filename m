Return-Path: <lewis@sistina.com>
Date: Thu, 5 Jul 2001 07:00:55 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Re: another nice feature for packagers ...
Message-ID: <20010705070055.A15869@sistina.com>
References: <Pine.LNX.4.33.0106171519240.14970-200000@moon.dice.hu> <20010618095533.A32072@sistina.com> <20010629140922.B32501@mail.wave.co.nz> <20010703131338.A23563@sistina.com> <20010704124620.B7376@mail.wave.co.nz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <20010704124620.B7376@mail.wave.co.nz>; from markv@wave.co.nz on Wed, Jul 04, 2001 at 12:46:20PM +1200
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
To: Mark van Walraven <markv@wave.co.nz>
Cc: linux-lvm@sistina.com

--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 04, 2001 at 12:46:20PM +1200, Mark van Walraven wrote:
> On Tue, Jul 03, 2001 at 01:13:39PM -0500, AJ Lewis wrote:
> > On Fri, Jun 29, 2001 at 02:09:23PM +1200, Mark van Walraven wrote:
> > > On Mon, Jun 18, 2001 at 09:55:33AM -0500, AJ Lewis wrote:
> > > > Just FYI, the entire build system is going to get an overhaul after=
 the 1.0  =20
> > > > release, so I will definitely be making sure these detail are kept =
in mind   =20
> > > > for that.
> > >=20
> > > Would it be possible to automatically build a liblvm_pic.a?  That wou=
ld
> > > allow building a "reduced" liblvm.so (containing only those functions
> > > required for vgscan and vgchange), suitable for a tight initrd.
> >=20
> > How is this different than the liblvm-10.a that is built now?
>=20
> I don't know about 1.0, but 0.9.1_beta6 built a liblvm-10.so but no
> liblvm-10.a.

Yeah, the latest CVS now builds liblvm-10.a instead of just liblvm.a (That
was an oversight on my part :( )

> Liblvm.a could not be reduced - the reduction tool was expecting to
> find a "PIC archive library" containing "individual shared objects"
> with .os suffixes.

Hmm...interesting.  Which reduction tool is this?  I haven't dealt with this
before, but it definitely would be worth supporting.

> Or are you saying that liblvm-10.a already contains only the minimum
> necessary for vgscan and vgchange?  If so, is there any potential for
> saving initrd space with cut-down versions of vgscan and vgchange?

I don't think the current liblvm-10.a does this.  I was not aware of a tool
that handled this case, but would love to get it to work. :)

Regards,
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
Students nowadays, complaining they only get 5MBs of disk space!
In my day we were lucky if we had one file, and that was /dev/null.
-----End Obligatory Humorous Quote------------------------------------------
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
File not found. Should I fake it? (Y/N)
-----End Obligatory Humorous Quote------------------------------------------

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7RFb3pE6/iGtdjLERAjwcAJ4+PzfdJwWa1+MWBXYuUkqO4s9P6QCfapK2
mbmyhDr45a+kZBjFSFQ/kHA=
=0z1D
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
