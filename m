Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0UHERO07590
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 12:14:27 -0500
Received: from smtp6.wanadoo.fr (smtp6.wanadoo.fr [193.252.22.25])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0UHELQJ032538
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 12:14:21 -0500
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf0608.wanadoo.fr (SMTP Server) with ESMTP id B0E691C001EA
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 18:14:15 +0100 (CET)
Received: from tangerine-64.coulon.evette
	(APlessis-Bouchard-102-1-3-91.w80-11.abo.wanadoo.fr [80.11.44.91])
	by mwinf0608.wanadoo.fr (SMTP Server) with ESMTP id 8C0E11C0022A
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 18:14:13 +0100 (CET)
Received: from localhost ([127.0.0.1])
	by tangerine-64.coulon.evette with esmtp (Exim 4.44)
	id 1CvIe8-0002nc-So
	for linux-lvm@redhat.com; Sun, 30 Jan 2005 18:14:00 +0100
Received: from tangerine-64.coulon.evette ([127.0.0.1])
	by localhost (tangerine-64 [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10485-04 for <linux-lvm@redhat.com>;
	Sun, 30 Jan 2005 18:13:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=tangerine-64)
	by tangerine-64.coulon.evette with esmtp (Exim 4.44)
	id 1CvIe0-0002nK-O2
	for linux-lvm@redhat.com; Sun, 30 Jan 2005 18:13:52 +0100
Date: Sun, 30 Jan 2005 17:13:52 +0000
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: Re: [linux-lvm] converting ext3 / to LVM
References: <006901c5069a$db39b690$4857fea9@desktop>
	<1107077143l.22995l.0l@tangerine-64>
	<20050130115544.65cfaef3@eric.placeverte.home>
	<1107084645l.24357l.2l@tangerine-64>
	<20050130180008.1f1610ff@eric.placeverte.home>
In-Reply-To: <20050130180008.1f1610ff@eric.placeverte.home> (from
	messmate@free.fr on Sun Jan 30 18:00:08 2005)
Message-Id: <1107105232l.10159l.1l@tangerine-64>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-NsOCqhGGQr7jXJSKvKB6"
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

--=-NsOCqhGGQr7jXJSKvKB6
Content-Type: text/plain; charset=ISO-8859-15; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 30.01.2005 18:00:08, messmate a =E9crit=A0:
> On Sun, 30 Jan 2005 11:30:45 +0000
> "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr> wrote:
>=20
>> Le 30.01.2005 11:55:44, messmate a =E9crit=A0:
>>> On Sun, 30 Jan 2005 09:25:43 +0000
>>> "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr> wrote:
>>>=20
>>>> Le 30.01.2005 08:10:52, matthew zeier a =E9crit=A0:
>>>>>=20
>>>>> Are there any tips on converting an existing ext3 / to LVM?
>>>=20
>>> Be carefull; as I know converting an EXISTING ext3 to LVM loses all
>>> data.
>>> Jean-Luc, can  you confirm this ??
>>=20
>> Tell us *how* you plan to convert it to lvm.
>>=20
>> J-L
>>=20
> Reading section 12.3 on the LVM HowTo; there is no good way migrating
> an
> existing filesystem ( with data) to lvm !

Which HOWTO is this?

Migrating is more a matter of free space than anything else.


> I'm in doubt if LVM is very usefull following what this howto
> recommend.
> EVMS more suitable?
> mess-mate

Jean-Luc

--=-NsOCqhGGQr7jXJSKvKB6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBB/RXQUdGGXzzGnNARAqNAAJkB4CqIEGqTgwnY8SO72wrINsIkNACfY7S3
17trEk2CQbtLpk5jgKRvW8g=
=1f8K
-----END PGP SIGNATURE-----

--=-NsOCqhGGQr7jXJSKvKB6--
