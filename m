Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j22JYGK30388
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 14:34:16 -0500
Received: from smtp6.wanadoo.fr (smtp6.wanadoo.fr [193.252.22.25])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j22JYAua020474
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 14:34:10 -0500
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf0612.wanadoo.fr (SMTP Server) with ESMTP id A65111C0014E
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2005 20:34:04 +0100 (CET)
Received: from tangerine.coulon.evette
	(ADijon-151-1-24-166.w83-194.abo.wanadoo.fr [83.194.120.166])
	by mwinf0612.wanadoo.fr (SMTP Server) with ESMTP id 5AAAC1C0013F
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2005 20:34:04 +0100 (CET)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.50) id 1D6Zbf-0001OJ-TH
	for linux-lvm@redhat.com; Wed, 02 Mar 2005 20:34:03 +0100
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04274-10 for <linux-lvm@redhat.com>;
	Wed, 2 Mar 2005 20:33:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.50) id 1D6ZbW-0001Nu-Sj
	for linux-lvm@redhat.com; Wed, 02 Mar 2005 20:33:54 +0100
Date: Wed, 02 Mar 2005 19:33:54 +0000
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: Re: [linux-lvm] Partition table gone? Any way to restore?
References: <4225FBC8.9020904@are-b.org> <20050302174819.GN17589@lug-owl.de>
	<4225FEBC.2060505@are-b.org> <20050302180537.GO17589@lug-owl.de>
	<42260F1B.2030803@are-b.org> <1109791034l.28794l.3l@tangerine>
	<4226135E.9060303@are-b.org>
In-Reply-To: <4226135E.9060303@are-b.org> (from oliver@are-b.org on Wed Mar 2
	20:26:22 2005)
Message-Id: <1109792034l.28794l.4l@tangerine>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-lBAXsjfe2h2ME0tjQblK"
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

--=-lBAXsjfe2h2ME0tjQblK
Content-Type: text/plain; charset=iso-8859-1; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 02.03.2005 20:26:22, oliver a =E9crit=A0:
> Thanks! However the partition is fine and fit so I should be able to =20
> dd everything off of it.
>=20
> The output of gpart was the following:
> root@enterprise:~# gpart -w hmlvm,1.5 /dev/hde
>=20
> Begin scan...
> Possible partition(ReiserFS filesystem), size(50431mb), offset(14mb)
>=20
> * Warning: short read near sector(120103011), 64512 bytes instead of =20
> 66048. Skipp
> ing...
> End scan.
>=20
> Checking partitions...
> Partition(Linux ext2 filesystem): primary
> Ok.
>=20
> Guessed primary partition table:
> Primary partition(1)
>   type: 131(0x83)(Linux ext2 filesystem)
>   size: 50431mb #s(103284656) s(29799-103314454)
>   chs:  (29/9/1)-(1023/15/63)d (29/9/1)-(102494/7/62)r
>=20
> Primary partition(2)
>   type: 000(0x00)(unused)
>   size: 0mb #s(0) s(0-0)
>   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r
> <snip> part 3 and 4 where 'unused'.
>=20
> Now gpart found something, however not the missing LVM PV i was =20
> hoping. Or atleast, I don't think so. I will google around to see how =20
> to make a 1 on 1 copy of this disk, and then try to write it. I'll =20
> report back. In the mean time, keep those ideas comming : )
>=20

Just an idea, be careful, it is not the *truth* as I have not tested it =20
yet.

Here is what I *think* :
The partition type is no matter for lvm.
Recover the partition as you like then do a fdisk to change the =20
partition type to 8E ... and see (or pray)

J-L

( ... ]

--=-lBAXsjfe2h2ME0tjQblK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCJhUiUdGGXzzGnNARAspCAJ9nxCQSqlB0DEyeSm3oBB8DedkmwACfaeUW
oVMbeYO74K6gn6nx2iZ7mYk=
=VGY9
-----END PGP SIGNATURE-----

--=-lBAXsjfe2h2ME0tjQblK--
