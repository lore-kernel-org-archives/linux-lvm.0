Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j22JHgK25378
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 14:17:42 -0500
Received: from smtp6.wanadoo.fr (smtp6.wanadoo.fr [193.252.22.25])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j22JHaTZ017314
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 14:17:36 -0500
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf0612.wanadoo.fr (SMTP Server) with ESMTP id ECDB91C0013B
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2005 20:17:29 +0100 (CET)
Received: from tangerine.coulon.evette
	(ADijon-151-1-24-166.w83-194.abo.wanadoo.fr [83.194.120.166])
	by mwinf0612.wanadoo.fr (SMTP Server) with ESMTP id B8FE41C00143
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2005 20:17:28 +0100 (CET)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.50) id 1D6ZLc-0001Gy-6m
	for linux-lvm@redhat.com; Wed, 02 Mar 2005 20:17:28 +0100
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04274-06 for <linux-lvm@redhat.com>;
	Wed, 2 Mar 2005 20:17:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.50) id 1D6ZLP-0001G0-0r
	for linux-lvm@redhat.com; Wed, 02 Mar 2005 20:17:15 +0100
Date: Wed, 02 Mar 2005 19:17:14 +0000
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: Re: [linux-lvm] Partition table gone? Any way to restore?
References: <4225FBC8.9020904@are-b.org> <20050302174819.GN17589@lug-owl.de>
	<4225FEBC.2060505@are-b.org> <20050302180537.GO17589@lug-owl.de>
	<42260F1B.2030803@are-b.org>
In-Reply-To: <42260F1B.2030803@are-b.org> (from oliver@are-b.org on Wed Mar 2
	20:08:11 2005)
Message-Id: <1109791034l.28794l.3l@tangerine>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-VjN5f/hSmGd3iER/1WI5"
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

--=-VjN5f/hSmGd3iER/1WI5
Content-Type: text/plain; charset=iso-8859-1; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 02.03.2005 20:08:11, oliver a =E9crit=A0:
> I do have an empty 120GB hdd available to dump the entire contence =20
> on. I guess dd will do the trick?

ddrescue the weapon of the last chance ...

J-L

>=20
> Jan-Benedict Glaw wrote:


>=20
>> On Wed, 2005-03-02 18:58:20 +0100, oliver <oliver@are-b.org>
>> wrote in message <4225FEBC.2060505@are-b.org>:
>>=20
>>> When i do a less -f /dev/hde I can see a lot of data.
>>>=20
>>> E.g. I see a string looking a lot like ReiserFS and scrolling down =20
>>> further I see /dev/vg00/<nameofparts created> so I'm sure a LOT is =20
>>> still there. I'll give it a shot. Any other ideas are still welcome!
>>>=20
>>=20
>> So let gpart guess and re-install a partition record. Though, you'd
>> better prepare a backup of that given HDD...
>>=20
>> MfG, JBG
>>=20
>>=20
>> ------------------------------------------------------------------------
>>=20
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
>=20

--=-VjN5f/hSmGd3iER/1WI5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCJhE6UdGGXzzGnNARAoSNAJ0XgQ6q0Qk1G1ZWszdMwgieiMtprQCffU1h
UBT+o7XLJ9dqrCoBI3HdNuw=
=dn5j
-----END PGP SIGNATURE-----

--=-VjN5f/hSmGd3iER/1WI5--
