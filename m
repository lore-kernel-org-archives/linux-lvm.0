Subject: Re: Re: [linux-lvm] Some suggestions about lvminitrd_create
From: Daniel Savard <dsavard@cids.ca>
In-Reply-To: <E178MFa-0001PJ-00@hermes.sistina.com>
References: <E178MFa-0001PJ-00@hermes.sistina.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1021567395.29371.108.camel@dirac.cids.ca>
Mime-Version: 1.0
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
Date: Thu May 16 11:44:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Thu, 16 May 2002 16:23:41 +0200, "Heinz J . Mauelshagen" wrote :
>=20
> On Wed, May 15, 2002 at 09:56:31AM +0100, Jonathan Buzzard wrote:
> >=20
> > Just a couple of suggestions firstly it would be nice if it checked
> > for /boot/System.map-'uname -r' rather than for just /boot/System.map.
> > When you have more than one kernel floating about this is handy.
>=20
> Yep, that's what the "-F" option aims to support.
>=20

I have written my own version with the equivalent option. I also
reworked the script so it works the same way as the mkinitrd script,
reading the /etc/modules.conf to build a list of modules to include as
well as adding an option to specify the filesystems modules which are
required in the image. And using losetup to manage the loopback device.

I am trying to make my kernel as modularized as possible to limit its
size. So, all my filesystems are modules as well as drivers for my SCSI
peripherals, I added an option to specify the filesystems modules
required in the image. Still need some work. However, if you need a copy
I can send it to you. I found it a little bit difficult to maintain, I
tried to make better usage of functions.

>=20
> --=20
>=20
> Regards,
> Heinz    -- The LVM Guy --
>=20
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>=20
> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-
>=20
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-
>=20
>=20

--=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Daniel Savard
Consultation Informatique Daniel Savard
551, boul. Sir-Wilfrid-Laurier
suite 105
Beloeil, (Qu=E9bec)
Canada J3G 4J1

T=E9l: (450) 467-8014
Internet: dsavard@cids.ca
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
