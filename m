Return-Path: <lewis@sistina.com>
Date: Thu, 7 Jun 2001 15:58:06 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] logical volumes extending beyond 1 machine
Message-ID: <20010607155805.A5610@sistina.com>
References: <3B1BD4B8.A2C1E9A2@korn.ch> <Pine.SOL.3.96.1010606170637.27045C-100000@design.lbl.gov> <20010607182720.I3232@jensbenecke.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <20010607182720.I3232@jensbenecke.de>; from lvm@jensbenecke.de on Thu, Jun 07, 2001 at 06:27:20PM +0200
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

--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 07, 2001 at 06:27:20PM +0200, Jens Benecke wrote:
> On Wed, Jun 06, 2001 at 05:08:47PM -0700, Damon Fasching wrote:
> >=20
> > Is it possible using LVM define a logical volume which includes disks f=
rom
> > more than 1 machine?
>=20
> I don't think so. You want NFS for that, or the Mosix GFS (global file
> system). Look at www.mosix.org

Umm, not to be anal or anything, but the MOSIX team doesn't develop GFS,
Sistina Software does.  You know, the same group that's heading up LVM?
The same group that hosts this mailing list?  Please look at
http://www.sistina.com if you're still confused.

And yes, you might want to consider using GFS for your system.  :)

Regards,
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
Carpe Aptenodytes! (Seize the Penguins!)
-----End Obligatory Humorous Quote------------------------------------------

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7H+rdpE6/iGtdjLERApHMAJwImvlm0gkO547lR75/GW9iqIjamACdFANM
K14KVnQgJA88awJvViq+j9Q=
=kPH4
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
