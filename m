Return-Path: <lewis@sistina.com>
Date: Tue, 13 Mar 2001 11:35:52 -0600
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Problem with vgscan/ vgcfgrestore
Message-ID: <20010313113552.D15679@sistina.com>
References: <20010313012313.A3042@cistron.nl> <200103130056.f2D0uTi01167@webber.adilger.int> <20010313021438.A6401@cistron.nl> <20010312231208.A14087@sistina.com> <20010313095711.A516@tykepenguin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bjuZg6miEcdLYP6q"
Content-Disposition: inline
In-Reply-To: <20010313095711.A516@tykepenguin.com>; from caulfield@sistina.com on Tue, Mar 13, 2001 at 09:57:11AM +0000
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

--bjuZg6miEcdLYP6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 13, 2001 at 09:57:11AM +0000, Patrick Caulfield wrote:
> On Mon, Mar 12, 2001 at 11:12:08PM -0600, AJ Lewis wrote:
> > On Tue, Mar 13, 2001 at 02:14:39AM +0100, Wichert Akkerman wrote:
> > > BTW, the current LVM tools violate the FHS by putting binaries in
> > > /sbin/lvm-*/. Would you accept a patch to move that to /lib/lvm-*/
> > > instead?
> >=20
> > Erm.../lib/lvm-*/?  Really?  Hmm...guess I need to read the FHS.  Anyon=
e got
> > a pointer to that?
>=20
> www.pathname.com/fhs

OK, I'm confused now.  The current LVM tools are installed in /sbin, not
/sbin/lvm-*/.  If you are getting packages from distros that place the
binaries in /sbin/lvm-*/ you need to talk to the distros.  AFAICT, the LVM
tools *should* be in /sbin

This from the current FHS 2.1 standard:

Utilities used for system administration (and other root-only commands) are
stored in /sbin, /usr/sbin, and /usr/local/sbin. /sbin typically contains
binaries essential for booting the system in addition to the binaries in
/bin. Anything executed after /usr is known to be mounted (when there are no
problems) should be placed into /usr/sbin. Local-only system administration
binaries should be placed into /usr/local/sbin

And this is what the FHS has to say about /lib:

The /lib directory contains those shared library images needed to boot the
system and run the commands in the root filesystem.

So how does having LVM binaries in /lib/lvm-*/ _not_ violate the FHS?

Regards,
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
Einstein said that talking to yourself is a sign of intelligence.
Answering yourself, however, is a sign of insanity.
-----End Obligatory Humorous Quote------------------------------------------

--bjuZg6miEcdLYP6q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6rlp4pE6/iGtdjLERAmbyAKCKJUdTJzTM9mT19p1/oXR6BGGvTACfSnDu
uICDOzIRlHQY5Kuc8/F1k1o=
=FHR7
-----END PGP SIGNATURE-----

--bjuZg6miEcdLYP6q--
