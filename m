From: Adam McDaniel <adamm@array.org>
Subject: Re: [linux-lvm] accidently formatted a physical volume...
Message-ID: <20020819205005.GA26781@grimlock>
References: <20020819192319.GB25631@grimlock> <284650000.1029786116@[192.168.200.4]> <1265620671.20020819224124@tnonline.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
In-Reply-To: <1265620671.20020819224124@tnonline.net>
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
Date: Mon Aug 19 15:50:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2002 at 10:41:24PM +0200, Anders Widman wrote:
>=20
> >> Or, is there any way that I can fix/restore the formatted drive?
>=20
> > Not at the *NIX level. If the data were SERIOUSLY valuable
> > it can be recovered by physical means. Short of that I'd
> > say it's time to reach for your tapes...

The unfortunate thing was that timing couldn't have been worse. The
last backup I made before the incident would only contain a fraction
of the info that I actually need. Partly my fault, I know, but being
able to restore the drive would be the goal.

> Are you sure? The data should be there in the co-worker did not make a
> "full" (zeroing blocks) format. Is it not possible to restore the LVM
> headers (or what it is called) on that drive?

I do know that it was a straight simple format, literally
'mkfs.ext2 /dev/hdb', so I know the info is still there. My experience
in this is rather limited, so I'm not sure of the best way to fish it
out.

--=20
Adam McDaniel
Array Networks
Calgary, AB, Canada

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9YVn9IHy9fg7fMMMRAtbzAJwJRn7rcun0oeQAVs9GcAznBUnS3wCfYRtL
YBMU6EOu1Md+LDX6duoQxPg=
=ieYx
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
