From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Whole Disk Usage with LVM ...
Message-ID: <20021119194432.GB13531@antimony.sistina.com>
References: <2D92FEBFD3BE1346A6C397223A8DD3FC092096@THOR.goeci.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <2D92FEBFD3BE1346A6C397223A8DD3FC092096@THOR.goeci.com>
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
Date: Tue Nov 19 13:41:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2002 at 02:26:59PM -0500, Murthy Kambhampaty wrote:
> On Sat Nov 16 20:07:02 2002, Goetz Bock  linux-lvm@sistina.com wrote:
> >On Sat, Nov 16 '02 at 14:46, david@lownoisefloor.com wrote:
> >> I am using entire disks. =20
> >Bad idea, why don't you want to at last put a partition table on it,
> >with one big partition, that uses the whole disk ... or is this what you
> >had in mind?
> Err, is there a reason why this is a bad idea?=20

Well, the only thing i can think of is that the partition must be of type
8e (Linux LVM), while the whole disk only has the LVM label on it - so if
you aren't paying attention, you could (possibly) forget that the disk is
being used by LVM and write over it.  fdisk does not recognize that a whole
disk has an LVM label on it AFAIK.
=20
> (The HOWTO actually gives the example of
> # pvcreate /dev/hdb
> without saying this is a bad idea; or a good one, for that matter.)=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              E-Mail: lewis@sistina.com
Minneapolis, MN 55414
http://www.sistina.com

Current GPG fingerprint =3D FE77 4B43 6A9B F982 A731  02FA 2BF5 7574 294A A=
A5A
Grab the key at: http://people.sistina.com/~lewis/gpg.html or one of the
many keyservers out there...
-----Begin Obligatory Humorous Quote----------------------------------------
Bad command or file name. Bad, bad command! Sit! Stay! Staaaay...
-----End Obligatory Humorous Quote------------------------------------------

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE92pSgK/V1dClKqloRAgpGAKCzhrhSUj5kUAafQdCcIF0kI71hvQCfRW9m
Vv4liFjSXCVAlanApQbu2sQ=
=KkSK
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
