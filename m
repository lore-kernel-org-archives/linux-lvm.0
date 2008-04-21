Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3LAGVXQ025065
	for <linux-lvm@redhat.com>; Mon, 21 Apr 2008 06:16:31 -0400
Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m3LAGUh5005636
	for <linux-lvm@redhat.com>; Mon, 21 Apr 2008 06:16:31 -0400
Message-ID: <480C697E.2020702@redhat.com>
Date: Mon, 21 Apr 2008 11:16:30 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Adding PVs to a group
References: <48091663.2070404@Media-Brokers.com>	<480917FD.60002@Media-Brokers.com>
	<20080419001857.GA21151@pretender.frop.net>
In-Reply-To: <20080419001857.GA21151@pretender.frop.net>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

dave@frop.net wrote:
> sounds fine to me.
> 
> I had never heard of the %FREE thing though. To fill out a vg I would just check how many extents are available and use that on the command line with -l, remember there are no spaces between -l and the number of extents given.

The %VG, %LV & %FREE suffices were introduced a while back:

Version 2.02.11 - 12th October 2006
===================================
[...]
  Add %VG, %LV and %FREE suffices to lvcreate/lvresize --extents arg.


Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFIDGl+6YSQoMYUY94RAmYvAKCSdjcxMRVbvZY0RCKEJZYClEyzdwCgrJ2m
kJj33ju8X2nYhJcG0yhBA1g=
=cdou
-----END PGP SIGNATURE-----
