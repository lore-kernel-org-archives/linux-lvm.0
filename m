From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvmsar & pvchange minor problems
Message-ID: <20020925114158.B29192@sistina.com>
References: <20020925091351kaoru@rifu.bsd.tnes.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20020925091351kaoru@rifu.bsd.tnes.nec.co.jp>; from kaoru@bsd.tnes.nec.co.jp on Wed, Sep 25, 2002 at 09:13:51AM +0900
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
Date: Wed Sep 25 04:55:47 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-2022-jp"
To: linux-lvm@sistina.com

Kaoru,

thanks for pointing these out.

I have fixed the "lvmsar -h" bug and removed the wrong array reference
from the debug_leave call in vg_check_active.c.

Both fixes are in CVS now (Branch: LVM_BRANCH_1-0).

Regards,
Heinz    -- The LVM Guy --


On Wed, Sep 25, 2002 at 09:13:51AM +0900, kaoru@bsd.tnes.nec.co.jp wrote:
> Hi,
>=20
> I found minor problems in lvm's commands with kernel 2.4.18 + LVM 1.0.5.
>=20
> =3D=3D=3D=3D=3D=3D=3D
> Lvmsar command does not handle -h option.
>=20
> # lvmsar -h
> lvmsar -- invalid command line option "h"
>=20
> # lvmsar --help
> lvmsar -- invalid command line option "h"
>=20
> # lvmsar -?
>=20
> Logical Volume Manager 1.0.5
> Heinz Mauelshagen, Sistina Software  15/07/2002 (IOP 10)
>=20
> lvmsar -- Logical Volume Manager System Activity Data Reporter
>=20
> Synopsis:
> ---------
>=20
> lvmsar
>         [-d/--debug]
>         [-f/--full]
>         [-h/--help]
>         [-s/--stdin]
>         [-v/--verbose]
>         LogFilePath
>=20
>=20
> =3D=3D=3D=3D=3D=3D=3D
> Vg_check_active function printed the following illgal debug messages=20
> when I executed "pvchange -d".
>=20
> ....
> 	<22> vg_check_active_all_vg -- CALLED
> 	<333> vg_status_get_count -- CALLED
> 	<333> vg_status_get_count -- LEAVING with ret: 2
> 	<333> vg_status_get_namelist -- CALLED
> 	<333> vg_status_get_namelist -- LEAVING with ret: 0
> 	<22> vg_check_active_all_vg -- LEAVING with ret: 0  ptr: ~H=1B$B:^=1B(BD=
^H^H=1B$B;^=1B(BD^H
> 	<22> pv_check_active -- CALLED
> ....
>=20
> I made the following patch for this problem, and it seems=20
> to work. Any comments?=20
>=20
> ---8<-----------8<----------8<----------8<----------8<----------
> --- 1.0.5/tools/lib/vg_check_active.c.orig      Tue Sep 24 11:12:51 2002
> +++ 1.0.5/tools/lib/vg_check_active.c   Tue Sep 24 11:13:21 2002
> @@ -88,6 +88,6 @@
>     else           ptr =3D NULL;
>=20
>     debug_leave ( "vg_check_active_all_vg -- LEAVING with ret: %d  ptr: %=
s\n",
> -                 ret, ptr);
> +                 ret, (( ptr =3D=3D NULL ) ? "null" : *ptr));
>     return ptr;
>  }
> ---8<-----------8<----------8<----------8<----------8<----------
>=20
> Thanks,
> Kaoru
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
