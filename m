Date: Fri, 9 Jul 2004 08:34:25 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] lvm and renaming of drives
Message-ID: <20040709133425.GD9068@null.msp.redhat.com>
References: <1089297779.9242.19.camel@case.mps.ohio-state.edu>
	<1043.64.233.217.29.1089298486.squirrel@64.233.217.29>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cyV/sMl4KAhiehtf"
Content-Disposition: inline
In-Reply-To: <1043.64.233.217.29.1089298486.squirrel@64.233.217.29>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Erik@server.echohome.org, LVM general discussion and development <linux-lvm@redhat.com>


--cyV/sMl4KAhiehtf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 08, 2004 at 10:54:46AM -0400, Erik Ohrnberger wrote:
> > very brief characteristics:
> >   large fileserver
> >   RHEL v3 AS (2.4.21-based kernel)
> >
> > I have a large RAID device on an external SCSI chain.  Currently the 2
> > drives I've carved out of this device are /dev/sdj and /dev/sdk.
> > Whenever I add a new drive to the internal SCSI chain on the machine the
> > external devices drive letters increment (1 new internal -> /dev/sdk and
> > /dev/sdl).  My question is, if I make /dev/sdk a physical volume what
> > happens when I add a new internal drive?  Will LVM recognize that
> > /dev/sdk is now /dev/sdl and activate the volume group/logical volumes
> > without any problem?  I assume this isn't a problem with DM and 2.6, but
> > I'm not there yet.
> >
> > Thanks,
> > Tim
> >
> >
> > --
>=20
> <snip>
>=20
> IMHO: I think you should do an volumn group export, add the drive, and
> then a volumn group import.  I think that this is needed to make sure that
> the LVM service finds the volume set again, after the device letters are
> bumped.

Actually, it is not necessary to do a vgexport.  You just need to run vgscan
when the drive letters change.

Regards,
--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
720 Washington Ave. SE, Suite 200
Minneapolis, MN 55414

Current GPG fingerprint =3D FE77 4B43 6A9B F982 A731  02FA 2BF5 7574 294A A=
A5A
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...
-----Begin Obligatory Humorous Quote----------------------------------------
"In this time of war against Osama bin Laden and the oppressive
Taliban regime, we are thankful that OUR leader isn't the spoiled son
of a powerful politician from a wealthy oil family who is supported by
religious fundamentalists, operates through clandestine organizations,
has no respect for the democratic electoral process, bombs innocents,
and uses war to deny people their civil liberties." --The Boondocks
-----End Obligatory Humorous Quote------------------------------------------

--cyV/sMl4KAhiehtf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFA7p7h9QxUqFeMhxURAh0xAJoDxQPDuIbH+FU+FOYZFtv+POsIEACgnYKX
Tml60WGUwZzbTl1+1sUP3YM=
=2Ejy
-----END PGP SIGNATURE-----

--cyV/sMl4KAhiehtf--
