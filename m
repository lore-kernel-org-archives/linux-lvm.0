From: Anselm Kruis <A.Kruis@science-computing.de>
Subject: Re: [linux-lvm] Re: [lvm-devel] *** ANNOUNCEMENT *** LVM 1.1-rc1
    available at www.sistina.com
In-Reply-To: <20020317180920.A9996@sistina.com>
Message-Id: <Pine.LNX.4.02.10203201650360.28349-100000@murnau.science-computing.de>
MIME-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Date: Wed Mar 20 09:51:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Sun, 17 Mar 2002, Heinz J . Mauelshagen wrote:

>=20
> Thanks AJ!
>=20
> And I even forgot to mention writable snapshots and pvresize ;-)
Excelent. :-))

Regards Anselm

> Need to rework CHANGELOG later...
>=20
> Regards,
> Heinz    -- The LVM Guy --
>=20
>=20
> On Fri, Mar 15, 2002 at 02:52:57PM -0600, AJ Lewis wrote:
> > Hi all - Heinz is unavailable, so I'm sending this out for him:
> >=20
> > LVM 1.1-rc1 release candidate supports both version 1 and 2 of the meta=
data.
> >=20
> > Disclaimer:
> > -----------
> > This is not meant to be used on production systems!
> >=20
> >=20
> > There's *no* need to run any metadata update tools.
> >=20
> > Please test this release candidate and feed back results to the linux-l=
vm
> > list in order to help us to release 1.1 ASAP.
> >=20
> > A tarball is available now at
> >=20
> >    <http://www.sistina.com/>
> >=20
> > for download (Follow the "LVM 1.1-rc1" link).
> >=20
> >=20
> > Changes to LVM 1.1-rc1 include:
> >=20
> > o volume group quorum support is in enabling optional activation of vol=
ume
> >   groups (vgchange -qn) in case at least one physical volume out of man=
y is
> >   still accessable enabling retrieval of data in logical volumes alloca=
ted
> >   on the accessable devices
> >=20
> > o vgimport supports importing by volume group name rather than requirin=
g
> >   a physical volume list
> >=20
> > o creation of metadata backup files in /etc/lvmtab* and metadata archiv=
es in
> >   /etc/lvmconf/ is now optional to help saving space for eg. on ram dis=
ks.
> >   If vgscan is not run at all and /etc/lvmtab* are removed, no backup f=
iles
> >   will be created.  If vgcfgbackup is not run at all and /etc/lvmconf/ =
is
> >   removed, no archive files will be created.
> >=20
> > o locations of metadata backups and archives are configurable through
> >   environment varibles LVM_BACKUP_INDEX/LVM_BACKUP_DIR and LVM_ARCHIVE_=
DIR
> >   respectively
> >=20
> > o volume group static mode in order to avoid all configuration changes =
to a
> >   volume group once set. This is useful to 'freeze' a volume group in o=
rder
> >   to activate it in a cluster of for fail-over configurations
> >=20
> > o the llseek cast bug has been fixed, which caused pvmove to fail beyon=
d the
> >   2GB offset
> >=20
> >=20
> > o more...
> >=20
> >=20
> > See the CHANGELOG file contained in the tarball for further information=
=2E
> >=20
> > Feed back LVM related information to <linux-lvm@sistina.com>.
> >=20
> > Thanks a lot for your support of LVM.
> >=20
> > --=20
> > AJ Lewis
> > Sistina Software Inc.                  Voice:  612-638-0500
> > 1313 5th St SE, Suite 111              E-Mail: lewis@sistina.com
> > Minneapolis, MN 55414
> > http://www.sistina.com
> >=20
> > Current GPG fingerprint =3D  7792 2F3E 9D86 DA4C 9111 7837 982D 737B 9D=
BC 4EC9
> > -----Begin Obligatory Humorous Quote-----------------------------------=
-----
> > Sticks and stones may break my bones, and so would an 80 lb. carrot.
> > -----End Obligatory Humorous Quote-------------------------------------=
-----
>=20
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>=20
> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-
>=20
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=20

---
 Anselm Kruis                                 Tel. +49 (0)89-356386-74
 science + computing ag=09=09              FAX  +49 (0)89-356386-37
 Ingolst=E4dter Str. 22             mailto: A.Kruis@science-computing.de
 D-80807 M=FCnchen                 WWW: http://www.science-computing.de/

**********************************************************************
***     Wir freuen uns auf Ihren Besuch                            ***
***                                                                ***
***     CeBIT 2002                                                 ***
***     13.-20.03.2002, Messegel=E4nde Hannover, Halle 11, F 64      ***
***                                                                ***
***     Automotive Circle International                            ***
***     18.-19.04.2002, Bad Nauheim                                ***
***                                                                ***
***     VDI-Tagung: Berechnung und Simulation im Fahrzeugbau       ***
***     01.-02.10.2002, Congress-Centrum W=FCrzburg                  ***
***                                                                ***
**********************************************************************=20
