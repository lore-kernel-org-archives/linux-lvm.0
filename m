From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] raid1+lvm
Message-ID: <20020923152349.GA22130@kluge.net>
References: <20020923102557.B74653-100000@true.fiberpimp.net> <3D8F2DD0.3050008@mindmatics.de> <20020923151459.GG1358@tykepenguin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <20020923151459.GG1358@tykepenguin.com>
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
Date: Mon Sep 23 10:28:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2002 at 04:14:59PM +0100, Patrick Caulfield wrote:
> I have two boxes that swap onto LVM2 volumes and have seen no problems. L=
VM1
> should be OK too.

I've swapped on a LVM1 setup before.  The only "issue" was that swap
gets enabled before the volumes are brought online, but apparently is
then attempted again after the volumes are up.  (RedHat 7.2?)

I've since taken to keeping /boot, /, and swap out of LVM since they
normally don't need to be resized, and makes the system easier to recover
in case of problems. :)

--=20
Randomly Generated Tagline:
"Well my mother was Irish...  and your father? ... wasn't ..." - The Ref

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9jzIFAuOQUeWAs2MRAhweAJ9vKXXoCNZ88IUUKYQ1vtqyCzdlzACdETgU
IZPT3O/IZRsZfIfi6jaZaJ4=
=4oXw
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
