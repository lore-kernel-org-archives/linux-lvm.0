Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBN9om121712
	for <linux-lvm@redhat.com>; Fri, 23 Dec 2005 04:50:48 -0500
Received: from smtp13.wanadoo.fr (smtp13.wanadoo.fr [193.252.22.54])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBN9ofb9010296
	for <linux-lvm@redhat.com>; Fri, 23 Dec 2005 04:50:41 -0500
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf1302.wanadoo.fr (SMTP Server) with ESMTP id A7F697000085
	for <linux-lvm@redhat.com>; Fri, 23 Dec 2005 10:50:31 +0100 (CET)
Date: Fri, 23 Dec 2005 10:50:21 +0100
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: Re: [linux-lvm] a question about lvm in linux
References: <20051222131023.2E6280035DF3@relay.vip.sohu.com>
In-Reply-To: <20051222131023.2E6280035DF3@relay.vip.sohu.com> (from
	alexli@vip.sohu.com on Thu Dec 22 14:10:12 2005)
Message-Id: <1135331421l.10188l.1l@tangerine>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-S/KzEPt6ZsxqHotwLiFl"
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
Cc: Linux-LVM@Sistina.com

--=-S/KzEPt6ZsxqHotwLiFl
Content-Type: text/plain; charset=iso-8859-15; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Alex,

Le 22.12.2005 14:10:12, alexli a =E9crit=A0:
> Hello ,I am a linux user, because I am a Chinese ,so my English is not
> good
> ,please forgive me for language mistake. after I used the command
> -----
> lvextend ,I find that the logical volumn space is changed .but after I
> mount
> it to the file  system , and use the df command to see the filesystem,
> I
> find that the space of the file system is not changed .
>=20
> I see your mail address in the "man lvextend" , and find that you are
> the
> author , so I wonder whether you can help me with this problem.

The adress you have found is the address of a mailing list. sistina has =20
created the lvm system. Now this have moved to redhat et the mailing =20
list adress is linux-lvm@redhat.com

About your problem, when you want to extend a filsystem which is on a =20
logical volume, you need to:
- expand the logical volume first
- then expand the filesystem itself

lxextend command only extend the logical volume, not the filesystem.

For instance, in case of an xfs filesystem, the command to use is =20
xfs_growfs.

There are command for most of the filesystems. Some have resctrictions =20
: xfs cannot be schrink and must be mounted before expanded.

>=20
> Thank you
>=20
>=20
>=20
> Alex li

Best regards

Jean-Luc

--=-S/KzEPt6ZsxqHotwLiFl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBDq8hdUdGGXzzGnNARAjfRAKCUmfUFHss42/fLW0arrExScp91CQCfXfPV
hbtVJTBE3whcMJwfLS9zBEU=
=SgjH
-----END PGP SIGNATURE-----

--=-S/KzEPt6ZsxqHotwLiFl--
