Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8LG6rr15832
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2004 12:06:53 -0400
Received: from mwinf0612.wanadoo.fr (smtp6.wanadoo.fr [193.252.22.25])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8LG6p3v006710
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2004 12:06:51 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf0612.wanadoo.fr (SMTP Server) with SMTP id C1EB21800158
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2004 18:06:45 +0200 (CEST)
Received: from tangerine.coulon.evette
	(ADijon-107-1-3-62.w81-48.abo.wanadoo.fr [81.48.28.62])
	by mwinf0612.wanadoo.fr (SMTP Server) with ESMTP id B4AFA180013E
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2004 18:06:43 +0200 (CEST)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.34) id 1C9nA7-0001g6-6h
	for linux-lvm@redhat.com; Tue, 21 Sep 2004 18:06:39 +0200
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04566-07 for <linux-lvm@redhat.com>;
	Tue, 21 Sep 2004 18:06:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.34) id 1C9nA5-0001fx-2A
	for linux-lvm@redhat.com; Tue, 21 Sep 2004 18:06:37 +0200
Date: Tue, 21 Sep 2004 16:06:23 +0000
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: Re: [linux-lvm] Hello. About a bug in lvm2
References: <41504CEF.8090508@cisko.org>
In-Reply-To: <41504CEF.8090508@cisko.org> (from zibbe@cisko.org on Tue Sep
	21 17:46:55 2004)
Message-Id: <1095782795l.20340l.2l@tangerine>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	boundary="=-s5SkVJdHMsggouu9tR1y"; micalg=PGP-SHA1
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--=-s5SkVJdHMsggouu9tR1y
Content-Type: text/plain; charset=ISO-8859-1; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 21.09.2004 17:46:55, Sebastian Hyrwall a =E9crit=A0:
> Hey.
>=20
> Im not sure but i may have found a bug in the lvm2 userspace-tools. =20
> Im using gentoo right now and right now
> lvm2 cant "see" some harddrives.
>=20
> I first discovered the problem when i changed from 2.4 -> 2.6. In 2.6 =20
> it didnt find all my discs. Later on i saw that when i did
> "pvcreate /dev/hdd1" (tried the devfs-link also /dev/ide/....) it =20
> reported that the device couldnt be found.
> There isnt anything wrong with the hd or anything. It shows up in =20
> cfdisk/fdisk and i can use it as a normal hd (not in an lvm).
>=20
> This occurs for 2 of my disks. hde and hdd. I cant find any =20
> difference between them and the other drives. They are all the same =20
> size.
>=20
>=20
> Unfortunently i cant provide any more information because i didnt =20
> think about mailing this to you until after i went back to 2.4.

Do you have configured properly your kernel for lvm support?
Do you have lvm2 package(s)?
Did you setup properly your /etc/lvm/lvm.conf?

Regard

Jean-Luc

>=20
>=20
> Sincerely, Sebastian Hyrwall
=20

--=-s5SkVJdHMsggouu9tR1y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBUFGLUdGGXzzGnNARApJkAJ0QzgR2rrnoK6yzR/ZiqppKy3IEhQCfVsAD
U1eUienW3IWxqHLUTuBNDRg=
=+X2H
-----END PGP SIGNATURE-----

--=-s5SkVJdHMsggouu9tR1y--
