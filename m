Subject: Re: [linux-lvm] Reducing the size of a physical volume
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <sf9016d7.065@greyhound.com>
References: <sf9016d7.065@greyhound.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-6jF+Mv4GuJxd4C78E7Dg"
Message-Id: <1066656685.27744.23.camel@pc>
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
Date: Mon Oct 20 08:42:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com
Cc: clacour@greyhound.com

--=-6jF+Mv4GuJxd4C78E7Dg
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-10-17 at 17:20, Charles Lacour wrote:
>=20
> I wanted to check out Mandrake 9.2,

Good idea.  :-)

> so I set up a "mandrake"
> logical volume, but Mandrake doesn't seem to support LVM

[ disclaimer: I have not gone through an "installation" of 9.2 yet --
all of my systems were 9.1 which I just urpmi --auto-select upgraded
after reconfiguring the sources -- but unless anything has changed since
9.1, my comments should be accurate ]

It sure does!  Diskdrake has supported creating PVs, VGs and LVs for
quite a few releases now but not creating / as an LV.  As of the last
release or two, I submitted enhancements to the installer to allow
installation onto a root LV.

Did you choose "Expert" installation, or choose the "Advanced" mode when
you got into Diskdrake?  You likely need to do that to see the LVM
options.

> (at least not installing to it - it did recognize what the partition
> was, and even how full it was, but didn't give me any way to
> select an individual logical volume within it.)

Hmmm.  I have not tried exactly what you are trying to do, but knowing
what I do about Diskdrake, I can't see why what you are doing
won't/wouldn't work.

> I'm not subscribed to the list, so please CC any replies to:
>=20
> clacour (at-sign) greyhound.com

You sure do put up enough hoops one has to jump through to help you out
don't you?  If you want help with something the least you could do is
make it easy and straightforward to provide it.

b.

--=20
My other computer is your Microsoft Windows server.

Brian J. Murrell

--=-6jF+Mv4GuJxd4C78E7Dg
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/k+Otl3EQlGLyuXARAt5YAKCmZoLxmQETWmGgJsQjTq8Utla8iACg5EB6
YfLG3NKYkPZ6YILDun+DIM8=
=oJ6g
-----END PGP SIGNATURE-----

--=-6jF+Mv4GuJxd4C78E7Dg--
