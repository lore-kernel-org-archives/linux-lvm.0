From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM and Multipathing
Message-ID: <20020911122149.A26854@sistina.com>
References: <079C252313DA1542915D6BB549A93038140C85@vcgmuc03.devcg.local>
Mime-Version: 1.0
In-Reply-To: <079C252313DA1542915D6BB549A93038140C85@vcgmuc03.devcg.local>; from Sebastian.Wormser@vcg.ag on Tue, Sep 10, 2002 at 04:09:00PM +0200
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
Date: Wed Sep 11 05:43:25 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@sistina.com

On Tue, Sep 10, 2002 at 04:09:00PM +0200, Wormser, Sebastian wrote:
> Hi,
>=20
> I am trying to find some information about the inclusion
> of multipathing capabilities into LVM.
>=20
> The most recent information I found in the mail archives was
> from Heinz Mauelshagen back in April 2001, saying that it might
> be included during summer 2001. Did this happen?

Sorry, not so far. We still want to have it this year in LVM2 though ;-)

Today your option is to put MD below LVM and use its multipathed devices =
as PVs.
There's a patch from the IBM z-Series people for LVM1 as well, but this
is under legal torture and not yet released publically AFAIK.

>=20
> Thank you very much for any enlightenment.
>=20
> Best regards,
>=20
>   Sebastian Wormser
>=20
>=20
> --=20
> Sebastian Wormser                  eMail:  sebastian.wormser@vcg.ag
> VCG AG                             Office: +49- (0) 89 - 54 80 75 10
> IT Consulting & Solutions          Fax:    +49- (0) 89 =96 54 80 75 11
> Schwabener Weg 1
> 85551 Kirchheim b. M=FCnchen         web:    http://www.vcg.ag
>=20
>=20

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
