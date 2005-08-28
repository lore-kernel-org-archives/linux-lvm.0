Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7SCMKV28612
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 08:22:20 -0400
Received: from smtp11.wanadoo.fr (smtp11.wanadoo.fr [193.252.22.31])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7SCMBw5003982
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 08:22:12 -0400
Received: from smtp11.wanadoo.fr (mwinf1108 [172.22.142.38])
	by mwinf1110.wanadoo.fr (SMTP Server) with ESMTP id 9A8A81C0069A
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 13:43:05 +0200 (CEST)
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf1108.wanadoo.fr (SMTP Server) with ESMTP id 405191C0009E
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 13:42:43 +0200 (CEST)
Received: from tangerine.coulon.evette
	(ADijon-256-1-52-247.w81-51.abo.wanadoo.fr [81.51.67.247])
	by mwinf1108.wanadoo.fr (SMTP Server) with ESMTP id 0A1281C0008D
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 13:42:43 +0200 (CEST)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.52) id 1E9LYg-0006sA-EW
	for linux-lvm@redhat.com; Sun, 28 Aug 2005 13:42:42 +0200
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24316-06 for <linux-lvm@redhat.com>;
	Sun, 28 Aug 2005 13:42:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.52) id 1E9LYX-0006rp-Vh
	for linux-lvm@redhat.com; Sun, 28 Aug 2005 13:42:33 +0200
Date: Sun, 28 Aug 2005 11:42:33 +0000
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: Re: [linux-lvm] vgscan & CDROM
References: <20050828101721.GB26065@gutek>
	<1125227257.2225.63.camel@pc7.dolda2000.com>
In-Reply-To: <1125227257.2225.63.camel@pc7.dolda2000.com> (from
	fredrik@dolda2000.com on Sun Aug 28 13:07:37 2005)
Message-Id: <1125229353l.13661l.6l@tangerine>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-P6+xRG6CE0qwikLslqQs"
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

--=-P6+xRG6CE0qwikLslqQs
Content-Type: text/plain; charset=iso-8859-15; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 28.08.2005 13:07:37, Fredrik Tolf a =E9crit=A0:
> On Sun, 2005-08-28 at 12:17 +0200, Chris Osicki wrote:
> > Hi
> >
> > I seam not to be able to convince vgscan to let my cdroms alone.
> > In the file /etc/lvm/lvm.conf I have this filter:
> >
> > [ "r|/dev/cdrom.*" ]
>=20
> Try it without the dot:
> [ "r|/dev/cdrom*" ]
   [ "r|/dev/cdrom*|"] maybe ?

You can even be more restrictive/explicit:
filter =3D [ "r|/dev/cdrom*|", "r|/dev/cdrw*|", "r|/dev/dvd*|", =20
"r|/dev/hd[ab]|" ]

(my drives are /dev/hda and /dev/hdb)
>=20
> The /dev/cdrom* devices don't usually contain a dot, unless you've
> changed your udev rules. Judging from your output of `vgscan -v -v',
> however, it seems that you haven't done so.
>=20
> Hope it helps,
> Fredrik Tolf

Jean-Luc

--=-P6+xRG6CE0qwikLslqQs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDEaMpUdGGXzzGnNARAolEAJ9Sfr1bhhloW3HgH+9htyzScrrcTwCfRnS2
6WR5OhZ8CYzO/M3DLZNnvSo=
=SM4w
-----END PGP SIGNATURE-----

--=-P6+xRG6CE0qwikLslqQs--
