Return-Path: <lewis@sistina.com>
From: lewis@sistina.com
Date: Mon, 29 Jan 2001 08:39:56 -0600
Subject: Re: [linux-lvm] [CVS LVM Mon Jan 29 16:18:57 EST 2001] Device /dev/hdc1 doesn't exist
Message-ID: <20010129083956.A20423@sistina.com>
References: <20010128234206.D17449@sistina.com> <Pine.LNX.4.21.0101291657550.31555-100000@mordor.parrish.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0101291657550.31555-100000@mordor.parrish.org.au>; from dparrish@excido.com on Mon, Jan 29, 2001 at 04:59:21PM +1100
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

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Did you patch the kernel you are using with the patch generated in PATCHES?
If not, read the README found in that directory, run make in that directory,
and apply the patch generated.  The version of the LVM modules in the
current kernel are _not_ up to date and do not work with the current tools.
We are working on getting this fixed, but for now you need to patch the
kernel yourself.

On Mon, Jan 29, 2001 at 04:59:21PM +1100, David Parrish wrote:
> On Sun, 28 Jan 2001 lewis@sistina.com wrote:
>=20
> > On Mon, Jan 29, 2001 at 04:25:43PM +1100, David Parrish wrote:
> > > I'm trying to get LVM going for the first, time.. I'm getting a few
> > > errors, I've looked through the FAQs and can't find anything about th=
ese.
> > >=20
> > > If this is a really stupid commonly found problem and it's just a stu=
pid
> > > luser doing it, please point me in the appropriate manual, otherwise,
> > > any help would be appreciated.
> > >=20
> > > LVM CVS checked out today Mon Jan 29 16:18:57 EST 2001
> >=20
> > Looks to me like you didn't check out the CVS with the LVM_0-9-patches =
tag.
> > Use 'cvs co -r LVM_0-9-patches LVM' and see if it does the same thing. =
 This
> > is documented on the CVS checkout instructions page at
> > http://www.sistina.com/Pages/cvs.html
> > If you didn't specify the tag you got a combination of Cluster LVM and =
the
> > old 0.9 stuff...which is pretty broken at this time.
> >=20
> > Regards,
> >=20
>=20
> You're right! I didn't include that tag. However, I still get the same
> messages when I checkout and recompile with that tag.
>=20
> I forgot to include this in my script, don't know if it helps.
> By the way, I'm using devfs, which I am assuming is causing my problems?
>=20
> [root@mordor LVM]# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ERROR "pv_read(): PV identifier invalid" reading physical volum=
es
>=20
> --=20
> David Parrish
> Brainbench MVP for Linux
> http://www.brainbench.com/
>=20
> All men are mortal.  Socrates was mortal.  Therefore, all men are Socrate=
s.
>                 -- Woody Allen
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Computer Science: solving today's problems tomorrow.
-----End Obligatory Humorous Quote------------------------------------------

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6dYC8pE6/iGtdjLERAtA9AJ44+yguvNmT4cjA7mcXGcqznrPdyQCePakg
4OsPhqA5dhWBAsi7r2RAvj8=
=nl13
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
