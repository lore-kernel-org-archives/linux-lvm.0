Date: Mon, 24 Sep 2001 12:27:05 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Lost VG after failed pvmove
Message-ID: <20010924122705.A30375@sistina.com>
References: <Pine.SOL.4.30.0109231230550.22127-100000@napier.math.chalmers.se>
Mime-Version: 1.0
In-Reply-To: <Pine.SOL.4.30.0109231230550.22127-100000@napier.math.chalmers.se>; from thsv@math.chalmers.se on Sun, Sep 23, 2001 at 12:43:36PM +0200
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

Thomas,

you need to vgcfgrestore the metadata backaup to *all* of the PVs which b=
elonged
to the VG at the time the backup was created.
Then vgscan should see your VG quite happily again.

In regard to the pvmove error: do you have the particular error output it=
 gave?

Regards,
Heinz    -- The LVM Guy --


On Sun, Sep 23, 2001 at 12:43:36PM +0200, Thomas Svedberg wrote:
> I know, I should have made a backup. But I didn't so ...
>=20
> Short version:
> After a failed pvmove I can not find my VG.
>=20
> Long version:
> I was about to move more parts of my fs over to LVm and therefore used =
a
> new disk as help. And apparantly the wrong way.
> I first created a PV on the new disk and then added it to my VG, no
> problems.
> I then shrank the LV:s to fit the new disk. OK
> Next I pvmoved the LV:s from the original disk to the new one, still no
> problems.
> Then I removed the different PV from the original disk (I had started o=
t
> with a small one and then moved LV over to LVM one after the other and
> adding the freed spacce to the VG), removed the partitions and created =
one
> new big one instead of all the small.
> pvcreated it and vgextended it, all OK.
> So now I wanted to move the data back to this (faster) disk.
> pvmove failed after moving a few (24 ?, see below) LE (PE?).
>=20
> The fs seemed OK and I rebooted to see if it helped. No
> After reboot no VG was found.
> pvdisplay showed the newly added (destination of the move) PV as new, i=
.e.
> not belonging to any VG.
>=20
> Using vgcfgresore I was able to make the PV look like it belonged to my
> VG, but it looks empty still.
>=20
> Still nothing is found by vgscan.
>=20
> Reading through the howto I found the Dangerous Operations and did as
> described there. Now vgscan finds my VG but it says:
>=20
> vgscan -- only found 1357 of 1381 LEs for LV /dev/my_vg/home (0)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't ge=
t data of volume group "my_vg" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating=
 "/etc/lvmtab" and "/etc/lvmtab.d"
>=20
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found inactive volume group "my_vg"
>=20
> so it seems the 24 LE:s that was moved is 'missing'
>=20
> Can anyone help me restore this ?
>=20
> And, yes, next time I will be using tar to move my data....
>=20
> / Thomas
> .......................................................................
>  Thomas Svedberg
>  Department of Mathematics
>  Chalmers University of Technology
>=20
>  Address: SE-412 96 G=F6teborg, SWEDEN
>  E-mail : thsv@bigfoot.com, thsv@math.chalmers.se
>  Phone  : +46 31 772 5368
>  Fax    : +46 31 772 3595
> .......................................................................
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
