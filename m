Return-Path: <lewis@sistina.com>
Date: Tue, 5 Jun 2001 11:57:16 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Migrating to an LVM system (boot/root) disk
Message-ID: <20010605115716.B5617@sistina.com>
References: <3B1AC411.D6E307CD@tls.msk.ru> <200106041734.f54HYLbh020302@webber.adilger.int> <20010604171512.A348@sistina.com> <3B1C16AA.AD983576@tls.msk.ru> <20010605012845.B26506@colombina.comedia.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline
In-Reply-To: <20010605012845.B26506@colombina.comedia.it>; from bluca@comedia.it on Tue, Jun 05, 2001 at 01:28:45AM +0200
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

--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 05, 2001 at 01:28:45AM +0200, Luca Berra wrote:
> On Tue, Jun 05, 2001 at 03:15:54AM +0400, Michael Tokarev wrote:
> > So basename also should be placed to initrd? ;)  I think that
> > problem should be resolved at a first place (in mkinitrd), not
> > by putting numerous workarounds all other the place.
> > BTW, bash have nice construct ${var##*/} to be used instead of
> > basename, and it works *much* faster (also ${var%/*} for dirname
> > etc).
> naw it ain't bash, luckily thass a posix construct
> please use parameter expansion instead of basename/dirname
> in any script.

Hmm...that's pretty nice.  I'll put that in the next revision of the
packages i put together for LVM.  If I don't, someone smack me please.

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
To know recursion, you must first know recursion.
-----End Obligatory Humorous Quote------------------------------------------

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7HQ9spE6/iGtdjLERAmIZAKCRrUlyoHG0obAn3oPoFkw2QLbIsgCfdQeJ
zM6h/SYUbwT+rljvoC8atc0=
=yFJS
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
