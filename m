From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Addiing new hdd to pv group
Message-Id: <20020430154018.B4879@sistina.com>
References: <B98126A4-5B7D-11D6-A7F7-000393452E7E@jvm.de>
MIME-Version: 1.0
In-Reply-To: <B98126A4-5B7D-11D6-A7F7-000393452E7E@jvm.de>; from
    stephan.budach@jvm.de on Mon, Apr 29, 2002 at 04:30:59PM +0200
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
Date: Tue Apr 30 08:42:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Stephan,

recent LVM versions have a pvresize command, which can add the space of
a grown partition/device to a physical volume stored in that partition.

You can't combine seperate devices (like 2 different disks) this way.

If hdd is a free disk, just run pvcreate on it and use vgextend to add it
to one of your existing volume groups.

On Mon, Apr 29, 2002 at 04:30:59PM +0200, Stephan Budach wrote:
> Hi,
>=20
> is it possible to expand an existing pv with an additional hdd, without=
=20
> loosing data, of course?
>=20
> Thanks,
> Stephan
> --
> Stephan Budach
>=20
> Jung von Matt/Services
>=20
> Glash=FCttenstrasse 38   			20357 Hamburg
> Telefon: +49-40-4321-1353    		Fax: +49-40-4321-1114
> eMail: stephan.budach@jvm.de	Internet: http://www.jvm.de
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
