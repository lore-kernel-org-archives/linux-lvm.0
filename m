Date: Thu, 6 Sep 2001 07:32:54 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] lvcreate segfaults
Message-ID: <20010906073254.A10735@sistina.com>
References: <20010905121129.I32553@turbolinux.com> <Pine.A41.4.21.0109051323340.22482-300000@gigue.dlib.indiana.edu> <20010905153703.A5914@sistina.com> <20010906090024.A373@btconnect.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <20010906090024.A373@btconnect.com>; from thornber@btconnect.com on Thu, Sep 06, 2001 at 09:00:25AM +0100
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

--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 06, 2001 at 09:00:25AM +0100, Joe Thornber wrote:
> On Wed, Sep 05, 2001 at 03:37:03PM -0500, AJ Lewis wrote:
> > On Wed, Sep 05, 2001 at 01:32:34PM -0500, John Marquart wrote:
> > > 	I am running LVM 1.0.1rc2 on  2.4.8 kernel ontop of a IBM
> > > Serverraid 4Mx RAID5 filesystem.  I am trying to create a new lv using
> > > "lvcreate -n foo -L 4M rootvg" - however that command insists on givi=
ng me
> > > a segfault. =20
> >=20
> > Here is a patch that should fix this problem.  It has already been appl=
ied
> > to the CVS.  just save this to a file and apply it to the 1.0.1-rc2 sou=
rce
> > with the -p0 flag after cd'ing to the 1.0.1-rc2 directory.
>=20
> I don't think this patch fixes it, it's just a tidy up.

Hmm...was looking at this:
http://lists.sistina.com/pipermail/lvm-devel/2001-September/000637.html

Sounded like changing the inlines fixed the seg-fault for this guy. =20

John,
you could also try the patch referred to from that e-mail, but it doesn't
sound like it's the same problem i guess...

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
Programming graphics in X is like finding sqrt(pi) using Roman numerals.
-----End Obligatory Humorous Quote------------------------------------------

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7l2z2b2fpvETN3pURAoMaAJ0Qh0fwS+qO8ULJGh090eIKmWbaDQCbBPK9
/szm8vUuAszbtqMezUjNd/Q=
=RZy9
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
