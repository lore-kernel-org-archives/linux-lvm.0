From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Red Hat Advanced Server + LVM
Message-ID: <20030620180553.A31281@sistina.com>
References: <1056102632.7379.35.camel@lupin> <20030620130234.A29677@sistina.com> <1056122994.7379.146.camel@lupin>
Mime-Version: 1.0
In-Reply-To: <1056122994.7379.146.camel@lupin>; from geoff.dolman@cimr.cam.ac.uk on Fri, Jun 20, 2003 at 04:29:54PM +0100
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
Date: Fri Jun 20 11:20:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Fri, Jun 20, 2003 at 04:29:54PM +0100, Geoff Dolman wrote:
> On Fri, 2003-06-20 at 12:02, Heinz J . Mauelshagen wrote:
> > On Fri, Jun 20, 2003 at 10:50:32AM +0100, Geoff Dolman wrote:
> > > Hi
> > >=20
> > > I am soon to take delivery of a new Server: It's configuration is t=
o be
> > >=20
> > > 584GB disk (hardware raid5) 4 cpu (with Intel hyperthreading)
> > >=20
> > > 32 GB RAM
> > >=20
> > >=20
> > > I intend to use RH Advanced Server 2.1 (whatever the latest kernel =
is at
> > > time of install).
> > >=20
> > > I would ideally like to be able to snapshot dump this machine (the
> > > largest partition will use most of the available disk space (4-500G=
B)).
> > >=20
> > > Is there any caveat or issue that I should be aware of with lvm in =
this
> > > configuration?
> >=20
> > Snapshots trigger a virtual memory problem with highmem enabled in ke=
rnel 2.4 :(
> >=20
> > The snapshot exception tables hold in RAM can grow quite big in case
> > of large snapshot sizes (which you might not need in case your filesy=
stem(s)
> > are not heavily updated during the lifetime of the snapshot).
> >=20
>=20
> Hi Heinz
>=20
> What do you recommend I do?

Because of the highmem problems which are not fixed in 2.4.21
TTBOMK (and I am afraid they won=C4t be before 2.6), you can run
snapshots without highmem enabled only, which for obvious
reasons can't be an option you prefer ;)

> What is (if any) the largest filesystem I
> can snapshot in this set-up?

Depends on your memory load and fs update ratio during a snapshots lifeti=
me.
With 1GB of RAM used only, that would be up to ~512GB snapshot size (roug=
hly
calculated) presuming you could use have of your RAM for the memory resid=
ent
snapshot excpetion table and go with 32k snapshot chunk size.

The ~512GB are the upper limit of changes to the original LV (which is a =
lot).

As a rule of thumb, you can calculate with ~5% changes to your original L=
V,
which means you'ld need a ~100GB snapshot for a 2TB original LV.

>=20
> --=20
> Geoff Dolman <geoff.dolman@cimr.cam.ac.uk>
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
