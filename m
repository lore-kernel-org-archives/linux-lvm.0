Return-Path: <chewie@wookimus.net>
Date: Sat, 3 Feb 2001 15:29:53 -0600
From: ^chewie <chewie@wookimus.net>
Subject: Re: [linux-lvm] Maximum # of PEs Per PV
Message-ID: <20010203152953.C20708@wookimus.net>
References: <20010131222537.B24922@wookimus.net> <Pine.LNX.4.21.0102021133080.15143-100000@miami.datech2.er.heitec.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0102021133080.15143-100000@miami.datech2.er.heitec.net>; from Holger.Rauch@heitec.de on Fri, Feb 02, 2001 at 11:34:35AM +0100
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

--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 02, 2001 at 11:34:35AM +0100, Holger Rauch wrote:
> Hi!
>=20
> On Wed, 31 Jan 2001, ^chewie wrote:
>=20
> > Why didn't you just use the whole disk partitionless?  Zero out the
> > first 512b and do a pvcreate on /dev/hdf, /dev/hdg, /dev/hdh.
>=20
> Thanks a lot for this hint, but what's the advantage compared to creating
> a partition of type 8e?

I'm not a harddrive guru, so I'm not really qualified to give you a
technical reason other than, "Why waste 512 bytes?"  I like to
operate under the principle of Occam's Razor, or the principle of
simplicity.  It's latin and heady, but the way it is known to me is
this: "The simplest answer is most likey the correct one."

There are others on the list that may be able to give you a more heady
technical answer.

--=20
Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
http://www.wookimus.net/                            | s.k.a. gunnarr
Key fingerprint =3D B4AB D627 9CBD 687E 7A31  1950 0CC7 0B18 206C 5AFD


--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6fHhRDMcLGCBsWv0RAuhpAJwOx58oWp61PYeN1JxU7rYw+CcS9ACfeWUu
flrlwHRYe/9eq9PCZQzg8zM=
=N+Sq
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--
