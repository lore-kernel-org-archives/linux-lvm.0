Return-Path: <hopper@omnifarious.mn.org>
Date: Fri, 2 Mar 2001 05:48:30 -0600
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] NFS
Message-ID: <20010302054830.A29723@omnifarious.mn.org>
References: <200102271700.f1RH0iE27053@webber.adilger.net> <m2ofvko5og.fsf@isnogud.escape.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline
In-Reply-To: <m2ofvko5og.fsf@isnogud.escape.de>; from urs@isnogud.escape.de on Fri, Mar 02, 2001 at 10:56:15AM +0100
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

--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 02, 2001 at 10:56:15AM +0100, Urs Thuermann wrote:
>=20
> ??  Has a file system to be written so that it supports NFS?  I
> thought all file systems beneath the VFS provide the same interface to
> the NFS server and can be exported via NFS.

	NFS is such an inane sharing protocol...  It expects directories
to be arranged as if they were just a linear file of names with inode
numbers tacked on the end.  It doesn't treat them any differently than
regular files.  This causes problems with filesystems that are in
essence databases, like reiserfs.

	Reiserfs needs to generate some kind of 'position' cookie that
can be used to refind the spot in the directory that NFS was scanning.
I think the position cookie has to increase as more entries are read,
but I'm not sure.  NFS is stateless, so this position cookie has to work
for some indeterminate amount of time.

> I have also exported iso9660 and msdos file systems on local block
> devices via NFS.

	Yeah, but modeling directories in those filesystems as a string
of bytes is accurate.  You just have to have some means of magically
coming up with an inode number, and that's not too hard.  In FAT, for
example, you can just use the starting cluster number as the inode #.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6n4iOG4QeWBeRdS8RAicdAKCFSUSMCvIJ1zVFaWN0KvVwTLZLCACgtzDv
srH2zcU4Iuk+fiB8n4+Kso8=
=iIPj
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
