Subject: Re: [linux-lvm] Long-term snapshots possible?
Message-ID: <20030311211448.GB29034@pc.ilinx>
References: <200303112228.39201.jhs@openenterprise.biz> <20030311204616.GB14278@gw.silicide.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
In-Reply-To: <20030311204616.GB14278@gw.silicide.dk>
From: lvm@interlinx.bc.ca
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
Date: Wed Mar 12 15:02:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2003 at 09:46:16PM +0100, jon+lvm@silicide.dk wrote:
>=20
> How would you not do that ? You have to store the snapshots some how.

Right you do have to store them.  But if the block references were in
the reverse direction than they are currently then the disk penalty
for snapshots would not increase linearly with the number of
snapshots.

As I understand it, the way LVM works currently is that if a block
that is in one or more snapshots is going to be altered, the contents
of the block, prior to commiting the new contents, is copied to all of
the snapshots, one copy per snapshot, hence the linear penalty to
keeping multiple snapshots.

However if the updating of a block that was in one or more snapshots
were done such that the existing block was not overwritten but instead
a new block was allocated for the "live" (non-snapshot) device to
write the new contents, there would be a constant cost (the cost of
writing one block and accounting for it in the "live" device) rather
than a linearly increasing cost no matter how many snapshots there
were.

This is not likely possible the way LVM works currently (or it would
work this way :-) however.

This is one of the advantages filesytem level snapshots have over
block level snapshots.  Filesystems can change block pointers easily
enough that it can make one constant cost change per overwritten block
no matter how many snapshots are referencing the old block still.

b.

--=20
Brian J. Murrell

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+blHIl3EQlGLyuXARAm2iAJ4lTc1byl7oofwyDbFLVb2njjhoWACgs68k
k8her1xwKhLK/5W5rfT0qJ4=
=Fgxo
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
