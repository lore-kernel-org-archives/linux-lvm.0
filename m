Date: Wed, 8 Nov 2000 14:45:11 -0600
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] Disk striping option
Message-ID: <20001108144511.A32292@omnifarious.mn.org>
References: <OLEAJMNOEMOMMNEIMMINMEIECBAA.pswartz@digitalrom.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <OLEAJMNOEMOMMNEIMMINMEIECBAA.pswartz@digitalrom.com>; from pswartz@digitalrom.com on Wed, Nov 08, 2000 at 01:22:00PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2000 at 01:22:00PM -0600, Patrick Swartz wrote:
> Hello all,
>=20
> I have a question about the use of the LVM native striping option.
> Here is my scenario: I have RH7.0 with an ICP-Vortex Raid controller
> and 11 Seagate 50G hard-drives in a JBOD chassis that is set up as a
> single VG.  An older system has the same configuration without LVM and
> using RH6.2.  What I want to do is move all of the data from the older
> system to the LVM system and then add the old 11 drives to the LVM
> system to in affect double my space available.
>=20
> When I set up the LVM system I used the "-i 11" option to specify all
> 11 disks, how can I add the next 11 drives so that lvm also stripes
> those as well?

	If you have a RAID controller, why do you want to use LVM for
striping?  But the question is still valid, and one I'd be very
interested in the answer to.  I'm interested in the reverse case.  :-)

> Also, do you have any recommendation for a File System to use?  This
> is a production system so I am a little leery of 0.0.x software, but I
> am not crazy about ext2 fcsk on 1TB of data either.

	I've been using reiserfs for quite awhile, and while I'm not
someone who gives an fs a lot of abuse, it has functioned perfectly for
me.  It's also faster than ext2 in most cases, despite the journaling,
and it wastes a lot less space.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6CbtXG4QeWBeRdS8RAq87AKDIuOZtxwj3AOxT5gd6AO4IvW/8dQCfdRsf
8jVoT6cMHOX8SKXgd6vacdE=
=pDdh
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
