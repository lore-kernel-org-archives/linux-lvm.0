From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] XFS with LVM
Message-ID: <20011105143155.E25559@sistina.com>
References: <E823FA92099E6C4C854CE791DFA1A3D265BA56@got02.vikingtelecom.com> <20011105132709.C1568@sky.net>
Mime-Version: 1.0
In-Reply-To: <20011105132709.C1568@sky.net>; from U.Wiederhold@gmx.net on Mon, Nov 05, 2001 at 01:27:09PM +0100
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
Date: Mon Nov  5 07:35:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, Nov 05, 2001 at 01:27:09PM +0100, Ulrich Wiederhold wrote:
> * Turbo Fredriksson <turbo.fredriksson@viking-telecom.com> [011105 10:4=
3]:
> > The LVM consists of the following devices:
> >=20
> > 	Device	Size (MB)	Type
> > 	/dev/sdb1	 5.88 GB	0x83
> > 	/dev/sdc1	 1008 MB	0x83
> > 	/dev/sdd10	 2.37 GB	0x83
> > 	/dev/sde1	 8.51 GB	0x83
> > 	/dev/sdf1	17.09 GB	0x83
> > 	/dev/sdg1	15.55 GB	0x83
>=20
> Hello,
> I am not very good with lvm, but the fs-type on lvm-drives should be
> /dev/hda2            22     39761  20028960   8e  Linux LVM
>                                               ^^
>=20
> Isn=B4t it?

Exactly.
It is there as a security constraint against pvcreating other partitions.

> Uli
>=20
> --=20
> 'The box said, 'Requires Windows 95 or better', so i installed Linux - =
TKK 5
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
