From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] kernel 2.4.x-ac private gendisk_head
Message-ID: <20011019121228.C22924@sistina.com>
References: <20011019195632.A8790@pov.home.ben>
Mime-Version: 1.0
In-Reply-To: <20011019195632.A8790@pov.home.ben>; from benjaminlee@consultant.com on Fri, Oct 19, 2001 at 07:56:32PM +1000
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
Date: Fri Oct 19 05:14:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Fri, Oct 19, 2001 at 07:56:32PM +1000, Benjamin Lee wrote:
> Hi all,
>=20
> In reference to:
>=20
> http://lists.sistina.com/pipermail/linux-lvm/2001-October/009169.html
> http://lists.sistina.com/pipermail/linux-lvm/2001-October/009171.html
>=20
> I've successfully compiled a kernel, Linux pov 2.4.12-ac3 #10 SMP,
> with LVM 1.0.1-rc4 (or CVS [are they the same at the moment?])

There's some differences.
For eg. CVS contains the add/del_gendisk() changes already now.

> and
> made the changes to lvm.c and lvm-snap.c outlined in the messages
> above.
>=20
> I am *just about* to create some volumes and test the whole setup
> (first with ext2, then ext3).
>=20
> It is to my understanding, that the modifications to support the
> private gendisk_head means that the add_gendisk and del_gendisk
> functions are [now] being used from ./drivers/block/genhd.c. Is this
> correct?

Yes.

> Is everything going to be happy and safe? ;-)

Yes, at least here it works ok ;-)

>=20
> You can find the modified files here:
>=20
> http://xaos.homeip.net/lvm/lvm.c
> http://xaos.homeip.net/lvm/lvm-snap.c
>=20
> --=20
> Benjamin Lee
> Melbourne, Australia             "Always real."    http://realthought.n=
et/
>=20
> Weather outside looks to be 12=B0C, mostly cloudy.
> _______________________________________________________________________=
___
> If the master dies and the disciple grieves, the lives of both have
> been wasted.
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
