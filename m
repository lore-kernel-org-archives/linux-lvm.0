From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvmove killed vg
Message-ID: <20011212091053.B629@sistina.com>
References: <200112112134.fBBLYNC16014@mailgate5.cinetic.de>
Mime-Version: 1.0
In-Reply-To: <200112112134.fBBLYNC16014@mailgate5.cinetic.de>; from gunther.kuhlmann@web.de on Tue, Dec 11, 2001 at 10:34:24PM +0100
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
Date: Wed Dec 12 02:10:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Gunther,


you need to run vgcfgrestore on *all* PVs which where in your vg0 *after*
running "pvcreate -ff" on them. YOu can find out which these where by
"vgcfgrestore -ll -n vg0 -f /etc/lvmconf/WhateverYourRecentBackupFileIs".

If that doesn't work a hack to activate it anyway without running vgscan =
is
to copy /etc/lvmconf/WhateverYourRecentBackupFileIs (I assume
/etc/lvmconf/vg0.conf.cd in your case) to /etc/lvmtab.d/vg0,
"echo -en 'vg0\0vg1\0' > /etc/lvmtab" and "vgchange -ay".
Create a dummy LV with 1 PE afterwards and your=20
metadata on all PVs of the VG should be ok again.

Remember to back /etc/lvmconf/ regularly when you change your LVM configu=
ration!

Regards,
Heinz    -- The LVM Guy --


We recommend to upgrade to LVM 1.0.1 because a couple of bugs (some relat=
ed to
pvmove) have been fixed.
On Tue, Dec 11, 2001 at 10:34:24PM +0100, gunther.kuhlmann@web.de wrote:
> Hi,
>=20
> I've got a broken lvm vg as a result of an unsuccessful pvmove
> command. My system is a SuSE 7.0 with kernel 2.4.4 and
> lvm-0.9.1_beta7-10.=20
>=20
> The vg spans several partitions on one disks, one of which I=20
> wanted to evacuate. I used the pvmove command with chunks of=20
> 32 PE (=3D 1 GB); 10 GB total. The first 8 chunks worked okay,
> but the 9th (pvmove -v /dev/hda8:256-287 /dev/hda10) fell over
> with error code 23 while moving the fifth PE. So I checked using
> pvdisplay that the four PE had indeed been moved. A further
> attempt with pvmove -v /dev/hda8:260-287 /dev/hda10 fell over as
> well, again error code 23. (That's error moving physical
> extent(s)).=20
>=20
> I then rebooted the machine which killed the complete volume
> group. Which in turn did not quite impress me. :-((
>=20
> During my attempts at recovering I think I did a vgscan, which
> found the vg "vg1" on /dev/hdb, but not the vg "vg0" on /dev/hda.
>=20
> I tried the following commands unsuccessfully:
> - vgcfgrestore -v -n vg0: please enter physical volume name (the
>   synopsys of vgcfgrestore did not state it as a mandatory=20
> parameter)
> - vgcfgrestore -v -n vg0 /dev/hda10: can't restore part of active
> volume grout vg0
> - vgcfgrestore -v -n vg0 /dev/hda{6,7,8,10}: please enter physical
> volume name
> - vgchange -a n vg0: volume group vg0 does not exist
> - vgchange -a y vg0: volume group vg0 does not exist
>=20
> I still have the file /etc/lvmconf/vg0.conf.cd as well as the
> devices /dev/vg0/lv0{0,1,2,3} and /dev/vg0/group. (And
> /dev/vg1/..., but that is working.)
>=20
> Any suggestions on how I can recover the data would be highly
> appreciated. I found a reference to a program called
> uuid_fixer/uuid_editor, but usage was discouraged. Do I have to=20
> try it
> or is there a better way? Does upgrading to a newer version of lvm
> help? Or do I have to update the kernel as well then? And I=20
> definately
> do _not_ want to kill my other vg as well.
>=20
> Regards,
>=20
> Gunther
>=20
>=20
>=20
>=20
> _______________________________________________________________________=
_______
> Die sch=F6nsten Ski-Regionen der Alpen - jetzt bei Ferienklick.de
> http://ferienklick.de/ski/?PP=3D2-5-100-105-38
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
