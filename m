Return-Path: <lewis@sistina.com>
Date: Mon, 7 May 2001 18:08:15 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Can't pvcreate second partition...
Message-ID: <20010507180815.E9153@sistina.com>
References: <B51F0C636E578A4E832D3958690CD73E0130BEE2@es04snlnt>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bi5JUZtvcfApsciF"
Content-Disposition: inline
In-Reply-To: <B51F0C636E578A4E832D3958690CD73E0130BEE2@es04snlnt>; from jdiehl@sandia.gov on Mon, May 07, 2001 at 04:13:38PM -0600
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

--bi5JUZtvcfApsciF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 07, 2001 at 04:13:38PM -0600, Diehl, Jeffrey wrote:
> The problem with this theory is that I'm running 2.2.18, not 2.4.x.

Doh. I guess it isn't a 2.4x only problem then.  ;)  Very odd.  Has anyone
seen this when the LVM patches are not applied?

> > -----Original Message-----
> > From: AJ Lewis [mailto:lewis@sistina.com]
> > Sent: May 06, 2001 10:12 PM
> > To: linux-lvm@sistina.com
> > Subject: Re: [linux-lvm] Can't pvcreate second partition...
> >=20
> >=20
> > On Sun, May 06, 2001 at 10:36:13AM -0700, Darren Young wrote:
> > > Funny, I had the same issue at the same time. I
> > > created /dev/hdb7 with fdisk and then a pvcreate just
> > > after. pvcreate stated that the dev didn't exist.
> > > Reboot fixed the problem. This could be a problem for
> > > machines already up in production with small windows
> > > for restarts. Why is this necessary and will it become
> > > a "non-issue" in future releases? If this will be
> > > necessary forever, then some simple planning would
> > > solve the problem, at least on new installations. Any
> > > way around this?
> >=20
> > This appears to be an issue with fdisk and the 2.4.x series=20
> > Linux kernels.
> > It has nothing to do with LVM as far as i can tell.  I've had=20
> > problems where
> > I run fdisk to change the size of a partition, but linux=20
> > doesn't detect the
> > change.  /proc/partitions is identical before and after i=20
> > attempt to write
> > out the changes with fdisk.  I'm not sure what has caused this. Maybe
> > someone else on the list knows?
> >=20
> > I'll try to verify this when i get into work tomorrow.
> >=20
> > Regards,
> > --=20
> > AJ Lewis
> > Sistina Software Inc.                  Voice:  612-638-0500
> > 1313 5th St SE, Suite 111              Fax:    612-638-0500
> > Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
> > http://www.sistina.com
> >=20
> > Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E=20
> > 1261 0029 2648
> > Get my key at: http://www.sistina.com/~lewis/gpgkey
> >  (Unfortunately, the PKS-type keyservers do not work with=20
> > multiple sub-keys)
> >=20
> > -----Begin Obligatory Humorous=20
> > Quote----------------------------------------
> > Life's unfair - but root password helps!
> > -----End Obligatory Humorous=20
> > Quote------------------------------------------
> >=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
A computer without a Microsoft operating system is like a dog without bricks
tied to its head.
-----End Obligatory Humorous Quote------------------------------------------

--bi5JUZtvcfApsciF
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE69yrfpE6/iGtdjLERAkL6AJ4rI8fj+pcH5izfRiDeKWKFlWH0/QCfUuIr
4FsIeAFZI9LJcLCJP7xRek8=
=dN4G
-----END PGP SIGNATURE-----

--bi5JUZtvcfApsciF--
