Return-Path: <allanwind@mediaone.net>
Date: Fri, 20 Jul 2001 21:13:56 -0400
Subject: Re: [linux-lvm] I/O error: dev 08:11, sector 0
Message-ID: <20010720211356.A932@digit-safe.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
In-Reply-To: <20010719105215.A18915@digit-safe.dyndns.org>
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

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2001-07-19 10:52:15, Allan M. Wind wrote:

> The drive started complaining before any changes were made, I suppose the=
 cable
> could have gone bad (length, termination, power etc should be ok), but...

Replaced the scsi cable per suggestion and it appears to make no
difference in that 'I/O error: dev 08:11, sector 0' is logged when
running vgck.  No "scsi:" errors were reported with this drive.

> When does lvm create /dev/sdb1 (I only used /dev/sdb)?

Still curios about this one as I did not create it and cfdisk does not
seem to recognize the partition (just reports free space).  How is
this partition locatated in relation to the disc device?  I get the
above error if dd if=3Dsdb1 but I would think the sector would be
reachable via the the disc device also... perhaps there is something
wrong with the device partition?

Does lvm use the first sector?  If not, could it just be bad data that
is somehow read and therefor complained about and could be wiped?
Should I create a partition and feed that to pvcreate instead of
giving it the raw disk?

Any input is greatly appreciated...


/Allan
--=20
Allan M. Wind			email: allanwind@mediaone.net
P.O. Box 2022			finger: awind@digit-safe.dyndns.org (GPG/PGP)
Woburn, MA 01888-0022
USA

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7WNdTerJrYp1ydncRAmA0AJ48bUGboQc1Uiq/V9AeFvzooSBHvACfaRZ1
UOkU9iZmIV0TVa3/mqfOSfk=
=U4sS
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
