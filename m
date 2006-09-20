Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8K0UWS8021877
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 20:30:32 -0400
Received: from huixtocihuatl.xenguest.geekspirit.net
	(mictlantecuhtli.geekspirit.net [81.56.52.126])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8K0USau026124
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 20:30:28 -0400
Received: from localhost (mictecacihuatl.xenguest.geekspirit.net
	[172.24.42.55])
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	5233B71504
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 02:31:17 +0200 (CEST)
Received: from huixtocihuatl.xenguest.geekspirit.net ([172.24.42.53])
	by localhost (mictecacihuatl.xenguest.geekspirit.net [172.24.42.55])
	(amavisd-new, port 10024)
	with ESMTP id Uk259xz4+bTB for <linux-lvm@redhat.com>;
	Wed, 20 Sep 2006 02:29:53 +0200 (CEST)
Received: from bounty.rider.geekspirit.net (bounty.rider.geekspirit.net
	[172.24.42.200]) (Authenticated sender: rider)
	by huixtocihuatl.xenguest.geekspirit.net (Postfix) with ESMTP id
	D8E2971502
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 02:31:12 +0200 (CEST)
Subject: Re: [linux-lvm] LVM on RAID
From: Fabien Jakimowicz <fabien@jakimowicz.com>
In-Reply-To: <Pine.LNX.4.63.0609191650560.1397@zeus.itg.uiuc.edu>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
	<1158608557.19905.37.camel@bounty.rider.geekspirit.net>
	<1158609135.7182.21.camel@localhost.localdomain>
	<1158609477.19905.38.camel@bounty.rider.geekspirit.net>
	<Pine.LNX.4.63.0609191650560.1397@zeus.itg.uiuc.edu>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-oERl6zi8bnvRAzEWvOeD"
Date: Wed, 20 Sep 2006 02:30:11 +0200
Message-Id: <1158712211.5366.2.camel@bounty.rider.geekspirit.net>
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


--=-oERl6zi8bnvRAzEWvOeD
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2006-09-19 at 16:53 -0500, Alexander Lazarevich wrote:
> We have several RAID devices (16-24 drive Fiber/SCSI attached RAID) which=
=20
> are currently single devices on our 64bit linux servers (RHEL-4, core5).=20
> We are considering LVM'ing 2 or more of the RAID's into a LVM group. I=20
> don't doubt the reliability and robustness of LVM2 on single drives, but =
I=20
> worry about it on top of RAID devices.
>=20
> Does anyone have any experience with LVM on to of RAID volumes, positive=20
> or negative?
>=20
> Thanks,
>=20
> Alex
Works perfectly with severall machines, maybe having more interactions
between raid and lvm could be a good thing (for example, while creating
a new LV or extending existing one on mixed raid devices (degrated and
not), it could be better if lvm don't use degrated devices first).
--=20
Fabien Jakimowicz <fabien@jakimowicz.com>

--=-oERl6zi8bnvRAzEWvOeD
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFEIuTzTD+AjVP2VIRAooDAJ9sUa/89mJb4WLpVMToIh6Zr6S2MACeOQPD
Srq+ygexmLFOrShUD5XNqtU=
=ubrJ
-----END PGP SIGNATURE-----

--=-oERl6zi8bnvRAzEWvOeD--
