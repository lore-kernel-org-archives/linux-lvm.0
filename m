Date: Thu, 23 Aug 2001 22:40:34 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM, rawio, ext2?
Message-ID: <20010823224034.B17378@sistina.com>
References: <20010823014012.A32700@greenhydrant.com> <20010823204905.B920@dardhal.mired.net>
Mime-Version: 1.0
In-Reply-To: <20010823204905.B920@dardhal.mired.net>; from jdomingo@internautas.org on Thu, Aug 23, 2001 at 08:49:05PM +0000
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Thu, Aug 23, 2001 at 08:49:05PM +0000, Jos=E9 Luis Domingo L=F3pez wro=
te:
> On Thursday, 23 August 2001, at 01:40:12 -0700,
> David Rees wrote:
>=20
> > Hi,
> >=20
> > I'd like to create an ext2 filesystem over a raw io device, is this e=
ven
> > possible?  (If not, skip the rest of this message! ;-)
> >=20
> Maybe I'm completely wrong (as usual :), but as far as I know you can
> either create a filesystem over any block device (e.g. partition, md, L=
V,
> etc.) and use it as usual, or bind a raw device to an existing block
> device, and let the application (e.g. Oracle) manage space on the devic=
e
> as it wants.

Correct.

You can't run a filesystem on a raw device.

>=20
> Greetings,
>=20
> --=20
> Jos=E9 Luis Domingo L=F3pez
> Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB R=
AM)
> =20
> jdomingo EN internautas PUNTO org  =3D> =BF Spam ? Atente a las consecu=
encias
> jdomingo AT internautas DOT   org  =3D> Spam at your own risk
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--=20

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
