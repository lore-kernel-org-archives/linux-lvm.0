Return-Path: <allanwind@mediaone.net>
Date: Sat, 21 Jul 2001 13:44:19 -0400
Subject: Re: [linux-lvm] I/O error: dev 08:11, sector 0
Message-ID: <20010721134419.B12590@digit-safe.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Content-Disposition: inline
In-Reply-To: <20010720211356.A932@digit-safe.dyndns.org>
From: Allan M. Wind <allanwind@mediaone.net>
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

--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2001-07-20 21:13:56, Allan M. Wind wrote:

> > When does lvm create /dev/sdb1 (I only used /dev/sdb)?
>=20
> Still curios about this one as I did not create it and cfdisk does not
> seem to recognize the partition (just reports free space).  How is
> this partition locatated in relation to the disc device?  I get the
> above error if dd if=3Dsdb1 but I would think the sector would be
> reachable via the the disc device also... perhaps there is something
> wrong with the device partition?
>=20
> Does lvm use the first sector?  If not, could it just be bad data that
> is somehow read and therefor complained about and could be wiped?
> Should I create a partition and feed that to pvcreate instead of
> giving it the raw disk?

Used `pvcreate /dev/sdb1` (instead of /dev/sdb) and everything works
as expected.  I suspect there is a bug with the combination of linux
2.4.6 (devfsd) and lvm 0.9.1beta7 causing a non-functional partition
to be created when you use the raw disk partition.


/Allan
--=20
Allan M. Wind			email: allanwind@mediaone.net
P.O. Box 2022			finger: awind@digit-safe.dyndns.org (GPG/PGP)
Woburn, MA 01888-0022
USA

--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7Wb9zerJrYp1ydncRAnX/AJ498b2Obi6wp/nMxLPidS/H80zaggCdGZJN
nkV+YyGyXzu7dqGk5ED/yLk=
=QYch
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--
