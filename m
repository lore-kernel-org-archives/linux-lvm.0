Return-Path: <lewis@sistina.com>
Date: Tue, 3 Jul 2001 06:55:17 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Lost my physical volume on reboot?
Message-ID: <20010703065517.A20405@sistina.com>
References: <139803A793E0D311AFF60050DA2BC540030214D3@qtiexch1.qgraph.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <139803A793E0D311AFF60050DA2BC540030214D3@qtiexch1.qgraph.com>; from Ron.Vissers@qtiworld.com on Mon, Jul 02, 2001 at 03:53:46PM -0500
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

--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 02, 2001 at 03:53:46PM -0500, Vissers, Ron wrote:
> Hi,
> I only had one physical volume under lvm control.  Here are the results:
>=20
> (rvissers:root) /home/rvissers/lvm_uuid/uuid_fixer # ./uuid_fixer /dev/hd=
c1
> /dev/hdc1 - pv_read(): pv_create_name_from_kdev_t

Hmm...you should definitely gotten more output from the uuid_fixer program
here.  If bad UUIDs are the only problem, then you would have gotten a list
of UUIDs and a prompt asking if you wanted to write them to the PVs.  It
looks like there are deeper problems here than just the UUIDs, as Heinz said
in his reply.

> (rvissers:root) /home/rvissers/lvm_uuid/uuid_fixer # pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ERROR "pv_read(): read" reading physical volumes
>=20
> I'm thinking I either misunderstood something in the readme, or something
> else is an issue.

Regards,
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
There's nary an animal alive that can outrun a greased Scotsman.
   - Groundskeeper Willie
-----End Obligatory Humorous Quote------------------------------------------
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
665.9238429876 - Number of the Pentium Beast
-----End Obligatory Humorous Quote------------------------------------------

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7QbKlpE6/iGtdjLERAuTjAJ9nuQZEyvXKTaIle48FO5gLnUy2lgCdHTHy
V4rtly4gNW0zx67mFn1KD1M=
=+5yZ
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
