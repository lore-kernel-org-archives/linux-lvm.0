Return-Path: <jackmc-linux-lvm@lorentz.com>
From: "Jack McKinney" <jackmc-linux-lvm@lorentz.com>
Date: Thu, 7 Jun 2001 10:43:02 -0500
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
Message-ID: <20010607104301.A29848@stocks.pillory.com>
References: <20010605210727.C1870@pc.ilinx> <3B1F9E1C.1984FAF8@wrkhors.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline
In-Reply-To: <3B1F9E1C.1984FAF8@wrkhors.com>; from lembark@wrkhors.com on Thu, Jun 07, 2001 at 10:30:36AM -0500
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

--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Big Brother tells me that Steven Lembark wrote:
>=20
> Use separate mount points for /var, /usr & /home.  This keeps
> root down to mainly /etc, /dev, /bin, /sbin and /lib -- none of=20
> which is all that enormous.  Short of writing the File From Hell
> to /tmp a 128MB root file system works well enough for me.  I do
> put /usr & /opt on LVM but only because all the tools needed to
> revive the system are in /bin, /sbin & /lvm on the root.

    After installation, do:

cd / ; mv tmp tmp.old ; ln -s /var/tmp .
reboot
rm -rf /tmp.old

    Now you don't have to worry about root filling up at all...

--
"Aluminum foil makes a wonderful hat and blocks     Jack McKinney
 out the government's mind-control rays."           http://www.lorentz.com
    Lt. Munch, The X-Files                          jackmc@lorentz.com
                                                    1024D/D68F2C07 4096g/38=
AEF076

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAjsfoQUACgkQimeon9aPLAfH2ACfZGvPc3f4NpJpg194a2FNTeCP
ndIAn3IUxkj4molY3zNQ1Ag++NauQ667
=OjBk
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--
