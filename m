Return-Path: <mauelshagen@sistina.com>
Date: Wed, 15 Aug 2001 10:58:24 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010815105824.C29693@sistina.com>
References: <20010811235718.A20414@linux.com> <20010812200701.A657@btconnect.com> <20010814150418.E6463@mail.wave.co.nz> <20010814091401.A322@btconnect.com> <20010814195022.C22309@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010814195022.C22309@vestdata.no>; from lvm@ragnark.vestdata.no on Tue, Aug 14, 2001 at 07:50:23PM +0200
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

On Tue, Aug 14, 2001 at 07:50:23PM +0200, Ragnar Kj=EF=BF=BDrstad wrote:
> On Tue, Aug 14, 2001 at 09:14:02AM +0100, Joe Thornber wrote:
> > On Tue, Aug 14, 2001 at 03:04:18PM +1200, Mark van Walraven wrote:
> > > On Sun, Aug 12, 2001 at 08:07:02PM +0100, Joe Thornber wrote:
> > > > I would much rather see people wrapping the tools than using liblvm=
, in fact
> > > > liblvm will probably disappear in the future.
> > >=20
> > > I think it is a bad idea to eliminte liblvm.  Shared libraries are mu=
ch
> > > easier use to use from programs.  For example, it is much easier in a=
 perl
> > > script to use zlib than to run gzip as a subprocess in a bulletproof =
way.
> >=20
> > I'm just worried about the interface to liblvm changing and breaking
> > tools.  Let's wait a bit to see where experimental goes, and then see
> > how much the library had to change.
>=20
> I don't understand why the library interface would need to change more of=
ten than the command
> line interface?

Because we will change the ioctl interface to the kernel to be a lot simpler
and the library will reflect this.

The CLI will stay stable though.

>=20
>=20
> --=20
> Ragnar
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
