Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j11CF8O11269
	for <linux-lvm@redhat.com>; Tue, 1 Feb 2005 07:15:08 -0500
Received: from smtp6.wanadoo.fr (smtp6.wanadoo.fr [193.252.22.25])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j11CF63M016326
	for <linux-lvm@redhat.com>; Tue, 1 Feb 2005 07:15:06 -0500
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf0606.wanadoo.fr (SMTP Server) with ESMTP id 6CBBB1C0029C
	for <linux-lvm@redhat.com>; Tue,  1 Feb 2005 13:15:00 +0100 (CET)
Received: from tangerine-64.coulon.evette
	(ALyon-209-1-4-72.w217-128.abo.wanadoo.fr [217.128.237.72])
	by mwinf0606.wanadoo.fr (SMTP Server) with ESMTP id 2FA7B1C00281
	for <linux-lvm@redhat.com>; Tue,  1 Feb 2005 13:15:00 +0100 (CET)
Received: from localhost ([127.0.0.1])
	by tangerine-64.coulon.evette with esmtp (Exim 4.44)
	id 1Cvwvq-0002nE-KE
	for linux-lvm@redhat.com; Tue, 01 Feb 2005 13:14:58 +0100
Received: from tangerine-64.coulon.evette ([127.0.0.1])
	by localhost (tangerine-64 [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07586-07 for <linux-lvm@redhat.com>;
	Tue, 1 Feb 2005 13:14:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=tangerine-64)
	by tangerine-64.coulon.evette with esmtp (Exim 4.44)
	id 1Cvwvi-0002mc-0W
	for linux-lvm@redhat.com; Tue, 01 Feb 2005 13:14:50 +0100
Date: Tue, 01 Feb 2005 12:14:39 +0000
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: Re: [linux-lvm] converting ext3 / to LVM
References: <006901c5069a$db39b690$4857fea9@desktop>
	<1107077143l.22995l.0l@tangerine-64>
	<20050130115544.65cfaef3@eric.placeverte.home>
	<1107084645l.24357l.2l@tangerine-64>
	<20050130180420.271340f7@eric.placeverte.home>
	<1107106390l.10159l.2l@tangerine-64>
	<20050130203638.17a5cba3@eric.placeverte.home>
In-Reply-To: <20050130203638.17a5cba3@eric.placeverte.home> (from
	messmate@free.fr on Sun Jan 30 20:36:38 2005)
Message-Id: <1107260089l.10215l.0l@tangerine-64>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-AA1l2v9dmoirL3JSr7iQ"
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

--=-AA1l2v9dmoirL3JSr7iQ
Content-Type: text/plain; charset=ISO-8859-15; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 30.01.2005 20:36:38, messmate a =E9crit=A0:
> On Sun, 30 Jan 2005 17:33:10 +0000
> "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr> wrote:
>=20
[ .. ]
>> I don't find it neither, do you have any reference?
>> http://www.tldp.org/HOWTO/LVM-HOWTO/index.html
> This one :
> http://www.tldp.org/HOWTO/LVM-HOWTO/multpartitions.html
>>=20
>> I've done the migration some time ago from etx3 non LVM to xfs LVM.
>> Only the migration of the root filesystem is a bit tricky. But this =20
>> is
>=20
>> not really more diffult that moving a (non LVM) system to a new HDD.

To be clear:
It is *always* unsafe to move data over partitions
I've done it and never got any problem

But, just is case of, I've backups.


>=20
> mess-mate

Jean-Luc

--=-AA1l2v9dmoirL3JSr7iQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBB/3K5UdGGXzzGnNARAtqUAKCotORf6EKA8zO/8pCq8GxIYDqK4wCgqI2H
e3tIswfuBlCa7I7iT7/uqsE=
=2UCT
-----END PGP SIGNATURE-----

--=-AA1l2v9dmoirL3JSr7iQ--
