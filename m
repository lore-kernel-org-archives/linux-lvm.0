Return-Path: <root@srv.sistina.com>
Date: Wed, 30 May 2001 11:33:50 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Solution? found backup hexdump of partition's first MB
Message-ID: <20010530113350.D30938@sistina.com>
References: <20010529010628.E1971@jensbenecke.de> <20010529093436.A792@jensbenecke.de> <20010529202030.A700@jensbenecke.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010529202030.A700@jensbenecke.de>; from lvm@jensbenecke.de on Tue, May 29, 2001 at 08:20:30PM +0200
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

On Tue, May 29, 2001 at 08:20:30PM +0200, Jens Benecke wrote:
> On Tue, May 29, 2001 at 09:34:36AM +0200, Jens Benecke wrote:
> > On Tue, May 29, 2001 at 01:06:28AM +0200, Jens Benecke wrote:
> > > Hello,
> > > I upgraded to 2.2.4 (0.9.1-beta2) from 2.2.18 (LVM 0.9) and this seem=
s to
> > > have killed one of my PVs. I tried the 0.9 utilities and updated to
> > > 0.9.1-beta7 when I noticed the problems. No change. Booting back to 2=
.2.18
> > > didn't help, the PV was gone there as well.
> > follow-up:
> > vgcfgrestore doesn't work, because LVM thinks my hdc1 is no PV. Here's =
the
> > output: (...)
>=20
> I think I found a way: I have found a hex-dump backup of the first megaby=
te
> of the disk in - apparently - working order.
>=20
> So: hdc1 was the broken PV, it's the only partition on hdc, and I have a
> file called hdc-first-MB-hexdump.
>=20
> Does this help? ;)

Yes, in case it really contains the needed actual copy.


>=20
> The question is, does this already contain file system data or is this
> still all LVM structure data?

If it is just a MB -> unlikely, because LVM typically reserves more
than that for the VGDA.

*But* to be really sure, run "pvdata -PP" on the hex dump and look
for pe_on_disk.base + pe_on_disk.size. This will give you the
actual end (in 512 byte units) of the metadata in the file and should
be used to dd it back to disk.


> I'm quite sure that the LVM structure didn't
> change since this file was created, only (of course) the data changed on
> the filesystem contained in the one (single) LV on data=3D(hdc1,hda1).

See above: you *need* to be sure. Hopefully the pvcreate/vgcfgrestore pair
           works for you.

>=20
>=20
> --=20
> Jens Benecke             /* Nobody will ever see this error message :-) */
>                             panic("Cannot initialize video hardware\n");
>                                   -- Linux 2.0.38,  arch/m68k/atari/atafb=
.c
> http://www.hitchhikers.de/ - Die kostenlose Mitfahrzentrale f=EF=BF=BDr g=
anz Europa
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
