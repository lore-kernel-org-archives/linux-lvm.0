From: Heinz.Mauelshagen@t-online.de
Date: 16 May 2000 14:29 GMT
Subject: Re: [linux-lvm] vg problems after power failure
MIME-Version: 1.0
Content-transfer-encoding: quoted-printable
Message-ID: <12riMA-1jfCE4C@fwd00.sul.t-online.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: dash_ampersand@yahoo.com
Cc: linux-lvm@msede.com


The vgscan output shows a strange amount of sectors while checking sdb.=20
It looks like the partition table on that disk is hosed. fdisk seems to=20
share that opinion ;-{(

Please set up the partition table with fdisk (i hope you remember the=20
correct sizes) and retry. Please don't forget to set the partition=20
types.

Regards,
Heinz

>----- Urspr=FCngliche Nachricht -----
>Absender: dash_ampersand@yahoo.com
>Betreff: Re: [linux-lvm] vg problems after power failure
>Empf=E4nger: Heinz Mauelshagen
>Datum: 15. Mai 2000 21:57
>
> Here is the output of the command.  I have been away
> from this for a couple of weeks.  I'm going to do more
> checking in a little while.  Linux detects sdb1 on
> bootup but fdisk doesn't show it.  I'm hoping I'm not
> missing something simple.  Thanks.
>=20
>=20
> Regards,
> Chris
>=20
> --- Heinz Mauelshagen
> <mauelsha@EZ-Darmstadt.telekom.de> wrote:
> > > We had a power failure and our server (fortunately
> > not
> > > "production" yet...) lost power.  Now vgscan does
> > not
> > > find volume groups.  Also, at boot time, Linux
> > says it
> > > finds a partition -- sdb1.  This shouldn't be
> > > happening, should it?
> >=20
> > Did the power failure lead to a destroyed partition
> > table?
> > This could in turn prevent LVM to find PVs on that
> > disk.
> >=20
> > >=20
> > >=20
> > > [root@microviz00 lvmconf]# vgscan -v vgscan --
> > > removing "/etc/lvmtab" and "/etc/lvmtab.d" vgscan
> > --
> > > reading all physical volumes (this may take a
> > > while...) vgscan -- no volume groups found       =20
> >   =20
> > >                                                  =20
> >   =20
> > >                                      =20
> > >=20
> > > Is there anything I might try to get it to
> > recognize
> > > the volume group?  Thanks in advance.
> >=20
> > Which is the exact VG setup you had before?
> > IOW: Which partitions/whole disks were used as PVs?
> >=20
> > Could you provide the output of "vgscan -dv" please?
> >=20
> > In any case please save /etc/lvmconf/* to enable
> > yourself to
> > use vgcfgrestore in case the VGDA has really been
> > destroyed.
> >=20
> > >=20
> > >=20
> > >=20
> > > Chris
> > >=20
> >=20
> > Regards,
> > Heinz
>=20
>=20
>=20
> __________________________________________________
> Do You Yahoo!?
> Send instant messages & get email alerts with Yahoo! Messenger.
> http://im.yahoo.com/
