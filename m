From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] rescuing a VG with one missing PV
Message-Id: <20020213102545.A7457@sistina.com>
References: <20020209142411.GA10226@xulfad.ton.tut.fi>
    <20020209150956.GA11057@xulfad.ton.tut.fi>
    <20020211205325.GA25253@xulfad.ton.tut.fi>
    <20020212102228.A2360@sistina.com>
    <20020212125816.GA5087@xulfad.ton.tut.fi>
    <20020212150551.A3258@sistina.com>
    <20020212213713.GA10944@xulfad.ton.tut.fi>
MIME-Version: 1.0
In-Reply-To: <20020212213713.GA10944@xulfad.ton.tut.fi>; from
    flux-lvm@inside.org on Tue, Feb 12, 2002 at 11:37:14PM +0200
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
Date: Wed Feb 13 03:27:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Tue, Feb 12, 2002 at 11:37:14PM +0200, Erkki Seppala wrote:
> On Tue, Feb 12, 2002 at 03:05:51PM +0100, Heinz J . Mauelshagen wrote:
> > Get LVM from CVS at www.sistina.com and either use the -s option of p=
vcreate
> > I implemented recently to fake the size you need or run "vgcfgrestore=
 -i ..."
> > which ignores the size of the device and restores metadata anyway
> > at your own risk.
>=20
> Thanks! This seems to be doing the trick. There seemed to be one typo
> in the CVS at the moment I checked out my version, but I imagine it'll
> be fixed as soon as someone tries to compile it :-) :

No, that's actually a new function which checks for a particular lv devic=
e
number in use. Strange that you couldn't compile it.
Could you please try a checkout from scratch and send me the error you se=
e.
Thanks.

>=20
> ---8<---
> Index: vgscan.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> RCS file: /data/cvs/LVM/tools/vgscan.c,v
> retrieving revision 1.12
> diff -u -r1.12 vgscan.c
> --- vgscan.c    2002/02/08 14:59:37     1.12
> +++ vgscan.c    2002/02/12 21:29:00
> @@ -294,7 +294,7 @@
>                 for ( blk_dev =3D l =3D 0; l < vg->lv_max; l++) {
>                    lv =3D vg->lv[l];
>                    if ( lv =3D=3D NULL) continue;
> -                  if ( lvm_tab_check_free_lv_number ( lv) =3D=3D FALSE=
) {
> +                  if ( lvm_tab_check_free_lv_numbers ( lv) =3D=3D FALS=
E) {
>                       printf ( "%s -- changing minor number on \"%s\"\n=
",
>                                cmd, lv->lv_name);
>                       if ( lv->lv_access & LV_SNAPSHOT_ORG) {
> ---8<---
>=20
> > Even though you lost your data anyway with the old drive, you need
> > to either pvmove it away to get rid of allocated extents in that PV
> > again or lvreduce LVs to make them free which you potentially don't
> > like, because the extents might be further to the beginning of the
> > LV.
>=20
> I don't completely understand this, but I guess I will when the pvmove
> has completed - it's a surprisingly slow operation.

Well, it needs to copy a lot of data ;-)
Get back to me if there's any further problems.

> I was glad to
> notice though that only one logical volume was in the failed disc.
>=20
> Once again, thanks for the help :).
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

--=20

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
