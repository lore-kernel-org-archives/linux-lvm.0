Subject: Re: [linux-lvm] Lost partition table, how can I find the start of
	the PV?
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <3FC3637A.8070100@webhackande.se>
References: <1069736195.28598.76.camel@pc> <3FC3637A.8070100@webhackande.se>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-U6QaZNz0p2gmN1hs9koc"
Message-Id: <1069985665.10426.34.camel@pc>
Mime-Version: 1.0
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
Date: Fri Nov 28 08:15:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-U6QaZNz0p2gmN1hs9koc
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Just wanted to give a big shout out to Rickard...

On Tue, 2003-11-25 at 09:13, Rickard Olsson wrote:
> Brian J. Murrell wrote:
>=20
> > I am hoping somebody can suggest a tool/operation to try to recover at
> > least enough of a partition table to try to get /dev/hda3 (and hda1 and
> > hda2 if possible.
>=20
> You can try gpart: http://www.stud.uni-hannover.de/user/76201/gpart/

This did the trick!  Got all my data back, system is back in running
order and I am doing a backup as we speak.

Always answer that little voice that nags you every now and then.  :-)

b.

--=20
My other computer is your Microsoft Windows server.

Brian J. Murrell

--=-U6QaZNz0p2gmN1hs9koc
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/xq+Al3EQlGLyuXARAm26AJ4t7EGUarhjahKLSxYEu/fpWGHnvQCgiwgE
nRpQfitrfXPXNDnc9PBD744=
=D2iW
-----END PGP SIGNATURE-----

--=-U6QaZNz0p2gmN1hs9koc--
