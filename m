Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A643423@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] FW: LVM on Linux
Date: Mon, 16 Jul 2001 18:26:50 -0500
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Thanks for the clarification. I didn't see the start of this thread I =
don't
think, If I did, I was out to lunch.:)=20
At any rate the 32/64 bit numbering issue is explained very well here, =
and
there is more commentary over on the XFS list too.=20
Another thing is also that I believe people are already using Fibre =
storage
with LVM. No? Anyone?

--=20
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com=20

> -----Original Message-----
> From: Ragnar Kj=F8rstad [mailto:lvm@ragnark.vestdata.no]
> Sent: Monday, July 16, 2001 4:10 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] FW: LVM on Linux
>=20
>=20
> On Mon, Jul 16, 2001 at 03:42:00PM -0500, Gonyou, Austin wrote:
> > I think ELVM at the bottom is EVMS. I wish I knew where the=20
> original article
> > was, cause I'd like to know what 64bit frame he's talking=20
> about. Currently
> > I'm using LVM for striping, and plan to use it with Fibre.=20
> From what I
> > understand on this list, is that others are using it on=20
> fibre already. So,
> > if they are using a 2.4 kernel, with fibre, wouldn't that=20
> mean that they'd
> > need to employ 64-bit access(if they use a 64-bit=20
> controller+driver?)
>=20
> I'm not sure what you mean here.
>=20
> The 32/64 bit question in this thread was the datatype used to store
> sector-numbers; the effect of using 32bit is that it limits the
> device-size to 1 (2) TB.
>=20
> If you're talking about 64 bit PCI busses and such; this is totally
> unrelated.
>=20
> And yes, we'd like to use LVM on FibreChannel devices, and=20
> need 64 bit=20
> sector numbers :)
>=20
>=20
> --=20
> Ragnar Kjorstad
> Big Storage
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=20
