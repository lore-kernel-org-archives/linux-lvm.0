From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] upgrade lvm version
Message-Id: <20020121150038.B17020@sistina.com>
References: <3C4C06E4.E237B117@eds.com>
MIME-Version: 1.0
In-Reply-To: <3C4C06E4.E237B117@eds.com>; from stefan.huber@eds.com on Mon,
    Jan 21, 2002 at 01:17:40PM +0100
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
Date: Mon Jan 21 08:04:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, Jan 21, 2002 at 01:17:40PM +0100, Stefan Huber wrote:
> hello list
>=20
> i would like to upgrade my kernel from 2.2.14 to 2.2.19
> question:
>=20
>  can i first upgrade the lvm version and later the kernel ?

Nope, you need to upgrade the tools *and* the kernel in parallel
because the interface between the driver and the user tools has been chan=
ged.

Assuming that you don=C4t have root on an LV, please remember to have a
lilo configuration which enables you to boot
the old kernel *and* a copy of /sbin/e2fsadm, /sbin/[lp]v*, /sbin/vg*
plus /lib/*lvm* online in order to recover in case of problems.
Copy those files to a /sbin and a /lib subdirectory, so that you can acce=
ss
them in single user mode.

Because this is a major upgrade, please take backups of your data includi=
ng
the LVM metadata backups in /etc/lvmconf/* !

>=20
> i`m using lvm 0.8e and i plan to upgrade to lvm 1.0.
>=20
> greeeetzzzzz
>=20
> s
>=20
> ________________________________________________________________
>  Stefan Huber
>  EDS Information Business GmbH
>  Storage Management
>  Telefon   +41(0)52 674 86 56
>  Fax       +41(0)52 674 86 94
>  e-mail  stefan.huber@eds.com
>=20
>=20
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
