Return-Path: <hopper@omnifarious.mn.org>
Date: Sun, 18 Mar 2001 23:20:12 -0600
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] Apparent performance degradation for each PV with striping
Message-ID: <20010318232012.A1169@omnifarious.mn.org>
References: <3AB59501.FF6ED9F3@dataventures.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <3AB59501.FF6ED9F3@dataventures.com>; from dlt@dataventures.com on Sun, Mar 18, 2001 at 10:11:29PM -0700
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

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 18, 2001 at 10:11:29PM -0700, Donald Thompson wrote:
> I started playing with iostat tonight and saw a few things I didn't
> really expect to see.
>=20
> I've got a volume group consisting of 4 82 gig drives. All 4 are IDE
> drives.  Reading directly from the raw device, a PV in this case, with
> something like
>=20
> dd if=3D/dev/ide/host0/bus0/target0/lun0/disc of=3D/dev/null

	Have you played with hdparm to try to tune the way the kernel
talks to your IDE drives?

	That may be the reason for being CPU bound.  The kernel tends to
default to the slowest possible method because there are a lot of bad
IDE controllers and drives out there that will trash your data if you
try to talk to them in a way they aren't expecting.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6tZcMG4QeWBeRdS8RAryAAKCrm7DIUXD5rVXyPV8HxNFRe1ZD0ACfcROz
QZUWAsGGagv8FiAfdMvCv1U=
=6GEJ
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
