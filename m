Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2VKwuj11781
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 15:58:56 -0500
Received: from mwinf0602.wanadoo.fr (smtp6.wanadoo.fr [193.252.22.25])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2VKws1X011761
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 15:58:54 -0500
Received: from tangerine.coulon.evette
	(ADijon-107-1-14-179.w81-250.abo.wanadoo.fr [81.250.95.179])
	by mwinf0602.wanadoo.fr (SMTP Server) with ESMTP id 6AB995400570
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 22:58:48 +0200 (CEST)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.30) id 1B8mnO-0001V0-H9
	for linux-lvm@redhat.com; Wed, 31 Mar 2004 22:58:46 +0200
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04502-07 for <linux-lvm@redhat.com>;
	Wed, 31 Mar 2004 22:58:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.30) id 1B8mn5-0001Ug-Lk
	for linux-lvm@redhat.com; Wed, 31 Mar 2004 22:58:27 +0200
Date: Wed, 31 Mar 2004 22:58:27 +0200
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: =?iso-8859-1?B?UmWg?=
	=?iso-8859-1?Q?=3A?= [linux-lvm] lvm 1 unable to boot
Message-ID: <20040331205827.GG3591@tangerine.coulon.evette>
References: <1080745179.12286.16.camel@lupin.private.cimr.cam.ac.uk>
	<20040331154915.GD27360@tykepenguin.com>
	<1080765764.12286.20.camel@lupin.private.cimr.cam.ac.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="5p8PegU4iirBW1oA"
Content-Disposition: inline
In-Reply-To: <1080765764.12286.20.camel@lupin.private.cimr.cam.ac.uk> (from
	geoff.dolman@cimr.cam.ac.uk on mer, mar 31,
	2004 at 22:42:44 +0200)
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


--5p8PegU4iirBW1oA
Content-Type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 31.03.2004 22:42, Geoff Dolman a =E9crit=A0:
>On Wed, 2004-03-31 at 16:49, Patrick Caulfield wrote:
>> On Wed, Mar 31, 2004 at 03:59:39PM +0100, Geoff Dolman wrote:
>> > Hi

[.. destructive compression ..]

>>
>> Error 28 is ENOSPC - your initrd is too small to hold the metadata
>backups.
>
>Thanks - but how do I fix this?

If you use lvmcreate_initrd, it calculates automatically the size of =20
the filesystem underlaying the initrd.


--
		- Jean-Luc
>
>cheers
>
>Geoff
>

--5p8PegU4iirBW1oA
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAazDzUdGGXzzGnNARAj1SAJsE8QqsX4YVf1xFxljMeo9G3jN5LACff1ya
hH1eOoJMipqOcva2TXlQD6I=
=mkQb
-----END PGP SIGNATURE-----

--5p8PegU4iirBW1oA--
