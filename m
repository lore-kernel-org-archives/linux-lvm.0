From: Tracy R Reed <treed@copilotconsulting.com>
Subject: Re: [linux-lvm] device-mapper ioctl cmd 2 failed: Invalid argument
Message-ID: <20030923211832.H30238@copilotconsulting.com>
References: <20030920185757.A9590@copilotconsulting.com> <20030923131147.P2155@uk.sistina.com> <200309230924.44185.kevcorry@us.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="SUk9VBj82R8Xhb8H"
Content-Disposition: inline
In-Reply-To: <200309230924.44185.kevcorry@us.ibm.com>; from kevcorry@us.ibm.com on Tue, Sep 23, 2003 at 09:24:44AM -0500
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
Date: Wed Sep 24 08:01:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--SUk9VBj82R8Xhb8H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2003 at 09:24:44AM -0500, Kevin Corry spake thusly:
> On Tuesday 23 September 2003 07:11, Alasdair G Kergon wrote:
> > On Sat, Sep 20, 2003 at 06:57:57PM -0700, Tracy R Reed wrote:
> > > I think I've got the latest everything:
> > > home:~# lvdisplay --version
> > >   Driver version:  1.0.6
> > >
> > > I've got the latest 2.6, the latest devmapper, the latest lvm userland
> > > tools from sistina... But snaps still don't work.
> >
> > Firstly, there's some versioning mix-up here, because the driver
> > in the 2.6 kernels is not 1.0.6.
> > Secondly, snapshots are not available under 2.6 yet, though the
> > implementation work is well-advanced.
>=20
> Actually, if he didn't select the "ioctl interface version 4" option in t=
he=20
> kernel config, it will be version 1.0.6.

Ah, I didn't notice that config option or recognize the implications of
it. No snapshots in 2.6 eh? That's unfortunate. I keep trying to find a
working configuration with which to take snapshots and keep coming up
short. I guess I'll just have to wait a while longer. Thanks for the info!

--=20
Tracy Reed
http://copilotconsulting.com

--SUk9VBj82R8Xhb8H
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj9xGxgACgkQ9PIYKZYVAq099gCfT5IWpgt0j5O/9yc6aQ3vbbTH
7H0An2sLlc36qeCSzsBjwbmICKVqZMvG
=Cbog
-----END PGP SIGNATURE-----

--SUk9VBj82R8Xhb8H--
