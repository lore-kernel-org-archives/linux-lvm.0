From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pb with vgimport
Message-ID: <20020618171317.A27032@sistina.com>
References: <mnet3.1023803882.15501.sgallet@netcourrier.com> <20020618130736.C26268@sistina.com> <3D0F4889.4080704@ibourgogne.net>
Mime-Version: 1.0
In-Reply-To: <3D0F4889.4080704@ibourgogne.net>; from sgallet@ibourgogne.net on Tue, Jun 18, 2002 at 04:49:45PM +0200
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
Date: Tue Jun 18 10:33:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Tue, Jun 18, 2002 at 04:49:45PM +0200, S=E9bastien GALLET wrote:
> Thank you for your answer, but I found a solution by editing  disc and=20
> partitions with Linux Disk Editor ....
> Now, everything is ok and I found my data back.=20
>=20
> lvmvg1PV_EXPPV_EXPPV_EXP:  I exported 3 times the VG.  Is the result=20
> normal???=20

Nope :-(

Which LVM version was it?

Regards,
Heinz    -- The LVM Guy --


>=20
> It would seem that the problem comes from export (or the importation) o=
n=20
> hdk.
> .
>=20
>=20
> Heinz J . Mauelshagen wrote:
>=20
> >"lvmvg1PV_EXPPV_EXPPV_EXP" looks very strange.
> >The suffix PV_EXP should only be there once.
> >
> >Which LVM versions of the tools and driver did you use?
> >Do you remmeber the steps which lead to this situation?
> >
> >Please send a bzipped tasball which contains the output files retrieve=
d with
> >
> >for d in /dev/hd[e-g]1 /dev/hdk
> >do
> >	dd if=3D$d of=3D`basename $d`.vgda bs=3D1k count=3D4k
> >done
> >
> >to me directly <mge@sistina.com> to fix this.
> >
> >On Tue, Jun 11, 2002 at 03:58:03PM +0200, sgallet@netcourrier.com wrot=
e:
> > =20
> >
> >>Hello,
> >>I have an error when i do=20
> >>vgimport lvmvg1 /dev/hde1 /dev/hdf1 /dev/hdg1 /dev/hdk
> >>vgimport -- ERROR: wrong number of physical volumes to import volume =
group "lvmvg1
> >>
> >>This is my pvscan
> >>pvscan -- reading all physical volumes (this may take a while...)
> >>pvscan -- inactive PV "/dev/hdk"   is in EXPORTED VG "lvmvg1PV_EXPPV_=
EXPPV_EXP" [76.69 GB / 0 free]
> >>pvscan -- inactive PV "/dev/hdg1"  is in EXPORTED VG "lvmvg1PV_EXPPV_=
EXPPV_EXP" [37.27 GB / 0 free]
> >>pvscan -- ACTIVE   PV "/dev/hdh1" of VG "lvmvg2"                     =
    [74.52 GB / 55.89 GB free]
> >>pvscan -- inactive PV "/dev/hde1"  is in EXPORTED VG "lvmvg1PV_EXPPV_=
EXPPV_EXP" [38.34 GB / 0 free]
> >>pvscan -- inactive PV "/dev/hdf1"  is in EXPORTED VG "lvmvg1PV_EXPPV_=
EXPPV_EXP" [28.62 GB / 0 free]
> >>pvscan -- total: 5 [255.47 GB] / in use: 5 [255.47 GB] / in no VG: 0 =
[0]
> >>
> >>Help me please
> >>
> >>CONFIDENTIALITE :=20
> >>Ce message et les =E9ventuelles pi=E8ces attach=E9es sont confidentie=
ls.=20
> >>Si vous n'=EAtes pas dans la liste des destinataires, veuillez inform=
er l'exp=E9diteur imm=E9diatement et ne pas divulguer le contenu =E0 une =
tierce personne, ne pas l'utiliser pour quelque raison que ce soit, ne pa=
s stocker ou copier l'information qu'il contient sur un quelconque suppor=
t.
> >>
> >>-------------------------------------------------------------
> >>NetCourrier, votre bureau virtuel sur Internet : Mail, Agenda, Clubs,=
 Toolbar...
> >>Web/Wap : www.netcourrier.com
> >>T=E9l=E9phone/Fax : 08 92 69 00 21 (0,34 EUR TTC/min)
> >>Minitel: 3615 NETCOURRIER (0,15 EUR TTC/min)
> >>
> >>
> >>_______________________________________________
> >>linux-lvm mailing list
> >>linux-lvm@sistina.com
> >>http://lists.sistina.com/mailman/listinfo/linux-lvm
> >>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >>   =20
> >>
> >
> > =20
> >
>=20

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
