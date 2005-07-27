Date: Wed, 27 Jul 2005 09:24:40 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] Mirroring a Drive for load-balancing AND failover
Message-ID: <20050727142440.GA4954@null.msp.redhat.com>
References: <ca4f7e300507270144720cef7b@mail.gmail.com>
	<42E786B9.2080400@mattgillen.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dngyMJhgXGAL5Gb8"
Content-Disposition: inline
In-Reply-To: <42E786B9.2080400@mattgillen.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--dngyMJhgXGAL5Gb8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2005 at 09:06:01AM -0400, Matthew Gillen wrote:
> Fury wrote:
> > I've racked my brain on this one, so hopefully someone will be of some =
help.
> >=20
> > I'm trying to set up two servers which share a drive and do not have a
> > Single Point of Failure.  They are on a local network with each other.
> >  The best solution would be to have /dev/sda1 on one server mirrored
> > with /dev/sda1 on the second server.
> > ...
> > A second solution was to use GFS/GNBD.  I can export each drive to the
> > other server, and do RAID 1 (on both servers) between the local
> > /dev/sda1 and the remote gnbd device.  I then format the raid device
> > with GFS so both servers can mount it.
> >=20
> > Surprisingly, this last system works.  Both systems can mount the
> > drive and read-write to it.  However, if either server in this
> > configuration drops dead, the other server cannot deal with the dead
> > gnbd device, and the raid device and mount point are no longer usable.
> >  I'm sure there are numerous other problems with this setup, also.
> >=20
> > So I'm looking for ideas.  With two servers, how can I mirror a drive
> > in real-time, and allow for failover?
>=20
> You might want to use something more like iSCSI + RAID:
> http://linux-iscsi.sourceforge.net/

How is that different than GNBD + RAID?  The issue isn't the network
transport, it's recovery of a RAID on two nodes simultaneously.

--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat                                    E-Mail: alewis@redhat.com
One Main Street SE, Suite 209
Minneapolis, MN 55414
  =20
Current GPG fingerprint =3D D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8=
715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...


--dngyMJhgXGAL5Gb8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC55ko9QxUqFeMhxURAnA5AKCOiPNtJy1JSawgdrDf4WL5NSFORQCgpfF4
aOgBi61NWRmoup8WM/crPjs=
=ifFE
-----END PGP SIGNATURE-----

--dngyMJhgXGAL5Gb8--
