Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k122F4123976
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 21:15:04 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k122EsEu018848
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 21:14:59 -0500
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id 88B726531
	for <linux-lvm@redhat.com>; Thu,  2 Feb 2006 02:14:53 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 17101-05 for <linux-lvm@redhat.com>;
	Thu,  2 Feb 2006 02:14:51 +0000 (UTC)
Received: from ath600 (ip70-178-169-79.ma.dl.cox.net [70.178.169.79])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id D92B56524
	for <linux-lvm@redhat.com>; Thu,  2 Feb 2006 02:14:50 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] pvmove errors
Date: Tue, 31 Jan 2006 22:03:11 -0600
References: <43DF0F13.3060302@netspot.com.au>
	<200601310210.05881.krakrjak@volumehost.net>
	<43DFF20D.4000605@netspot.com.au>
In-Reply-To: <43DFF20D.4000605@netspot.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200601312203.11225.krakrjak@volumehost.net>
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

On Tuesday 31 January 2006 17:26, Tom Lanyon wrote:
> pvscan -- ACTIVE    PV  "/dev/cciss/c1d0p1" of VG "Volume0" [99.99 GB /
> 99.99 GB Free] pvscan -- ACTIVE    PV  "/dev/cciss/c0d0p2" of VG "Volume0"
> [136.61 GB / 68.89 GB Free]
> I need to remove /dev/cciss/c1d0p1.
Okay this is more clear.  Yes the pv is unused and should be possible to 
cleanly remove the pv from the volumegroup.

> pvscan shows that its unused, but a "vgreduce Volume0 /dev/cciss/c1d0p1"
> tells me it can't reduce because the PV is used.
It's always more helpful to post the output of vgreduce, but I'll take a stab 
here.

> Any ideas?
First you should mark the pv as unallocatable pvchange -x no /dev/cciss/c1d0p1
The next step is to remove the pv from the volume group using vgreduce 
Volume0 /dev/cciss/c1d0p1 or alternatively vgreduce -a Volume0

If those do not work please post the output of those commands.
--
Zac Slade
