From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] bug: raid1 sub-devices are scanned too
Message-Id: <20020225105242.B7948@sistina.com>
References: <20020223015504.GA828@xulfad.ton.tut.fi>
    <20020223114712.A695@sistina.com> <20020223115529.A744@sistina.com>
    <20020224221642.GA31890@xulfad.ton.tut.fi>
MIME-Version: 1.0
In-Reply-To: <20020224221642.GA31890@xulfad.ton.tut.fi>; from
    flux-lvm@inside.org on Mon, Feb 25, 2002 at 12:16:43AM +0200
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
Date: Mon Feb 25 03:52:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, Feb 25, 2002 at 12:16:43AM +0200, Erkki Seppala wrote:
> Hello, thanks for the reply.=20
>=20
> The problem seems to have disappeared after a reboot, or then I've
> tried the vgscan -f -stuff - vgscan now just seemed to work OK. I
> could've sworn I tried that vgscan -f before without too much success,
> but, all in all, I imagine it's not worth hunting a bug before one can
> find an easily repeatible situation.

Yes, that's true.

In case you get it reproducable some day, I'ld really appreciate your
VGDA and setup information to drill that one down.

Regards,
Heinz    -- The LVM Guy --

>=20
> On Sat, Feb 23, 2002 at 11:55:29AM +0100, Heinz J . Mauelshagen wrote:
>=20
> > > this is a bug in 1.0.3 with exported VGs.
> > >=20
> > > If you import your VG "mirror" again, you should be fine.
> > > Rather than imprting, "vgscan -f" should work as well.
>=20
> In the original situation vgscan -f was of no help, only the
> export/import-trick (and a reboot) allowed me to access the mirror-vg.
>=20
> > Are /dev/ide/host0/bus1/target1/lun0/part1 and
> > /dev/ide/host0/bus0/target1/lun0/part1 really the ones making up /dev=
/md/1 ?
> >=20
> > Regards,
> > Heinz    -- The LVM Guy --
>=20
> Yes:
> md1 : active raid1 ide/host0/bus1/target1/lun0/part1[1] ide/host0/bus0/=
target1/lun0/part1[0]
>       58633216 blocks [2/2] [UU]
>=20
> --=20
>   _____________________________________________________________________
>      / __// /__ ____  __                              Erkki Sepp=E4l=E4=
\   \
>     / /_ / // // /\ \/ //ircnet                           Modeemi Ry\  =
/
>    /_/  /_/ \___/ /_/\_\@modeemi.fi        http://www.modeemi.fi/~flux/
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
