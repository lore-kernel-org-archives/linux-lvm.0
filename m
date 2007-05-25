Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4PLGxau028333
	for <linux-lvm@redhat.com>; Fri, 25 May 2007 17:16:59 -0400
Received: from huixtocihuatl.xenguest.geekspirit.net
	(mictlantecuhtli.geekspirit.net [81.56.52.126])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l4PLGs7L008546
	for <linux-lvm@redhat.com>; Fri, 25 May 2007 17:16:55 -0400
Received: from localhost (mictecacihuatl.xenguest.geekspirit.net
	[172.24.42.55])
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	6801A71531
	for <linux-lvm@redhat.com>; Fri, 25 May 2007 23:16:49 +0200 (CEST)
Received: from huixtocihuatl.xenguest.geekspirit.net ([172.24.42.53])
	by localhost (mictecacihuatl.xenguest.geekspirit.net [172.24.42.55])
	(amavisd-new, port 10024)
	with ESMTP id tyIgusQ2hsY5 for <linux-lvm@redhat.com>;
	Fri, 25 May 2007 23:16:46 +0200 (CEST)
Received: from [172.24.42.200] (soda.rider.geekspirit.net [172.24.42.200])
	(Authenticated sender: rider)
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	7911271528
	for <linux-lvm@redhat.com>; Fri, 25 May 2007 23:16:46 +0200 (CEST)
Subject: Re: [linux-lvm] want to remove a disk
From: Fabien Jakimowicz <fabien@jakimowicz.com>
In-Reply-To: <006401c79eee$a79f79c0$6401a8c0@alelab7bd24fec>
References: <006401c79eee$a79f79c0$6401a8c0@alelab7bd24fec>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-vFim3GRE1SwSjBaav/8j"
Date: Fri, 25 May 2007 23:16:26 +0200
Message-Id: <1180127786.16219.15.camel@soda.rider.geekspirit.net>
Mime-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-vFim3GRE1SwSjBaav/8j
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2007-05-25 at 14:03 -0300, Alejandro Santillan wrote:
> I installed a new fedora box with 2 hard disks. The system disk and a
> second one to be used to backup and get information out of the
> machine.
> The problem was that inadvertely the disks mounted in a lvm
> configuration as follows:
> =20
> =20
> [root@s2]# df
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/mapper/VolGroup00-LogVol00
>                      150202484  56184212  86265364  40% /
> /dev/sda1               101086     10442     85425  11% /boot
> tmpfs                   250336         0    250336   0% /dev/shm
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> So now I cannot remove the 2nd disk without disrupting the system.=20
> Can I use=20
> lvremove or lvchange
> doing lvdisplay shows:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> [root@s2]# /usr/sbin/lvdisplay
>   --- Logical volume ---
>   LV Name                /dev/VolGroup00/LogVol00
>   VG Name                VolGroup00
>   LV UUID                AG2uKb-0VMO-5qn4-T2LK-cjM8-mZbh-jETkyx
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                147.88 GB
>   Current LE             4732
>   Segments               2
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           253:0
> =20
>   --- Logical volume ---
>   LV Name                /dev/VolGroup00/LogVol01
>   VG Name                VolGroup00
>   LV UUID                8Q6XKF-bz8D-vcan-Izf9-Ntzn-XmYv-9WAi5g
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                992.00 MB
>   Current LE             31
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           253:1
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> which command should I use to leave all information on the /dev/sda1
> and be able to take out the other disk?
> =20
You should give more informations, like where does VG VolGroup00 stands
(sda1 ?). Try the following :
vgdisplay
pvdisplay
--=20
Fabien Jakimowicz <fabien@jakimowicz.com>

--=-vFim3GRE1SwSjBaav/8j
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4 (GNU/Linux)

iD8DBQBGV1IqzTD+AjVP2VIRAuXdAJ9NWVGZ9cvbLyACM1hkjTsLFggAYACfZGHt
/SHAYZ62Y8tIkZePd23nAbY=
=Eptz
-----END PGP SIGNATURE-----

--=-vFim3GRE1SwSjBaav/8j--
