Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j19EFdO27675
	for <linux-lvm@redhat.com>; Wed, 9 Feb 2005 09:15:39 -0500
Received: from smtp4.wanadoo.fr (smtp4.wanadoo.fr [193.252.22.27])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j19EFbW8024406
	for <linux-lvm@redhat.com>; Wed, 9 Feb 2005 09:15:37 -0500
Received: from me-wanadoo.net (unknown [127.0.0.1])
	by mwinf0408.wanadoo.fr (SMTP Server) with ESMTP id 157B01C00190
	for <linux-lvm@redhat.com>; Wed,  9 Feb 2005 15:15:27 +0100 (CET)
Received: from tangerine-64.coulon.evette
	(ADijon-107-1-24-84.w80-13.abo.wanadoo.fr [80.13.73.84])
	by mwinf0408.wanadoo.fr (SMTP Server) with ESMTP id 86BDB1C0018C
	for <linux-lvm@redhat.com>; Wed,  9 Feb 2005 15:15:26 +0100 (CET)
Received: from localhost ([127.0.0.1])
	by tangerine-64.coulon.evette with esmtp (Exim 4.44)
	id 1Cyscl-0003kf-1G
	for linux-lvm@redhat.com; Wed, 09 Feb 2005 15:15:23 +0100
Received: from tangerine-64.coulon.evette ([127.0.0.1])
	by localhost (tangerine-64 [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14337-01 for <linux-lvm@redhat.com>;
	Wed, 9 Feb 2005 15:15:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=tangerine-64)
	by tangerine-64.coulon.evette with esmtp (Exim 4.44)
	id 1Cyscb-0003kF-DP
	for linux-lvm@redhat.com; Wed, 09 Feb 2005 15:15:13 +0100
Date: Wed, 09 Feb 2005 14:15:13 +0000
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: Re: [linux-lvm] moving LVM to a new box
References: <000701c50eae$503fbd20$911ba8c0@godzilla>
In-Reply-To: <000701c50eae$503fbd20$911ba8c0@godzilla> (from
	sutto.zoltan@rutinsoft.hu on Wed Feb  9 14:50:28 2005)
Message-Id: <1107958513l.12640l.4l@tangerine-64>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-3x//HB85yggvCHVAZvT3"
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

--=-3x//HB85yggvCHVAZvT3
Content-Type: text/plain; charset=ISO-8859-2; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 09.02.2005 14:50:28, Sutto Zoltan a =E9crit=A0:
> I have a newly installed/configured/updated FC3 with LVM2 on a P3 box.
> How can I move this working system to a new P4 box with a larger SATA =20
> disk without reinstalling/upgrading/configuring the whole OS.
>=20
> Any help would be appreciated

If I suppose you can install and boot you old disk in you new system =20
together with the new disk, you can do the following (I suppose the old =20
disk is /dev/hda with a /dev/hda1 partition, and new one /dev/sda with =20
a /dev/sda1 partition, I suppose your volume group is vg0):

make backups  ;-)

- pvcreate /dev/sda1
- vgextend vg0 /dev/sda1
- move all the lv data with pvmove /dev/hda1.
- vgreduce vg0 /dev/hda2
- you will have to configure lilo/grub to install and point on your new =20
disk.

I've done such a way but it was not with lvm2. Maybe there are some =20
pvmove issues with lvm2.

> Zoltan Sutto

Jean-Luc

--=-3x//HB85yggvCHVAZvT3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBCChrxUdGGXzzGnNARAiTvAJ93JneSw5W9+pjCMoT78g7ClQpGgACfVKO3
82ay1mWkMnJjs6lFPtJDgZk=
=NDbL
-----END PGP SIGNATURE-----

--=-3x//HB85yggvCHVAZvT3--
