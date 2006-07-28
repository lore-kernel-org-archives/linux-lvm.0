Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6SCsQnc018817
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 08:54:26 -0400
Received: from mhw.ulib.iupui.edu (mail@mhw.ulib.iupui.edu [134.68.171.23])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6SCsKVv029071
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 08:54:20 -0400
Received: from mhw.ulib.iupui.edu ([134.68.171.23] ident=mwood)
	by mhw.ulib.iupui.edu with esmtp (TLSv1:AES256-SHA:256) (Exim 4.40)
	id 1G6Rr9-0001xT-LS
	for linux-lvm@redhat.com; Fri, 28 Jul 2006 07:54:19 -0500
Date: Fri, 28 Jul 2006 08:54:12 -0400 (EDT)
From: "Mark H. Wood" <mwood@IUPUI.Edu>
Subject: Re: [linux-lvm] Performance impact of LVM
In-Reply-To: <44C8DC2D.3000408@conterra.de>
Message-ID: <Pine.LNX.4.64.0607280846060.6888@mhw.ulib.iupui.edu>
References: <20060727120250.GB17454@freshdot.net>
	<44C8DC2D.3000408@conterra.de>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Some uses of LVM *could* increase I/O wait time.  It's easy to paste new 
extents onto existing volumes, and the new extent probably won't be 
contiguous with the old one.  So you *could* see longer average seek 
delays due to additional arm travel distance between extents.  It's 
strongly dependent on access patterns.

However this effect is probably down in the noise for most systems.  The 
only way to know if it's a problem for you is to measure.  I would expect 
that, given contemporary amounts of caching on the drive, the controller, 
and in the OS, you probably won't see it unless you are driving your 
storage *really* hard.  If you do, dump/recreate contiguously/restore will 
make it go away.

- -- 
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
Typically when a software vendor says that a product is "intuitive" he
means the exact opposite.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)
Comment: pgpenvelope 2.10.2 - http://pgpenvelope.sourceforge.net/

iD8DBQFEygj6s/NR4JuTKG8RAsiUAJ4rfE9pWkHQjjl1W5DGLV2jaHCyegCgn+fO
umxX1nQ9djK5wa2/n93FKLc=
=7ev8
-----END PGP SIGNATURE-----
