Return-Path: <jdiehl@sandia.gov>
Message-ID: <B51F0C636E578A4E832D3958690CD73E0130BFC2@es04snlnt>
From: "Diehl, Jeffrey" <jdiehl@sandia.gov>
Subject: RE: [linux-lvm] Renumbered drives hosed VG.
Date: Wed, 15 Aug 2001 14:50:20 -0600
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

Thanx, I'll look into this.

Mike Diehl,
Network Monitoring Tool Devl.
Sandia National Laboratories.
(505) 284-3137
jdiehl@sandia.gov

> -----Original Message-----
> From: Jos=E9 Luis Domingo L=F3pez [mailto:jdomingo@internautas.org]
> Sent: August 15, 2001 5:07 AM
> To: 'linux-lvm@sistina.com'
> Subject: Re: [linux-lvm] Renumbered drives hosed VG.
>=20
>=20
> On Tuesday, 14 August 2001, at 14:52:17 -0600,
> Diehl, Jeffrey wrote:
>=20
> > Hi all,
> >=20
> > I recently upgraded from a modular kernel to a monolithic=20
> kernel, which
> > renumbered all of my drives.  sda became sdb, sdb became=20
> sdc and adc became
> > sda, etc.  Now one of my VG's is hosed.  How do I recover from =
this?
> >=20
> Don't know to recover from this, but if I had several hard disk on my
> server and something depended on the kernel detecting them in order, =
I
> would try using devfs (device filesystem).
>=20
> Is not that hard to setup, seems stable by now and you will=20
> never get your
> disks messed again. Under devfs naming, a SCSI disk is=20
> identified by the
> adapter and bus where it is attached, and by its SCSI and LUN=20
> numbers (the
> "same" for IDE disks). So the kernel will always identify the=20
> disks in the
> same way.
>=20
> For example my master disk on the primary IDE channel is:
> /dev/ide/host0/bus0/target0/lun0
> An my root partition on this disk is:
> /dev/ide/host0/bus0/target0/lun0/p3
>=20
> Regards.
>=20
> --=20
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
