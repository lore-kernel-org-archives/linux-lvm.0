Return-Path: <lewis@sistina.com>
Date: Fri, 19 Jan 2001 10:06:42 -0600
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Kernel panic while snapshotting.
Message-ID: <20010119100642.J23203@sistina.com>
References: <Pine.LNX.4.30.0101190750570.27286-100000@beefcake.hdqt.valinux.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9pltayyoy9lWEMH"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0101190750570.27286-100000@beefcake.hdqt.valinux.com>; from jweber@valinux.com on Fri, Jan 19, 2001 at 07:56:26AM -0800
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

--M9pltayyoy9lWEMH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Which kernel were you using?  2.2.18 or 2.4.0?

On Fri, Jan 19, 2001 at 07:56:26AM -0800, Jay Weber wrote:
> Hi,
>=20
> I just got a kernel panic while snapshotting with 0.9.1beta2.  I wonder if
> anybody has seen any similar issues or I possibly fubar'd the patch on my
> end?
>=20
> Panic was:
>=20
> 	Kernel panic: brw_kiovec: iobuf not locked for I/O
>=20
> This occured while simultanously copying 20 tarballs back and forth
> between two dirs on the source volume and performing a snapshot at that
> time.  It appears to have hung my lvcreate (snapshot) command shell.
> Oh, this was also using loop device for the source volume on my laptop in
> this case.  Hmm, actually could this panic be related to the following
> change in lvm.c?  It did work prior in 0.9.1beta1.
>=20
> @@ -492,7 +488,7 @@
>                 goto out;
>=20
>         err =3D -ENOMEM;
> -       iobuf->locked =3D 1;
> +       iobuf->locked =3D 0;
>         iobuf->nr_pages =3D 0;
>         for (i =3D 0; i < nr_pages; i++)
>         {
>=20
>=20
> I haven't seen this one before myself, but in testing on our bigger scsi
> based boxes in the back while snapshots are active and heavy IO is
> performed on the source volume, the box tends to hang.  I gather this is
> related to having to journal all source volume changes to the snapshot and
> when you throw massive IO at it, things get slow. Any thoughts on this one
> as well?
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
Over and over I find being redundant is key to success
in the art of redundancy - Jay Armstrong
-----End Obligatory Humorous Quote------------------------------------------

--M9pltayyoy9lWEMH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6aGYSpE6/iGtdjLERAubdAJ0UUxRygNOPoTssl/MJtv+D8jYdmQCfTx5c
ICXG+BN97vpLz7ExZxz1Sbw=
=ptt9
-----END PGP SIGNATURE-----

--M9pltayyoy9lWEMH--
