From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] rescuing a VG with one missing PV
Message-Id: <20020212150551.A3258@sistina.com>
References: <20020209142411.GA10226@xulfad.ton.tut.fi>
    <20020209150956.GA11057@xulfad.ton.tut.fi>
    <20020211205325.GA25253@xulfad.ton.tut.fi>
    <20020212102228.A2360@sistina.com>
    <20020212125816.GA5087@xulfad.ton.tut.fi>
MIME-Version: 1.0
In-Reply-To: <20020212125816.GA5087@xulfad.ton.tut.fi>; from
    flux@inside.org on Tue, Feb 12, 2002 at 02:58:17PM +0200
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
Date: Tue Feb 12 08:07:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Tue, Feb 12, 2002 at 02:58:17PM +0200, Erkki Seppala wrote:
> On Tue, Feb 12, 2002 at 10:22:28AM +0100, Heinz J . Mauelshagen wrote:
> > On Mon, Feb 11, 2002 at 10:53:25PM +0200, Erkki Seppala wrote:
> > > The drive I got was two gigabytes smaller than the original, and th=
us:
> > >=20
> > > The original disc was:
> > >=20
> > >   PVs: [AN] ide/host0/bus0/target1/lun0/part1 60030976 /3664   =20
> > > 		21331968 /1302    38699008/2362 =20
> > >=20
> > > and it now is 58633312 blocks according to fdisk.
> >=20
> > Change your partition to have the very same size as before and vgcfgr=
estore.
>=20
> Thanks for the suggestion, and I would very much like to do that, but
> as I said, the replacement drive is a bit smaller than the old one,
> thus I cannot make as big partition :-).

Sorry, missed that :-(

>=20
> I was considering hacking vgcfgrestore to ignore the fact that the
> size mismatches, are there problems to be expected? Like severe VG
> corruption.. I might just as well try anything, it can't be any worse
> than the current situation.

Get LVM from CVS at www.sistina.com and either use the -s option of pvcre=
ate
I implemented recently to fake the size you need or run "vgcfgrestore -i =
..."
which ignores the size of the device and restores metadata anyway
at your own risk.

Both will only help if you don't have data in the last 2 GB, because you
can't pvmove it away. Even though you lost your data anyway with the old =
drive,
you need to either pvmove it away to get rid of allocated extents in that=
 PV
again or lvreduce LVs to make them free which you potentially don't like,
because the extents might be further to the beginning of the LV.

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
