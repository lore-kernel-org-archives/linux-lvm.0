Return-Path: <jackmc-linux-lvm@lorentz.com>
From: "Jack McKinney" <jackmc-linux-lvm@lorentz.com>
Date: Thu, 7 Jun 2001 17:15:49 -0500
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
Message-ID: <20010607171549.A13292@stocks.pillory.com>
References: <3B1FF416.F804129@wrkhors.com> <NBBBKLKHMJHIJLHOGAOJGECDIPAA.steve.wray@the.net.nz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJGECDIPAA.steve.wray@the.net.nz>; from steve.wray@the.net.nz on Fri, Jun 08, 2001 at 09:52:28AM +1200
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

--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Big Brother tells me that Steve Wray wrote:
> >=20
> > LV are generally slower than other types of storage.  Since the
> > boot partition is generally cyl 0 it's on the fastest storage
> > available (short of tmpfs). =20
>=20
> Proportionally, how much slower is it? 50%? 25%? 12%?=20
> less than 1% slower?

    Not even.  People don't realize how trivial LVM access actually are.
Suppose the OS has decided it needs to access block n of device foo. It
calls the driver to grab it.  If foo is sda1, then a read request is
scheduled (unless it is in the cache).  If foo is rootvg/usr_lv, then

1. It gets a pointer to the LE table (which it already has from the
device data when the read request is called in the lvm driver).
2. It executes a division, keeping the remainder (n divided by the
  LE size).
3. It looks up the quotient in the LE to get a real device name and
   offset.
4. It adds the remainder to the offset and calls the real low-level driver.

    In other words, every block read that goes through LVM adds basically
a division, a memory lookup and an addition.  The time it takes to transfer
the block from the drive is EONs compared to the time it takes to perform
a couple of arithmetical computations.


--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAjsf/RUACgkQimeon9aPLAfWOgCgn2kdvTbC+WQ5iHz1V5UAVZOO
7xYAoKU+IcGGx9CpxWmD3rbAIghaVL2d
=n2rY
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
