From: Wiktor Wodecki <wodecki@gmx.de>
Subject: Re: [linux-lvm] ioctl interface mismatch
Message-ID: <20030628113724.GA800@gmx.de>
References: <20030626201310.GA1042@gmx.de> <200306270849.22072.kevincorry@sbcglobal.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline
In-Reply-To: <200306270849.22072.kevincorry@sbcglobal.net>
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
Date: Mon Jun 30 09:51:05 2003
List-Id: <linux-lvm.redhat.com>
To: Kevin Corry <kevincorry@sbcglobal.net>
Cc: linux-lvm@sistina.com

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

yes I do. I wanted to play with it a bit, so I installed it. However it
cannot initalize the dm engine. So the problem is evms related?

On Fri, Jun 27, 2003 at 08:49:21AM -0500, Kevin Corry wrote:
> On Thursday 26 June 2003 15:13, Wiktor Wodecki wrote:
> > Hello,
> >
> > I am running 2.5.72 and use device-mapper to manage two vg's with
> > several lv's. However at boot-time I see the following message:
> >
> > device-mapper: ioctl interface mismatch: kernel(1.0.6), user(3.0.0),
> > cmd(0)
> >
> > 1.0.6 could be an lvm release, however, I have lvm2 metadata and not
> > lvm1. My system runs debian testing with the lvm2 utilities installed
> > (1.95.15-1). I run x86.
> >
> > Any help would be appreciated.
>=20
> The EVMS tools use version 3.0.0 of the Device-Mapper ioctl interface. Ar=
e you=20
> boot-scripts running evms_activate?
>=20
> -Kevin Corry

--=20
Regards,

Wiktor Wodecki

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+/X306SNaNRgsl4MRAloUAKCdlBwxj/LkDLKvQ2tHY4qgrNKScwCfcEqr
heF9ARVmiXVCg8v+I7UnWuA=
=5yxH
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
