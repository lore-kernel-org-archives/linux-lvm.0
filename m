Date: Thu, 2 Nov 2000 06:15:30 -0600
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] Exporting VG
Message-ID: <20001102061530.A14333@omnifarious.mn.org>
References: <3A014331.41176643@imim.es>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
In-Reply-To: <3A014331.41176643@imim.es>; from xfustero@imim.es on Thu, Nov 02, 2000 at 11:34:25AM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2000 at 11:34:25AM +0100, Xavi Fustero wrote:
> I have 3 computers: N1, N2 and N3.
> N1 has 3 disks  (vg1)
> N2 has 1 disk   (vg2)
> N3 has 1 disk   (vg3)
> I built a Volume group on each machine, now what I would like to do is
> to unify these volume groups under a new one volume group visible from
> all the 3 machines  (new_vg=3Dvg1 + vg2 + vg3). Is this possible ???
> Let me know if anybody tried this.

	No, it isn't with LVM.

	You probably want (Global File System) or GFS.  Though I think
that one tends to assume that your storage is actually free-floating on
a Fibre Channel network, not attached to particular machines.

	LVM doesn't do stuff over a network by itself.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6AVriG4QeWBeRdS8RArcYAJ9bZlhNlVXbf+tJ00Pk+9kDtwDLtgCgkZ0W
LRQZToEadkgkMRzgIdjogBs=
=6mW9
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
