Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBMBR6128554
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 06:27:06 -0500
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBMBQxbl024594
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 06:27:00 -0500
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1EpOb0-0000xh-3b
	for linux-lvm@redhat.com; Thu, 22 Dec 2005 11:26:54 +0000
Date: Thu, 22 Dec 2005 11:26:54 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20051222112654.GM10278@strugglers.net>
References: <20051222103631.GJ10278@strugglers.net>
	<20051222110943.12271.qmail@web36215.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8zEuvTefQLoMiHqU"
Content-Disposition: inline
In-Reply-To: <20051222110943.12271.qmail@web36215.mail.mud.yahoo.com>
Subject: Re: [linux-lvm] Recovery of data in LVM from a corrupt disk
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


--8zEuvTefQLoMiHqU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 22, 2005 at 03:09:43AM -0800, Hale India wrote:
>    If you can describe how to proceed when you need to move your hardisks
>    to another machine (In my case the cause when hardware failure of
>    mother board) and when boot disk doesnot accept to boot on the new
>    machine (in my case it was fedora 4 and probably some difference of
>    hardware.

I already did give you some hints and so did Alasdair Kergon.  It
should just work, your other problem being that you have the disks in
a machine that already has a VG named the same as the one you want
to find on the disk(s) you put in.

Like I said, depending on how broken the disk is (and it sounds like
it is since it no longer boots, but you didn't specify what messages
it gives exactly so we have no idea if that is hardware, bootloader,
kernel or what) you may not be able to recover anything.  Which is
really no different from the situation you'd be in with a
filesystem.

>    If you can give to us some guideline it would probably save some
>    situations.
>    If you can point us to documentation in LVM project usefull for such
>    case it would even be better.

Try the LVM2 HOWTO (google)

--8zEuvTefQLoMiHqU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDqo1+IJm2TL8VSQsRAi3nAJ40L+O/sm2L6YdoZIVaMTjUH4SrPACg8Swj
XMq1YoR3g9uXc3MKMQR5/xc=
=37e5
-----END PGP SIGNATURE-----

--8zEuvTefQLoMiHqU--
