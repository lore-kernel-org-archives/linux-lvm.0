From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] LVM2 compilation problem
Message-ID: <20031016143702.GA15657@antimony.eng>
References: <1066307106.1480.59.camel@pc112b.fzu.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <1066307106.1480.59.camel@pc112b.fzu.cz>
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
Date: Thu Oct 16 10:48:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2003 at 02:25:06PM +0200, Jan =C5=A0vec wrote:
> I'm having trouble compiling the LVM2 ver. 2.2.00.07. During make
> install I receive this error:
>=20
> device/dev-io.c: In function `dev_get_size':
> device/dev-io.c:215: `BLKGETSIZE64' undeclared (first use in this
> function)
> device/dev-io.c:215: (Each undeclared identifier is reported only once
> device/dev-io.c:215: for each function it appears in.)
> make[1]: *** [device/dev-io.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make[1]: Leaving directory `/root/LVM2.2.00.07/lib'
> make: *** [lib] Error 2
>=20
> The kernel is 2.6.0 test6. I also tried to make the link
> /usr/src/linux-2.6.0-test6/include/linux -> /usr/include/linux, but then
> I receive another error message:

<snip>

> Anyone have any idea how to solve this problem ?

The quickest and easiest way i can think of is to grab a 2.4.22
kernel, untar it, and link that include/linux directory into your
/usr/include/ dir.  As you saw, 2.6 doesn't allow kernel headers to be
used in userspace, but 2.4 still does.  It's ugly, but it works.

Regards,
--
AJ Lewis
Sistina Software Inc.             http://www.sistina.com
720 Washington Ave, Suite 200     Voice:  612-638-0500
Minneapolis, MN 55414             E-Mail: lewis_NOSPAM_(AT)sistina(DOT)com

Current GPG fingerprint =3D B8F8 CEC8 9B0B B169 C5E2  8589 867E 54C8 4984 3=
813
Grab the key at: http://people.sistina.com/~lewis/gpg.html or one of the
many keyservers out there...


--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/jq0Ohn5UyEmEOBMRAgyCAJ9ORQi9SfL6E/A6qSzop9gwqUmy9QCfZhg9
21RZGh9ybeus5X+620I1kf0=
=4cf9
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
