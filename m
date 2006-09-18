Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8IIga4K021284
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 14:42:36 -0400
Received: from huixtocihuatl.xenguest.geekspirit.net
	(mictlantecuhtli.geekspirit.net [81.56.52.126])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8IIgNDj022064
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 14:42:24 -0400
Received: from localhost (mictecacihuatl.xenguest.geekspirit.net
	[172.24.42.55])
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	8E06971503
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 20:43:01 +0200 (CEST)
Received: from huixtocihuatl.xenguest.geekspirit.net ([172.24.42.53])
	by localhost (mictecacihuatl.xenguest.geekspirit.net [172.24.42.55])
	(amavisd-new, port 10024)
	with ESMTP id WjGZjusfGNpl for <linux-lvm@redhat.com>;
	Mon, 18 Sep 2006 20:41:37 +0200 (CEST)
Received: from bounty.rider.geekspirit.net (bounty.rider.geekspirit.net
	[172.24.42.200]) (Authenticated sender: rider)
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	19F4571502
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 20:42:51 +0200 (CEST)
Subject: Re: [linux-lvm] Are there any suggestions to trace LVM2 code?
From: Fabien Jakimowicz <fabien@jakimowicz.com>
In-Reply-To: <f535b83b0609130448h374d9518g572472ee05861aed@mail.gmail.com>
References: <f535b83b0609130448h374d9518g572472ee05861aed@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-VfBoPwb8F6rTYm7twIoW"
Date: Mon, 18 Sep 2006 20:41:59 +0200
Message-Id: <1158604919.19905.26.camel@bounty.rider.geekspirit.net>
Mime-Version: 1.0
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


--=-VfBoPwb8F6rTYm7twIoW
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2006-09-13 at 19:48 +0800, Penguin Lin wrote:
> Dear all:
> =20
> Recently I am interest in LVM2 and keeping on tracing the LVM2 source
> code,
> but it is a actually tough work for a newer like me.
> =20
> I just traced some userspace code like pcvreate.c, lvcreate.c ... and
> some code in ~/lib directory and so on...
> There are so mamy code that I don't understand now,=20
> and the information about the LVM internal is really less from google.
> =20
> Are there any suggestions or documents that can help me fully trace
> and underatand the internal of LVM2?
> I think these suggestions will be also useful when I trace the
> device-mapper driver.
> =20
> Thanks for all advice.
> =20
> regard.
> =20
You should take a look at this presentation :
http://people.redhat.com/agk/talks/linuxtag_2005

--=20
Fabien Jakimowicz <fabien@jakimowicz.com>

--=-VfBoPwb8F6rTYm7twIoW
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFDuh3zTD+AjVP2VIRAs8dAJ4i4TehSjawZ397TYX0w7YaztNXDgCgkMkc
j8P2f3mCnKua/JopdixCkbY=
=6+sU
-----END PGP SIGNATURE-----

--=-VfBoPwb8F6rTYm7twIoW--
