From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgimport problem
Message-ID: <20030227021208.A5222@sistina.com>
References: <3E5CFF63.5040009@conterra.de>
Mime-Version: 1.0
In-Reply-To: <3E5CFF63.5040009@conterra.de>; from stueken@conterra.de on Wed, Feb 26, 2003 at 06:54:43PM +0100
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
Date: Wed Feb 26 19:18:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

We fixed a vgimport bug with out-of-sequence PV numbers in LVM 1.0.6.

If pvdata shows you, that your PVs are not sequentially numbered (i.e.  1=
,3,4), you probably want to try 1.0.6.

Regards,
Heinz    -- The LVM Guy --


On Wed, Feb 26, 2003 at 06:54:43PM +0100, Dieter Stueken wrote:
> sorry, I just got the next problem, hopefully not that stupid again :-)
>=20
> I exported a VG of three PV's last week.
> When I now try to import them again, I get:
>=20
> -> vgimport data3 /dev/hdc /dev/hdd2 /dev/hdb
> vgimport -- ERROR: wrong number of physical volumes to import volume=20
> group "data3"
>=20
> I looked into each PV by pvdata and everything seems OK.
> The UUIDs are OK and there are exactly 3 ones listed.
> I can't get any hint about any missing PV. Running vgimport -v
> does not report any additional errors, too.
>=20
> any advice?
>=20
> Dieter.
> --=20
> Dieter St=FCken, con terra GmbH, M=FCnster
>      stueken@conterra.de
>      http://www.conterra.de/
>      (0)251-7474-501
>=20
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
