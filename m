Subject: RE: [linux-lvm] XFS with LVM
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <E823FA92099E6C4C854CE791DFA1A3D277CAC7@got02.vikingtelecom.com>
From: "Turbo Fredriksson" <turbo.fredriksson@viking-telecom.com>
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
Date: Tue Nov  6 02:22:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Sorry, that was a typo. The partitions are 0x8e...

> -----Original Message-----
> From: Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com]
> Sent: Monday, November 05, 2001 2:32 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] XFS with LVM
>=20
>=20
> On Mon, Nov 05, 2001 at 01:27:09PM +0100, Ulrich Wiederhold wrote:
> > * Turbo Fredriksson <turbo.fredriksson@viking-telecom.com>=20
> [011105 10:43]:
> > > The LVM consists of the following devices:
> > >=20
> > > 	Device	Size (MB)	Type
> > > 	/dev/sdb1	 5.88 GB	0x83
> > > 	/dev/sdc1	 1008 MB	0x83
> > > 	/dev/sdd10	 2.37 GB	0x83
> > > 	/dev/sde1	 8.51 GB	0x83
> > > 	/dev/sdf1	17.09 GB	0x83
> > > 	/dev/sdg1	15.55 GB	0x83
> >=20
> > Hello,
> > I am not very good with lvm, but the fs-type on lvm-drives should be
> > /dev/hda2            22     39761  20028960   8e  Linux LVM
> >                                               ^^
> >=20
> > Isn=B4t it?
>=20
> Exactly.
> It is there as a security constraint against pvcreating other=20
> partitions.
>=20
> > Uli
> >=20
> > --=20
> > 'The box said, 'Requires Windows 95 or better', so i=20
> installed Linux - TKK 5
> >=20
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=20
> --=20
>=20
> Regards,
> Heinz    -- The LVM Guy --
>=20
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>=20
> =
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
> Heinz Mauelshagen                                 Sistina=20
> Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=20
