Return-Path: <lewis@sistina.com>
Date: Mon, 18 Jun 2001 13:00:41 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Re: another nice feature for packagers ...
Message-ID: <20010618130041.A17421@sistina.com>
References: <Pine.LNX.4.33.0106181808530.27064-100000@falka.mfa.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0106181808530.27064-100000@falka.mfa.kfki.hu>; from dice@mfa.kfki.hu on Mon, Jun 18, 2001 at 06:09:25PM +0200
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

--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2001 at 06:09:25PM +0200, Gergely Tamas wrote:
>  > No problem, I'm still trying to decide if we should move ${DESTDIR} in=
to the
>  > individual 'install' targets or not...
>=20
> Thats a good question. :) I tried your version, and it worked well. The
> location of the configuration files is defived in a header file, so this
> is not a problem. The static links worked also well...

I moved it into the install targets.  My commit message explains why.

>  > Hmm...I think it should be the other way around.
>=20
> Yes, I thought about this version too... It doesn't metter which one you
> choose, as long as there are separate definitions for static and shared
> libraries, I think. So they have not to be moved manually...

It's in.

>  > Just FYI, the entire build system is going to get an overhaul after th=
e 1.0
>  > release, so I will definitely be making sure these detail are kept in =
mind
>  > for that.
>=20
> Which will be released this wednesday as I can remember, right?

I believe that's the plan.

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
"Memory is like gasoline. You use it up when you are running. Of
course you get it all back when you reboot..."; Actual explanation
obtained from the Micro help desk.
-----End Obligatory Humorous Quote------------------------------------------

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7LkHJpE6/iGtdjLERAm2QAJ44JDLCeA0hmX0LfyKSclwDWXFBbACeK0gl
j0P8DuJ+vkJ5FQ85cBP2tHg=
=dYUt
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
