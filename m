From: Werner John <john@oswf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <15310.40503.356813.663284@rigel.oswf.de>
Date: Thu, 18 Oct 2001 11:17:43 +0200
Subject: Re: [linux-lvm] Horrid performance with 2.4.{9,10,12} + LVM + ReiserFS
In-Reply-To: <20011018000006.A22777@jensbenecke.de>
References: <20011018000006.A22777@jensbenecke.de>
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
Content-Type: text/plain; charset="ibm855"
To: linux-lvm@sistina.com

Jens Benecke writes:
> Hello,

Hello,

> this is CC'ed to LVM user list and ReiserFS because I don't know who =
to
> blame currently. ;)
>=20
lets, see ...
>=20
> I have severe performance problems with a 210G ReiserFS volume sittin=
g on a
> LVM (1.0.1rc4) spread over three disks (Maxtor 60, 80, 80GB IDE). The=

> system is a Duron 650MHz with via686b chipset and UDMA-100 capable ID=
E.
> /proc/cpuinfo, /proc/ide/via output see below. The hardware seems
> performant enough to me.
> [...]
>=20
> ---------------------------------------------------------------------=
------
> hdparm output for the three disks:
>=20
> server: /home# hdparm -tT /dev/hd[abcd]
> /dev/hda:
>  Timing buffer-cache reads:   128 MB in  0.86 seconds =3D148.84 MB/se=
c
>  Timing buffered disk reads:  64 MB in  2.12 seconds =3D 30.19 MB/sec=

> /dev/hdc:
>  Timing buffer-cache reads:   128 MB in  0.84 seconds =3D152.38 MB/se=
c
>  Timing buffered disk reads:  64 MB in  2.28 seconds =3D 28.07 MB/sec=

> /dev/hdd:
>  Timing buffer-cache reads:   128 MB in  0.86 seconds =3D148.84 MB/se=
c
>  Timing buffered disk reads:  64 MB in  2.36 seconds =3D 27.12 MB/sec=


Well, you have 1 disk on a single channel (hda) and the other two as ma=
ster
and slave on *one* channel. That's the bottleneck. If the disks are
accessed individually, you get the full performance (more or less). But=
 if
*both* disks have to respond, performance drops horribly.

Best is to get a third IDE controller.

Yours,
=09Werner

>=20
>=20
> bonnie++ output for the LVM volume: ---------------------------------=
------
> Version 1.01d       ------Sequential Output------ --Sequential Input-=
 --Random-
>                     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block--=
 --Seeks--
> Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP=
  /sec %CP
> server         256M  5596  97 24539  34  6926   7  5194  87 24662  17=
 115.1 1
>                     ------Sequential Create------ --------Random Crea=
te--------
>                     -Create-- --Read--- -Delete-- -Create-- --Read---=
 -Delete--
>               files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP=
  /sec %CP
>                  16  7965  99 +++++ +++ 10546  99  5458  92 +++++ +++=
  8214 90
> server,256M,5596,97,24539,34,6926,7,5194,87,24662,17,115.1,1,16,7965,=
99,+++++,++
> ---------------------------------------------------------------------=
------
>=20
>=20
>=20
>=20
> --=20
> Jens Benecke =B7=B7=B7=B7=B7=B7=B7=B7 http://www.hitchhikers.de/ - Eu=
ropas Mitfahrzentrale
>=20
> Crypto regulations will only hinder criminals who obey the law.
>=20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=

> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
