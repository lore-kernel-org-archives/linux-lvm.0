Message-Id: <200112121919.fBCJJxC29750@mailgate5.cinetic.de>
MIME-Version: 1.0
From: "Gunther Kuhlmann" <gunther.kuhlmann@web.de>
Subject: Re: [linux-lvm] pvmove killed vg
Content-Type: text/plain; charset="iso-8859-1"
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
Date: Wed Dec 12 13:18:04 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

linux-lvm@sistina.com schrieb am 12.12.01:

Heinz,

I tried the manual recovery as well. When it comes to "vgchange
-ay" it says:
vgchange -- ERROR: physical volume "/dev/hda8" of volume group=20
"vg0" is inconsistent
vgchange -- ERROR: physical volume "/dev/hda6" of volume group=20
"vg0" is inconsistent
vgchange -- ERROR: physical volume "/dev/hda7" of volume group=20
"vg0" is inconsistent
vgchange -- ERROR: physical volume "/dev/hda10" of volume group=20
"vg0" is inconsistentvgchange -- run vgscan
vgchange -- volume group "vg1" already active

That does not sound very good. Is there any chance of recovery=3F
I can send debug information if that helps.

Regards,

Gunther

> you need to run vgcfgrestore on *all* PVs which where in your=20
vg0 *after*
> running "pvcreate -ff" on them. YOu can find out which these=20
where by
> "vgcfgrestore -ll -n vg0 -f=20
/etc/lvmconf/WhateverYourRecentBackupFileIs".
>=20
> If that doesn't work a hack to activate it anyway without=20
running vgscan is
> to copy /etc/lvmconf/WhateverYourRecentBackupFileIs (I assume
> /etc/lvmconf/vg0.conf.cd in your case) to /etc/lvmtab.d/vg0,
> "echo -en 'vg0\0vg1\0' > /etc/lvmtab" and "vgchange -ay".
> Create a dummy LV with 1 PE afterwards and your=20
> metadata on all PVs of the VG should be ok again.
>=20
> Remember to back /etc/lvmconf/ regularly when you change your=20
LVM configuration!
>=20
> Regards,
> Heinz    -- The LVM Guy --
>=20
>=20
> We recommend to upgrade to LVM 1.0.1 because a couple of bugs=20
(some related to
> pvmove) have been fixed.
> On Tue, Dec 11, 2001 at 10:34:24PM +0100,=20
gunther.kuhlmann@web.de wrote:
> > Hi,
> >=20
> > I've got a broken lvm vg as a result of an unsuccessful pvmove
> > command. My system is a SuSE 7.0 with kernel 2.4.4 and
> > lvm-0.9.1=5Fbeta7-10.=20
> >=20
> > The vg spans several partitions on one disks, one of which I=20
> > wanted to evacuate. I used the pvmove command with chunks of=20
> > 32 PE (=3D 1 GB); 10 GB total. The first 8 chunks worked okay,
> > but the 9th (pvmove -v /dev/hda8:256-287 /dev/hda10) fell over
> > with error code 23 while moving the fifth PE. So I checked=20
using
> > pvdisplay that the four PE had indeed been moved. A further
> > attempt with pvmove -v /dev/hda8:260-287 /dev/hda10 fell over=20
as
> > well, again error code 23. (That's error moving physical
> > extent(s)).=20
> >=20
> > I then rebooted the machine which killed the complete volume
> > group. Which in turn did not quite impress me. :-((
> >=20
> > During my attempts at recovering I think I did a vgscan, which
> > found the vg "vg1" on /dev/hdb, but not the vg "vg0" on=20
/dev/hda.
> >=20
> > I tried the following commands unsuccessfully:
> > - vgcfgrestore -v -n vg0: please enter physical volume name=20
(the
> >   synopsys of vgcfgrestore did not state it as a mandatory=20
> > parameter)
> > - vgcfgrestore -v -n vg0 /dev/hda10: can't restore part of=20
active
> > volume grout vg0
> > - vgcfgrestore -v -n vg0 /dev/hda{6,7,8,10}: please enter=20
physical
> > volume name
> > - vgchange -a n vg0: volume group vg0 does not exist
> > - vgchange -a y vg0: volume group vg0 does not exist
> >=20
> > I still have the file /etc/lvmconf/vg0.conf.cd as well as the
> > devices /dev/vg0/lv0{0,1,2,3} and /dev/vg0/group. (And
> > /dev/vg1/..., but that is working.)
> >=20
> > Any suggestions on how I can recover the data would be highly
> > appreciated. I found a reference to a program called
> > uuid=5Ffixer/uuid=5Feditor, but usage was discouraged. Do I have=20
to=20
> > try it
> > or is there a better way=3F Does upgrading to a newer version of=20
lvm
> > help=3F Or do I have to update the kernel as well then=3F And I=20
> > definately
> > do =5Fnot=5F want to kill my other vg as well.
> >=20
> > Regards,
> >=20
> > Gunther
> >=20
> >=20
> >=20
> >=20
> >=20
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F
> > Die sch=F6nsten Ski-Regionen der Alpen - jetzt bei Ferienklick.de
> > http://ferienklick.de/ski/=3FPP=3D2-5-100-105-38
> >=20
> >=20
> > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at=20
http://www.sistina.com/lvm/Pages/howto.html
>=20
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>=20
>=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
>=20
> Heinz Mauelshagen                                 Sistina=20
Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang=20
11
>                                                   56242=20
Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
>=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
>=20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at=20
http://www.sistina.com/lvm/Pages/howto.html=20


=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
Keine verlorenen Lotto-Quittungen, keine vergessenen Gewinne mehr!=20
Beim WEB.DE Lottoservice: http://tippen2.web.de/=3Fx=3D13
