Date: Tue, 1 Aug 2000 14:53:54 -0500
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] Generic resize tool
Message-ID: <20000801145354.A9220@omnifarious.mn.org>
References: <200008011842.e71IgcS27484@webber.adilger.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
In-Reply-To: <200008011842.e71IgcS27484@webber.adilger.net>; from adilger@turbolinux.com on Tue, Aug 01, 2000 at 12:42:38PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Linux LVM mailing list <linux-lvm@msede.com>


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2000 at 12:42:38PM -0600, Andreas Dilger wrote:
> Hello,
> I'm wondering if people are interested in having a more generic resize
> tool than the current e2fsadm.  I've updated e2fsadm to have support
> for the GNU ext2resize tools (ext2resize and ext2online) in addition
> to resize2fs, but I was wondering about adding support for reiserfs
> resizing as well.  At this point e2fsadm isn't a very good name for it
> anymore.
>=20
> I was thinking if renaming it to "chfs" the same as AIX LVM tool which
> handles both LV and FS resizing, among other things, and does not
> sound fs-specific.

	I would expect that chfs would allow you to change a partition
from ext2 to reiserfs, and maybe change the size in the bargain.

	I like resizefs better.  It could also be fsresize.  It depends
on whether you like the mkfs, or fsck traditions better.  Of course, you
could just call it 'resize' like mount calls itself 'mount'.  But,
there's already a X program called 'resize' for resetting your TERMCAP
variable and stty settings after xterm resizes.

Have fun (if at all possible),
--=20
Its name is Public Opinion.  It is held in reverence. It settles everything.
Some think it is the voice of God.  Loyalty to petrified opinion never yet
broke a chain or freed a human soul.     ---Mark Twain
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE5hyrSG4QeWBeRdS8RAiasAKDh2meey4edxqgUhu1zWQLU3ahkJgCfUHe5
xon3+xry1R7QLcs8x06ru3s=
=Zd1R
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
