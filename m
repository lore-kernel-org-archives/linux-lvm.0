Date: Wed, 11 Oct 2000 08:45:55 -0500
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] lvdisplay disagrees with df for resized LV
Message-ID: <20001011084555.A6983@omnifarious.mn.org>
References: <m2u2ajmunl.fsf@puma.redeye>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <m2u2ajmunl.fsf@puma.redeye>; from andy@redeye.com on Wed, Oct 11, 2000 at 01:25:50PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2000 at 01:25:50PM +0100, Andy Cowling wrote:
> I'm just starting out using LVM under SuSE 7.0. I created a logical
> volume which was initially 30Gb but I then resized it to 90Gb (using
> lvresize) spanning 3 physical volumes each of 30Gb.
>=20
> Now, lvdisplay/vgdisplay shows the LV/VG size as 90Gb, but df still
> lists the file system as 30Gb.
>=20
> How can I get df to recognise the addtional space ?

	I'm assume the filesystem is an ext2 filesystem.  If it is, then
you need to find an ext2 resizing utility.  resize2fs is one such
utility.  I'm not sure where to find them on the web, but they
definitely exist.

	In general, the filesystem can only be resized when it's
offline.  The filesystem resizing utility updates all the filesystem
data structures to reflect the new size, and creates new data structures
in the new space.  df bases it's output on what the filesystem says
about the size, not the block device itself.

	It might be that SUSE came with a resizing utility.  I'd
actually rather expect it if they also packaged LVM.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE55G8TG4QeWBeRdS8RAv2OAKCkEEjGHNvpobKJAbFi75jM1sN4qACgtIN/
oi0UcOSt9a7miNJ5RHoPWAA=
=jbGs
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
