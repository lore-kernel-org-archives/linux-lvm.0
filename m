From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] vgchange -ay at boot?
Message-ID: <20021206185238.GC11389@kluge.net>
References: <Pine.A41.4.43.0212061232410.36766-100000@hera.itg.uiuc.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Content-Disposition: inline
In-Reply-To: <Pine.A41.4.43.0212061232410.36766-100000@hera.itg.uiuc.edu>
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
Date: Fri Dec  6 12:52:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2002 at 12:36:06PM -0600, Alexander Lazarevich wrote:
> complains about trying to mount an unknown device. obviously it cant see
> the device im trying to mount because the volume group is not activated.
> so, i put vgchange -ay homevg in my /etc/rc.local file, but apparently
> that happens after the mounting on bootup, because it still complains
> about non-existant device.
>=20
> how do i turn on the volume group before it mounts the devices on bootup?

7.3 has two vgchange commands in rc.sysinit.  It does it once, then
enables MD devices, and does it again.  I mount LVs via fstab all the
time without any issue.

--=20
Randomly Generated Tagline:
"If God didn't want us to eat animals, He wouldn't have made them from
 meat." - Neill Carter

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE98PH2AuOQUeWAs2MRAg/jAKCHSpsjXHFxXnNkhQgOWh8oo6rhWQCgt6hl
SdAEnCrey6Wl91nW8yj01aA=
=oMl5
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
