Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3JELdj07739
	for <linux-lvm@redhat.com>; Mon, 19 Apr 2004 10:21:39 -0400
Received: from mail.werbeagentur-aufwind.de (websrv.werbeagentur-aufwind.de
	[213.239.197.241])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3JELbJW032128
	for <linux-lvm@redhat.com>; Mon, 19 Apr 2004 10:21:37 -0400
Subject: Re: [linux-lvm] LVM2-Snapshot 2.6.5 with udm2
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <OFA0803F87.B9DFF62F-ON80256E7B.0048CD50-80256E7B.00491D4A@philips.com>
References: <OFA0803F87.B9DFF62F-ON80256E7B.0048CD50-80256E7B.00491D4A@philips.com>
Message-Id: <1082384492.8808.8.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Date: Mon, 19 Apr 2004 16:21:32 +0200
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Am Mo, den 19.04.2004 schrieb darren.miller@philips.com um 14:16 Uhr
+0100:

> it would appear that xfs_freeze is the source of my problems, LVM2 doesn't
> appear to work well with SGI's XFS, unless there is a tool version issue
> here, or do I not need to do xfs_freeze with LVM2?

Christoph Hellwig has a set of patches ready that fix the problem. He
posted them some days ago, you can search on the LKML archive.
