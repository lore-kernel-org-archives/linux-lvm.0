From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] 64K limit for VG/LV
Message-Id: <20020122193953.A25782@sistina.com>
References: <3C4D61CF.12330DF1@conterra.de>
MIME-Version: 1.0
In-Reply-To: <3C4D61CF.12330DF1@conterra.de>; from stueken@conterra.de on
    Tue, Jan 22, 2002 at 01:57:51PM +0100
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
Date: Tue Jan 22 12:44:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Tue, Jan 22, 2002 at 01:57:51PM +0100, Dieter Stueken wrote:
> I just merged two volume groups without any error message,
> but the result seems to have more than 65535 LE now. The only
> effect until now is, that the number of free PE becomes negative
> and is displayed as an unsigned huge value:
>=20
> --- Volume group ---
> VG Name               vg0
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                9
> Open LV               2
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                4
> Act PV                4
> VG Size               286.33 GB
> PE Size               4.00 MB
> Total PE              73300
> Alloc PE / Size       97200 / 379.69 GB
> Free  PE / Size       4294943396 / 1.91 TB
> VG UUID               QDKBpV-xwqr-gO3b-VKiA-Jaf4-grmm-pWEY32
>=20
> My VG consists of 4 x 75 GB IBM-DTLA-307075. Should I worry now?
> If there is any limit of 65536 I might suspect some 16bit value
> for PE addressing. If no overflow is checked, a wrong PE may be
> addressed beyond LE 65536 and my VG possibly gets destroyed :-(
>=20
> But I found some hints in the mailing archive, saying that the
> 64K limit does not affect the VG itself but only each LV inside.

Dieter,
that's correct. It is just a per LV limit for the max amount of its
Logical Extents (LEs).

> Thus as long as each of my LV is <256G I don't have to worry, and
> the reported "Free PE" might be just cosmetics.

Cosmetics is a nice way to put it :-)
We probably have missed that one, because for a VG with such a large capa=
city
we choosed larger PE sizes.

>=20
> Besides, vgdisplay says: "Logical Volume Manager 1.0.1-rc2"
> On SuSE 7.3 running 2.4.16.
>=20
> If I want to increase my LE size, I think I have to create a new VG.
> Is there any tool to copy my LVs to the new VG other than "dd"?

cat ;-)
No, sorry. None included in LVM.

>=20
> Dieter.
> --=20
> Dieter St=FCken, con terra GmbH, M=FCnster
>     stueken@conterra.de         stueken@qgp.uni-muenster.de
>     http://www.conterra.de/     http://qgp.uni-muenster.de/~stueken
>     (0)251-980-2027             (0)251-83-334974
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
