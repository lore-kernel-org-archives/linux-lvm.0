Return-Path: <allanwind@mediaone.net>
Date: Mon, 23 Jul 2001 10:31:08 -0400
Subject: Re: [linux-lvm] I/O error: dev 08:11, sector 0
Message-ID: <20010723103108.A19532@digit-safe.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <20010723100203.C10807@sistina.com>
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

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2001-07-23 10:02:03, Heinz J. Mauelshagen wrote:

> > Used `pvcreate /dev/sdb1` (instead of /dev/sdb) and everything works
> > as expected.  I suspect there is a bug with the combination of linux
> > 2.4.6 (devfsd) and lvm 0.9.1beta7 causing a non-functional partition
> > to be created when you use the raw disk partition.
>=20
> Are you able to reporduce this?

Yes, in the sense that I managed to get into this condition twice using the
steps outlined earlier in the thread.  It will be a bit painful for me
to provide more data at this point, but I will backup/restore if needed.


/Allan
--=20
Allan M. Wind			email: allanwind@mediaone.net
P.O. Box 2022			finger: awind@digit-safe.dyndns.org (GPG/PGP)
Woburn, MA 01888-0022
USA

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD4DBQE7XDUserJrYp1ydncRAkBCAJ0TBlOBrk7tU7RUduF5R5VTO4e9AwCXdEQh
LCh4hPiPg0awuuGsbVmx3A==
=rhZZ
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
