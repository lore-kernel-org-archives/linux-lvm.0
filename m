Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k88D93UN009065
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 09:09:03 -0400
Received: from huixtocihuatl.xenguest.geekspirit.net (home.geekspirit.net
	[81.56.52.126])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k88D8tbh029352
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 09:08:55 -0400
Received: from localhost (mictecacihuatl.xenguest.geekspirit.net
	[172.24.42.55])
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	2CB96716CB
	for <linux-lvm@redhat.com>; Fri,  8 Sep 2006 15:10:06 +0200 (CEST)
Received: from huixtocihuatl.xenguest.geekspirit.net ([172.24.42.53])
	by localhost (mictecacihuatl.xenguest.geekspirit.net [172.24.42.55])
	(amavisd-new, port 10024)
	with ESMTP id YqfavbOpGabI for <linux-lvm@redhat.com>;
	Fri,  8 Sep 2006 15:07:42 +0200 (CEST)
Received: from bounty.rider.geekspirit.net (bounty.rider.geekspirit.net
	[172.24.42.200]) (Authenticated sender: rider)
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	026C471503
	for <linux-lvm@redhat.com>; Fri,  8 Sep 2006 15:09:57 +0200 (CEST)
Subject: Re: [linux-lvm] lvm on centos with raid1 and grub
From: Fabien Jakimowicz <fabien@jakimowicz.com>
In-Reply-To: <4501491E.90103@ambra.ro>
References: <45012C0E.9080509@ambra.ro>  <4501491E.90103@ambra.ro>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-S9T9qb1C//jGF7fTBA+x"
Date: Fri, 08 Sep 2006 15:08:40 +0200
Message-Id: <1157720920.14015.23.camel@bounty.rider.geekspirit.net>
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


--=-S9T9qb1C//jGF7fTBA+x
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2006-09-08 at 13:42 +0300, Sterpu Victor wrote:
> I do need a fast answer if possible.
> So the quick question is "How can I mount a LVM partition, made on a=20
> RAID partition on another computer?"
> Thank you.
>=20
> Sterpu Victor wrote:
>=20
> > After a reboot I couldn't boot from none of my hdd's.
> > I receive just a grub console. Now I must reinstall grub, but in order=20
> > to do this I need to know the name of the root partion in the LVM.
> > To find out this I moved one of the hdd's in another computer and I=20
> > tried to mount the LVM partition.
> >
> > I do "modprobe dm-mod" and when I do "vgchange -ay" I get the message:
> >  File descriptor 3 left open
> >  File descriptor 5 left open
> >  File descriptor 7 left open
> >  No volume groups found
> > I have no LVM devices in /dev.
> > The alternative is to reinstall the OS, but....
> >
> > Thank you.
> >
> >
> >
If you are not using raid on the other computer, you should modify
md_component_detection in /etc/lvm/lvm.conf
You can also try to run : pvdisplay /dev/mdx where mdx is your raid
device.
--=20
Fabien Jakimowicz <fabien@jakimowicz.com>

--=-S9T9qb1C//jGF7fTBA+x
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFAWtYzTD+AjVP2VIRAi4cAJ43OihKrcBPXCK/sqxCHmR+EFmpOgCfZte8
oTg3ATaMsF5Ir0WwlqgsJns=
=aSYS
-----END PGP SIGNATURE-----

--=-S9T9qb1C//jGF7fTBA+x--
