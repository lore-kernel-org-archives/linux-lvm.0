Subject: Re: [linux-lvm] file system larger than lv
Message-ID: <20021115122708.GK8377@pc.ilinx>
References: <OF1EE49BDF.AE37C6D0-ON86256C71.005578CE@TEXASMUTUAL.COM> <20021115115831.B11618@sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/pvEKOcHgREgBce"
Content-Disposition: inline
In-Reply-To: <20021115115831.B11618@sistina.com>
From: lvm@interlinx.bc.ca
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
Date: Fri Nov 15 06:28:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--J/pvEKOcHgREgBce
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2002 at 11:58:31AM +0100, Heinz J . Mauelshagen wrote:
>=20

Heinz,

> LVM1 contains the e2fsadm tool which prevents
> you form doing things like that.

I know we are never going to be able to stop everybody who _really_
wants to shoot themselves in the foot from doing so, but I wonder,
perhaps if there should be "something extra" that needs to be done to
manipulate the size of volumes with filesystems on them (i.e. probe
the lv to see what's on it) directly (i.e.  lvreduce, lvexpand).  This
would of course be used to encourage the use of the convenience tools
like e2fsadm.

Perhaps an environment variable or an "expert switch" on the command
line or something.  Not using the switch or setting the env. variable
would cause a probe of the lv and if there was found to be a
filesystem on it, it would prompt the user to use a convenience tool
(for that filesystem type) to perform his task, or set the
switch/variable, if he really wanted to go ahead.

Or maybe this is all just too much handholding.

b.

--=20
Brian J. Murrell

--J/pvEKOcHgREgBce
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE91Ogcl3EQlGLyuXARAl6zAKC0cWXUkah13j8n4bwsO+3BjgPMDgCfQOj8
U48Ewu6GGQW31bnvN0sgE+g=
=5lF1
-----END PGP SIGNATURE-----

--J/pvEKOcHgREgBce--
