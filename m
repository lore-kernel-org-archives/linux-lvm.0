Return-Path: <mauelshagen@sistina.com>
Date: Tue, 14 Aug 2001 15:36:24 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010814153624.B24212@sistina.com>
References: <20010811235718.A20414@linux.com> <20010812200701.A657@btconnect.com> <20010812221650.A6589@vestdata.no> <20010813100858.C362@btconnect.com> <20010814014951.H26064@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010814014951.H26064@vestdata.no>; from lvm@ragnark.vestdata.no on Tue, Aug 14, 2001 at 01:49:51AM +0200
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

On Tue, Aug 14, 2001 at 01:49:51AM +0200, Ragnar Kj=EF=BF=BDrstad wrote:
> On Mon, Aug 13, 2001 at 10:08:58AM +0100, Joe Thornber wrote:
> > > Why will liblvm disappear? To me using a library interface seems much
> > > nicer than wrapping applications.
> >=20
> > Because it's means there's yet another interface (along with the
> > command line tools, and ioctl's) to constrain any implementation
> > changes.  Command line tool interface will not change.  liblvm (if it
> > still existed as a shared library) will change drastically between 1.0
> > and 2.0 - not least because it in turn reflects the driver ioctl
> > interface.
>=20
> I'm not complaining if it's changing, but if it's going away, that's bad
> :(
>=20
> > The experimental branch has a single lvm tool, with liblvm statically
> > linked into it.  There's no need for the outside world to know about
> > liblvm.
> >=20
> > It may be a good idea for Sistina to produce a tiny 'wrap the tools'
> > library for use by gui implementors.
>=20
> yach! An uncomplete list of uglyness:
> * Errorhandling

Not much of a difference to the existing library error handling anyway.

> * fork/exec

Well, that's what the UNIX tool box is all about.
No mass fork/execs necessary.


> * having to format input arguments as strings (and quote them)

printf doesn't seem to hard to use ;-)

> * having to parse output data from strings=20

No big deal with for eg. perl.

>=20
>=20
> --=20
> Ragnar Kjorstad
> Big Storage
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
