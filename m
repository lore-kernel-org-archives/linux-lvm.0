From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] bug: raid1 sub-devices are scanned too
Message-Id: <20020223115529.A744@sistina.com>
References: <20020223015504.GA828@xulfad.ton.tut.fi>
    <20020223114712.A695@sistina.com>
MIME-Version: 1.0
In-Reply-To: <20020223114712.A695@sistina.com>; from
    mauelshagen@sistina.com on Sat, Feb 23, 2002 at 11:47:12AM +0100
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
Date: Sat Feb 23 04:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Sat, Feb 23, 2002 at 11:47:12AM +0100, Heinz J . Mauelshagen wrote:
>=20
> Erkkhi,
>=20
> this is a bug in 1.0.3 with exported VGs.
>=20
> If you import your VG "mirror" again, you should be fine.
> Rather than imprting, "vgscan -f" should work as well.
>=20
> Will look into it.

Are /dev/ide/host0/bus1/target1/lun0/part1 and
/dev/ide/host0/bus0/target1/lun0/part1 really the ones making up /dev/md/=
1 ?

Regards,
Heinz    -- The LVM Guy --

>=20
> Regards,
> Heinz    -- The LVM Guy --
>=20
>=20
> On Sat, Feb 23, 2002 at 03:55:05AM +0200, Erkki Seppala wrote:
> > Whether the bugzilla is publicly open is unclear to me, atleast there
> > didn't seem to be a link there in sistina.com/lvm - or I didn't find
> > it.
> >=20
> > Actually I'm not sure if there is a real reason to fix this, as it
> > would need making vgscan understand more about the raid-stuff, but it
> > sure does look confusing. Perhaps a generic facility to "blind out"
> > devices from it? Perhaps this kind of capability should be in the
> > kernel, not just for LVM..
> >=20
> > I recently had a problem with a volume group reusing an existing
> > logical volume number, but I resolved that, as vgscan suggested, with
> > vgexport/vgimport. However, this bug appeared:
> >=20
> > vgscan -- reading all physical volumes (this may take a while...)
> > vgscan -- found active volume group "mirror"
> > vgscan -- found active volume group "ibm9"
> > vgscan -- found active volume group "archive"
> > vgscan -- found inactive volume group "mirrorPV_EXP"
> > vgscan -- ERROR: VG "mirrorPV_EXP" reuses an existing VG number; plea=
se vgexport/vgimport that VG or use option -f
> > vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> > vgscan -- WARNING: This program does not do a VGDA backup of your vol=
ume groups
> >=20
> > I imagine this is because /dev/md/1 is raid1 and consists of
> > /dev/ide/host0/bus1/target1/lun0/part1 and
> > /dev/ide/host0/bus0/target1/lun0/part1. Output of pvscan:
> >=20
> > pvscan -- reading all physical volumes (this may take a while...)
> > pvscan -- ACTIVE   PV "/dev/md/1"                               of VG=
 "mirror"       [55.91 GB / 13.89 GB free]
> > pvscan -- inactive PV "/dev/ide/host0/bus1/target1/lun0/part1"   is i=
n EXPORTED VG "mirror" [55.91 GB / 13.89 GB free]
> > pvscan -- inactive PV "/dev/ide/host0/bus0/target1/lun0/part1"   is i=
n EXPORTED VG "mirror" [55.91 GB / 13.89 GB free]
> > pvscan -- total: 6 [311.82 GB] / in use: 5 [290.79 GB] / in no VG: 1 =
[21.03 GB]
> >=20
> > (some lines removed)
> >=20
> > I run kernel 2.4.16 and LVM-tools from today's CVS.
> >=20
> > Btw, during the original repairing I saw a situation where one of my
> > volume groups (archive) was twice in /proc/lvm/global. That's not
> > healthy, is it? I imagine it had something to do with the fact that
> > after scanning volume group "archive" it failed to scan volume group
> > "mirror" (due to the reuse-problem), and I kept trying different
> > stuff..
> > =20
> > --
> >   ___________________________________________________________________=
__
> >      / __// /__ ____  __                              Erkki Sepp=E4l=E4=
\   \
> >     / /_ / // // /\ \/ //ircnet                           Modeemi Ry\=
  /
> >    /_/  /_/ \___/ /_/\_\@modeemi.fi        http://www.modeemi.fi/~flu=
x/
> >=20
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
