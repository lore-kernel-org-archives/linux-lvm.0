Return-Path: <julien@atix.de>
Message-ID: <3B610FFE.87BC62C4@atix.de>
Date: Fri, 27 Jul 2001 08:53:50 +0200
From: Julien Baboud <julien@atix.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pb with pvcreate and partition tables
References: <3B5D127D.E932FDD1@atix.de> <20010724163800.B19059@sistina.com>
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

"Heinz J . Mauelshagen" wrote:
> =

> Julien,
> =

> hda16 =3D=3D hdb?

no.
here is the output of 'fdisk /dev/hda -l

Festplatte /dev/hda: 255 K=F6pfe, 63 Sektoren, 1247 Zylinder
Einheiten: Zylinder mit 16065 * 512 Bytes
 =

    Ger=E4t Booten  Anfang      Ende   Bl=F6cke   ID  Dateisystemtyp
/dev/hda1             1       255   2048256    7  HPFS/NTFS
/dev/hda2   *       256       268    104422+  83  Linux
/dev/hda3           269       530   2104515   83  Linux
/dev/hda4           531      1247   5759302+   5  Erweiterte
/dev/hda5           531       563    265041   82  Linux (Auslagerung)
/dev/hda6           564       576    104391   8e  Linux LVM
/dev/hda7           577       589    104391   8e  Linux LVM
/dev/hda8           590       602    104391   8e  Linux LVM
/dev/hda9           603       615    104391   8e  Linux LVM
/dev/hda10          616       628    104391   8e  Linux LVM
/dev/hda11          629       641    104391   8e  Linux LVM
/dev/hda12          642       654    104391   8e  Linux LVM
/dev/hda13          655       667    104391   8e  Linux LVM
/dev/hda14          668       680    104391   8e  Linux LVM
/dev/hda15          681       693    104391   8e  Linux LVM
/dev/hda16          694       706    104391   8e  Linux LVM
/dev/hda17          707       719    104391   8e  Linux LVM
/dev/hda18          720       732    104391   8e  Linux LVM
/dev/hda19          733       745    104391   8e  Linux LVM
/dev/hda20          746       758    104391   8e  Linux LVM    =


> =

> Something with your /dev setup looks strange.

 sure, there is something wrong but what ?
 i must add something : /dev/hda16 is the only partition with wich i had
apply the 'mkfs.ext2' command when it was of Linux type (and not LVM).
But since i have rebooted it is the only partition with wich i have
problems :

 any idea how to overide the partition table ? (see the output of the
pvcreate command below)
 thanks for your help.

> =

> On Tue, Jul 24, 2001 at 08:15:25AM +0200, Julien Baboud wrote:
> > hi,
> >
> >  I use LVM with the 0.9 beta 7 on a SuSE 7.1 distrib and
> >  i've encoutered a pb with pvcreate on a partition that is set to the=

> > LVM type (and was another type before, which is the source of the pb)=
=2E
> > Here is
> > the output of the command i used :
> >
> >  %pvcreate /dev/hda16
> >
> >  pvcreate -- device "/dev/hda16" has a partition table
> >  pvcreate [-d|--debug] [-f[f]|--force [--force]] [-h|--help] [-y|--ye=
s]
> >          [-v|--verbose] [-V|--version] PhysicalVolume
> > [PhysicalVolume...]
> >
> >
> > and the -f option show me the same output.
> >
> >  I don't know if it's a pb with LVM or with fdisk wich i use to set t=
he
> > type of the partitions, but i would appreciate if any could tell me a=

> > solution to correct this.
> >
> >
> >  tanx.
> >  julien, for ATIX
> >
> >  join the LVM Republic
> > ------------------------
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> =

> --
> =

> Regards,
> Heinz    -- The LVM Guy --
> =

> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
> =

> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-
> =

> Heinz Mauelshagen                                 Sistina Software Inc.=

> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
