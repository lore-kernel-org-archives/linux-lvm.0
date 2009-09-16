Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8GHmtuJ014650
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 13:48:56 -0400
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8GHmhvB016977
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 13:48:44 -0400
Received: from linux.interlinx.bc.ca (d67-193-217-194.home3.cgocable.net
	[67.193.217.194])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id 8D9A62806
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 13:48:43 -0400 (EDT)
Received: from [IPv6:2001:4978:161:0:218:f3ff:fee1:65cc] (pc.interlinx.bc.ca
	[IPv6:2001:4978:161:0:218:f3ff:fee1:65cc])
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 3850B8767
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 13:48:42 -0400 (EDT)
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <1253119669.5326.32.camel@delo.gdit>
References: <1253109566.5326.15.camel@delo.gdit>
	<20090916170533.62999698@fixlaptop.gillibert.homelinux.net>
	<1253119669.5326.32.camel@delo.gdit>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-RGBkluZ1O5yHzbxUojfe"
Date: Wed, 16 Sep 2009 12:58:42 -0400
Message-Id: <1253120322.16343.71.camel@pc.interlinx.bc.ca>
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


--=-RGBkluZ1O5yHzbxUojfe
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2009-09-16 at 18:47 +0200, Ambrogio De Lorenzo wrote:
>=20
> snapshot is not a good choise for me.

It actually is.  I snapshot all of my filesystems before every upgrade
and let the snapshots hang around until I am happy with the upgrade.

> I want to have an identical copy
> (like dd) on another identical disk, for fast recovery in case of
> failure.

Well, snapshots give you a very space efficient (if not performance
efficient due to the COW nature of snapshots) version of that.  When you
create a snapshot and before your modify any data in the origin (the
volume you are creating a snapshot (a.k.a. copy) of your snapshot is an
identical copy (just as if you'd used dd) of the origin, without using
any additional space even!

You can go on to upgrading the origin and the snapshot will continue to
maintain the "copy" of the origin at the time the snapshot was created.
It's sweet.

> This is what I do with raid hardware, and I would like to know if is
> possible to do it with lvm mirroring.

I've never used LVM mirroring.  Certainly you can do this with Linux's
MD software mirroring, but why bother when snapshots are so much easier?

> I'm looking also on mdadm to mirror a disk (or partition) but I think it
> is not usable when disk is already partitioned and used without mdadm.

Well, you will have that same problem with LVM.  Planning is key in any
of this.

b.


--=-RGBkluZ1O5yHzbxUojfe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkqxGUEACgkQl3EQlGLyuXA5xgCg7eVpt2CdzkeB0RFFD9glSuHi
1EQAniPKBPV0oaFMXnoFxMfeQC+qA7o5
=qQY4
-----END PGP SIGNATURE-----

--=-RGBkluZ1O5yHzbxUojfe--
