From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] Re: LVM ext3 support
Message-ID: <20031017194633.GM20846@lug-owl.de>
References: <3F903230.9070608@siue.edu> <yw1xptgvk92l.fsf@users.sourceforge.net> <3F903945.6090109@backtobasicsmgmt.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y3ecpypBRByfLhcx"
Content-Disposition: inline
In-Reply-To: <3F903945.6090109@backtobasicsmgmt.com>
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
Date: Fri Oct 17 15:02:19 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--y3ecpypBRByfLhcx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-10-17 11:47:33 -0700, Kevin P. Fleming <kpfleming@backtobasics=
mgmt.com>
wrote in message <3F903945.6090109@backtobasicsmgmt.com>:
> What is the recommended procedure for doing snapshots of journalling=20
> filesystems? Do the filesystems have to support snapshots directly and=20
> "quiesce" themselves while the snapshot is being created?

Either mount the filesystem read-only (or unmounted at all) or patch
your kernel to tell the fs driver when a snapshot is taken...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--y3ecpypBRByfLhcx
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/kEcZHb1edYOZ4bsRAnFIAKCDrFSYeJRinLC7dsJFNtRjL3OhsACdFjvC
wFbFX8J73zkkjs/NblRkBBc=
=utzD
-----END PGP SIGNATURE-----

--y3ecpypBRByfLhcx--
