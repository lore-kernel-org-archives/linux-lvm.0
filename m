From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM and Multipathing
Message-ID: <20020911141018.A27333@sistina.com>
References: <079C252313DA1542915D6BB549A93038140C87@vcgmuc03.devcg.local>
Mime-Version: 1.0
In-Reply-To: <079C252313DA1542915D6BB549A93038140C87@vcgmuc03.devcg.local>; from Sebastian.Wormser@vcg.ag on Wed, Sep 11, 2002 at 02:20:42PM +0200
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
Date: Wed Sep 11 07:29:33 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Wed, Sep 11, 2002 at 02:20:42PM +0200, Wormser, Sebastian wrote:
>=20
> Hello Heinz,
>=20
> thanks for the information. I'll look into the MD-approach.
>=20
> I assume that the IBM patch to LVM1 is the patch that Stefan
> Baader was talking about, right?

Exactly.

>=20
> Sebastian Wormser                      sebastian.wormser@vcg.ag
> VCG AG                                =20
> IT Consulting & Solutions              http://www.vcg.ag
> Schwabener Weg 1                       Office: +49- (0) 89 - 54 80 75 0
> 85551 Kirchheim b. M=FCnchen             Fax:    +49- (0) 89 - 54 80 75=
 11
>=20
> -----Original Message-----
> From:	Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com]
> Sent:	Wed 2002-09-11 12:21
> To:	linux-lvm@sistina.com
> Cc:=09
> Subject:	Re: [linux-lvm] LVM and Multipathing
> On Tue, Sep 10, 2002 at 04:09:00PM +0200, Wormser, Sebastian wrote:
> > Hi,
> >=20
> > I am trying to find some information about the inclusion
> > of multipathing capabilities into LVM.
> >=20
> > The most recent information I found in the mail archives was
> > from Heinz Mauelshagen back in April 2001, saying that it might
> > be included during summer 2001. Did this happen?
>=20
> Sorry, not so far. We still want to have it this year in LVM2 though ;-=
)
>=20
> Today your option is to put MD below LVM and use its multipathed device=
s as PVs.
> There's a patch from the IBM z-Series people for LVM1 as well, but this
> is under legal torture and not yet released publically AFAIK.
>=20

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
