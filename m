Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0V8AE130700
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 03:10:14 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0V8ADP5001361
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 03:10:13 -0500
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id A4AB36400
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 08:10:12 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 30291-06 for <linux-lvm@redhat.com>;
	Tue, 31 Jan 2006 08:10:11 +0000 (UTC)
Received: from ath600 (ip70-178-169-79.ma.dl.cox.net [70.178.169.79])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id 3765763E3
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 08:10:11 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] pvmove errors
Date: Tue, 31 Jan 2006 02:10:05 -0600
References: <43DF0F13.3060302@netspot.com.au>
In-Reply-To: <43DF0F13.3060302@netspot.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200601310210.05881.krakrjak@volumehost.net>
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

On Tuesday 31 January 2006 01:17, Tom Lanyon wrote:
> I need to move all the data off of my external scsi array and remove it
> from my volume group.
> The external array is /dev/cciss/c1d0p0, so I issued a pvmove with the
Sounds straightforward.

> following results:
> >/sbin/sh-2.05b# pvscan
> >pvscan -- reading all physical volumes (this may take a while...)
> >pvscan -- ACTIVE    PV  "/dev/cciss/c1d0p1" of VG "Volume0" [99.99 GB /
> > 99.99 GB Free] pvscan -- ACTIVE    PV  "/dev/cciss/c0d0p2" of VG
> > "Volume0" [136.61 GB / 68.89 GB Free] pvscan -- total: 2 [236.62 GB] / in
> > use: 2 [236.62 GB] / in  no VG: 0 [0]
I don't see /dev/cciss/c1d0p0 in the pvscan output.  It does show 
that /dev/cciss/c1d0p1 is unused.  Also /dev/cciss/c0d0p2 is much larger than 
c1d0p1.
> >/sbin/sh-2.05b# pvmove /dev/cciss/c1d0p1
Is this what you mean?  pvmove will remove all extents used on the specified 
PV off of it.
> I've tried a --force but that didn't help.
I'm unclear about what device you are trying to reduce.......  A little more 
clarity please.

--
Zac Slade
