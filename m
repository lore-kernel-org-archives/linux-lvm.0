Subject: Re: [linux-lvm] cannot extend lv
Message-ID: <20030118165806.GA13554@mitethe.eudyptes>
References: <3E293C00.30406@informatik.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <3E293C00.30406@informatik.uni-erlangen.de>
From: idsfa@visi.com
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
Date: Sat Jan 18 10:57:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2003 at 11:35:28AM +0000,
Rainer.Lay@informatik.uni-erlangen.de wrote:

> I have a vg (data) with four drives /dev/sd[b-e]1
> I created a 2 stripes lv (data1) with sd[bc]1
                ^^^^^^^

You cannot extend striped lvs onto new pvs. Even on the
same physical hardware.  Once you have striped it, you are
tied to the pvs used.

If you think about it, this makes sense, as otherwise you
have some stripes containing more data than others.  In fact,
as soon as the smallest pv is full, you will not be able to
extend the lv, even if there is room in the other pvs.

If you want to have the filesystem striped over all the disks, you
will need to create a new lv which is striped across them all,
transfer the data to it, delete the old lv and then extend the
new one.

Backups highly recommended.

Michael

--=20
Think Locally, Act Globally: =20
"It's cold in here ... I'd better release a few million tons of CFCs!"

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+KYedzCEwIKHWl1kRAiiqAJ9YGnQCAomRKFzjo8eskq/J/QOskQCggOD2
diNfrUHGOL3RQK4aWodQbXQ=
=bcGO
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
