Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1LKp5K11634
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2005 15:51:05 -0500
Received: from smtp12.wanadoo.fr (smtp12.wanadoo.fr [193.252.22.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1LKp3fZ019452
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2005 15:51:03 -0500
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf1207.wanadoo.fr (SMTP Server) with ESMTP id 7B79B1C000E2
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2005 21:50:57 +0100 (CET)
Received: from tangerine.coulon.evette
	(ADijon-151-1-26-249.w83-194.abo.wanadoo.fr [83.194.122.249])
	by mwinf1207.wanadoo.fr (SMTP Server) with ESMTP id BFB9B1C000AD
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2005 21:50:55 +0100 (CET)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.44) id 1D3KVx-0004el-IG
	for linux-lvm@redhat.com; Mon, 21 Feb 2005 21:50:45 +0100
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16974-01 for <linux-lvm@redhat.com>;
	Mon, 21 Feb 2005 21:50:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.44) id 1D3KVo-0004eN-VG
	for linux-lvm@redhat.com; Mon, 21 Feb 2005 21:50:36 +0100
Date: Mon, 21 Feb 2005 20:50:36 +0000
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: Re: [linux-lvm] bootloader questions
References: <1109018274.4532.14.camel@rich>
In-Reply-To: <1109018274.4532.14.camel@rich> (from rich@storix.com on Mon
	Feb 21 21:37:54 2005)
Message-Id: <1109019036l.14910l.1l@tangerine>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-V5awt/RUhlbig03hjLnU"
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
To: linux-lvm@redhat.com

--=-V5awt/RUhlbig03hjLnU
Content-Type: text/plain; charset=ISO-8859-15; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 21.02.2005 21:37:54, rich turner a =E9crit=A0:
> if i have root(/) on a logical volume, is it required that i have
> /boot
> on a separate filesystem? does /boot have to be a partition?
>=20
> the boot loaders i need to support are lilo and grub. do the answers
> to
> the above question vary if i use lilo or grub?


both lilo and grub can boot the root filesystem as a logical volume.

but grub cannot boot /boot from a logical volume.
With lilo it can either be a separate lv, a partition, a disk, what you =20
what. With grub it should be outside of the logical volume manager =20
(IIRC, there is a patch for grub to use /boot on a LV but I've never =20
found/tried it)


>=20
> thanks for the help

Regards

Jean-Luc

--=-V5awt/RUhlbig03hjLnU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCGkmcUdGGXzzGnNARAn77AJ4qzCftEJNNYZSuRUwJcrL+fqE58ACeLaVr
x/G49yfNChyqCVqw/mF6VO4=
=WfF9
-----END PGP SIGNATURE-----

--=-V5awt/RUhlbig03hjLnU--
