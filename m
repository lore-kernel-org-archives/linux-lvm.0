From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] Long-term snapshots possible?
Message-ID: <20030311212731.GB20134@kluge.net>
References: <200303112228.39201.jhs@openenterprise.biz> <20030311204616.GB14278@gw.silicide.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Content-Disposition: inline
In-Reply-To: <20030311204616.GB14278@gw.silicide.dk>
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
Date: Wed Mar 12 15:02:04 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2003 at 09:46:16PM +0100, jon+lvm@silicide.dk wrote:
> > My problem is, this does not currently look possible without a severe=
=20
> > performance hit.  If a volume has, for example, five active snapshots,=
=20
> > then the deltas seem to get written five times, once per snapshot volum=
e.
>=20
> How would you not do that ? You have to store the snapshots some how.

It would be similar to netapp's snapshots.  the active data blocks are
shared with the snapshots until a change occurs in active, then active
gets a new block and all the snapshots keep sharing the old block. :)
Very fast, and low space usage.

"Mmmm, WAFL ...  <gargle gargle>" -- Homer Simpson, IT Manager   ;)

--=20
Randomly Generated Tagline:
"To win, you must treat a pressure situation as an opportunity to succeed,
 not an opportunity to fail." - Gardner Dickinson

--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+blTDAuOQUeWAs2MRAs96AKCEHWDLbCakRHzNOlIJ+IjgUHhqyQCggKkc
yT20ypTResWzgNkvdTr5qWc=
=vbnK
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--
