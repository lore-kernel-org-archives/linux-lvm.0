Return-Path: <root@srv.sistina.com>
Date: Mon, 25 Jun 2001 14:23:37 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Why vgscan not in kernel?
Message-ID: <20010625142337.A20142@sistina.com>
References: <3B372D6D.88998D3F@qis-systemhaus.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3B372D6D.88998D3F@qis-systemhaus.de>; from heinrichs@qis-systemhaus.de on Mon, Jun 25, 2001 at 02:24:13PM +0200
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

Dirk,

that's already on the TODO list as a post 1.0 feature.

Regards,
Heinz    -- The LVM Guy --


On Mon, Jun 25, 2001 at 02:24:13PM +0200, Dirk Heinrichs wrote:
> Hi all,
>=20
> upon boot, SCSI and IDE drivers check harddrives attached to the device
> for partitions. Wouldn't it be better to have similar functionality
> (scanning for VG's) for LVM in the kernel, instead of using a userland
> command?
>=20
> Bye...
>=20
> 	Dirk
> --=20
> Dirk Heinrichs		| Tel:	+49 (0)241 413 260
> Configuration Manager	| Fax:	+49 (0)241 413 2640
> QIS Systemhaus GmbH	| Mail:	dheinrichs@qis-systemhaus.de
> J=EF=BF=BDlicher Str. 338b	| Web:	http://www.qis-systemhaus.de
> D-52070 Aachen		| ICQ#:	110037733
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
