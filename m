Date: Thu, 18 Oct 2001 20:19:43 -0500
From: "Eric M. Hopper" <hopper@omnifarious.org>
Subject: Re: [linux-lvm] Horrid performance with 2.4.{9,10,12} + LVM + ReiserFS
Message-ID: <20011018201943.B1724@omnifarious.org>
References: <20011018000006.A22777@jensbenecke.de> <15310.40503.356813.663284@rigel.oswf.de> <20011019030045.O25054@jensbenecke.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline
In-Reply-To: <20011019030045.O25054@jensbenecke.de>; from lvm@jensbenecke.de on Fri, Oct 19, 2001 at 03:00:45AM +0200
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

--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 19, 2001 at 03:00:45AM +0200, Jens Benecke wrote:
> > Well, you have 1 disk on a single channel (hda) and the other two as
> > master and slave on *one* channel. That's the bottleneck. If the disks
> > are accessed individually, you get the full performance (more or less).
> > But if *both* disks have to respond, performance drops horribly.  Best =
is
> > to get a third IDE controller.
>=20
> As the disks aren't interleaved (just appended to each other) I don't thi=
nk
> this is a problem. I use LVM because I don't want to split up the FTP
> server space with a huge chaos of symlinks and partitions, not because I
> absolutely need RAID performance.

	This could still be a problem if you have two LVs on the VG that
spans both disk, and one LV is mainly on one disk, and the other is
mainly on the other, and you end up accessing both filesystems at the
same time, you still get a contention problem.  This is a lot of 'ifs',
but it can still happen.  :-)

	The disk space problem is the much more likely culprit.  *grin*

Have fun (if at all possible),
--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7z3+vjtsvlOwvazYRAlbfAKCkXUm5E1yfUXAZniMr//zaz5Vp4QCgr2Nh
erLZKTQ9YkGC/5YSI3w6I8A=
=z7mp
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
