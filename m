Return-Path: <Robert_Macaulay@Dell.com>
Message-ID: <8F120FA493CAD743B30EEB8F356985B54FD904@AUSXMBT102VS1.amer.dell.com>
From: Robert_Macaulay@Dell.com
Subject: RE: [linux-lvm] HowTo: EIDE/ATA-100 + RAID 1 + LVM
Date: Mon, 2 Jul 2001 10:54:07 -0500 
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
To: linux-lvm@sistina.com

Just an update. Once I went back to HW raid 1, my problems vanished. It
could still very well be the BIGMEM interacting with RAID 1. The large =
RAM
ammount doesn't hurt LVM at all(as far I I have seen so far).

> -----Original Message-----
> From: Jos=E9 Luis Domingo L=F3pez [mailto:jdomingo@internautas.org]
> Sent: Thursday, June 28, 2001 7:57 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] HowTo: EIDE/ATA-100 + RAID 1 + LVM
>=20
>=20
> On Thursday, 28 June 2001, at 16:46:10 -0500,
> Robert_Macaulay@Dell.com wrote:
>=20
> > About the Raid 1.
> > [...]
> > I know I changed 2 variables(RAM and RAID). I'm going to go=20
> back to HW raid
> > 1 for now, and see if it makes a difference.
> >=20
> I would choose hardware RAID instead os software RAID: this=20
> reduces CPU
> overhead on the server, and avoids performance problems due=20
> to excesive
> layering of "block devices".
>=20
> 2.4.x isn't "productoin quality" yet on some kinds of=20
> hardware, specially
> those SMP machines with lots of RAM (requiring BIGMEM). That=20
> seems to be
> your case, and is a known and (hopefully) soon-to-be-solved problem.
>=20
> --
> Jos=E9 Luis Domingo L=F3pez
> Linux Registered User #189436     Debian GNU/Linux Potato=20
> (P166 64 MB RAM)
> =20
> jdomingo EN internautas PUNTO org  =3D> =BF Spam ? Atente a las=20
> consecuencias
> jdomingo AT internautas DOT   org  =3D> Spam at your own risk
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=20
