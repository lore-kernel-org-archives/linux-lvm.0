From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] mirrored logical volumes
Message-ID: <20021118161955.A25728@sistina.com>
References: <11538.1037603334@www65.gmx.net>
Mime-Version: 1.0
In-Reply-To: <11538.1037603334@www65.gmx.net>; from ThGrill@gmx.de on Mon, Nov 18, 2002 at 08:08:54AM +0100
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
Date: Mon Nov 18 09:26:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Thomas,

as Anders mentioned you want to combine MD and LVM to achive this today.

We'll support mirroring directly in LVM2/device-mapper early next year.

On Mon, Nov 18, 2002 at 08:08:54AM +0100, Thomas Grill wrote:
> Hi,
>=20
> I would like to install Linux (SuSE 8.1) on my pc (AMD 800 MHz, 2 x 8 G=
B
> SCSI harddiscs) with mirrored logical volumes (LVM + Soft-RAID). Is thi=
s
> possible ? If yes, how can that be done?
>=20
> Best regards,
> Thomas Grill
>=20
> --=20
> +++ GMX - Mail, Messaging & more  http://www.gmx.net +++
> NEU: Mit GMX ins Internet. Rund um die Uhr f=FCr 1 ct/ Min. surfen!
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
