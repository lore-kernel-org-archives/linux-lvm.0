Return-Path: <lewis@sistina.com>
Date: Tue, 6 Feb 2001 13:22:40 -0600
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Help! Problems finding VG after reboot.
Message-ID: <20010206132240.E3376@sistina.com>
References: <20010206183505.7773.qmail@fraggle.cs.uit.no> <Pine.LNX.4.21.0102061656090.1535-100000@duckman.distro.conectiva>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="47eKBCiAZYFK5l32"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0102061656090.1535-100000@duckman.distro.conectiva>; from riel@conectiva.com.br on Tue, Feb 06, 2001 at 04:58:22PM -0200
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

--47eKBCiAZYFK5l32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 06, 2001 at 04:58:22PM -0200, Rik van Riel wrote:
> On Tue, 6 Feb 2001 gobo@gimle.nu wrote:
>=20
> > Running vgscan I got the following message:
> >=20
> > # vgscan
> > vgscan -- reading all physical volumes (this may take a while...)
> > vgscan -- found inactive volume group "widow"
> > vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't ge=
t=20
> > data of volume group "widow" from physical volume(s)
> > vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating=
=20
> > "/etc/lvmtab" and "/etc/lvmtab.d"
>=20
> I am running into the same bug, with the very latest LVM
> utilities and kernel 2.4.1.
>=20
> I have posted a bugreport in the LVM bugzilla, but I haven't
> heard anything from the LVM developers. Lets just hope they're
> not ignoring us...

The problem with your bug report on Bugzilla is that it is confusing.  You
added to a bug that complained about vgscan seg-faulting.  That bug is
obviously fixed.  The problem now is that vgscan no longer finds proper data
in the volume group.  This should be posted as a separate bug report, not
tacked onto the end of the old one. =20

BTW, just because you haven't gotten an immediate reply does not mean the
problem is not being worked on.  We are a distributed development team,
with varying schedules.  Please give us a little credit that we are actually
reading the MLs and working on these problems instead of impatiently
complaining that nobody on the LVM team is doing anything all the time.  It
is rather tiring to see yet another post from you complaining that we don't=
 do
anything.

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
A bad random number generator: 1, 1, 1, 1, 1, 4.33e+67, 1, 1, 1...
-----End Obligatory Humorous Quote------------------------------------------

--47eKBCiAZYFK5l32
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6gE8ApE6/iGtdjLERAvVMAJ46akJmd5zho7NX6+BVheVVGPiKPwCfTlOB
A1tVf8JWwkwJlj+qXJtAh8k=
=b4xx
-----END PGP SIGNATURE-----

--47eKBCiAZYFK5l32--
