Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6UL1Ca25241
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2004 17:01:12 -0400
Received: from li2-47.members.linode.com (li2-47.members.linode.com
	[69.56.173.47])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6UL16Xn010908
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2004 17:01:07 -0400
Received: from rnortman by li2-47.members.linode.com with local (Exim 3.35 #1
	(Debian)) id 1BqeUv-0001m7-00
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2004 21:01:01 +0000
Date: Fri, 30 Jul 2004 16:01:01 -0500
From: Randall Nortman <linux-lvm-list@wonderclown.com>
Subject: Re: [linux-lvm] LVM2 segfault w/devfs on amd64
Message-ID: <20040730210101.GF4108@li2-47.members.linode.com>
References: <20040730203958.GE4108@li2-47.members.linode.com>
	<20040730205116.GU18235@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040730205116.GU18235@agk.surrey.redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Well, that explains it.  Gentoo is currently distributing 2.00.08.  I
will update the bug I already filed with Gentoo to indicate that it's
fixed in the new version.  Thanks!

On Fri, Jul 30, 2004 at 09:51:16PM +0100, Alasdair G Kergon wrote:
> On Fri, Jul 30, 2004 at 03:39:58PM -0500, Randall Nortman wrote:
> > I have tracked the segfault down to line 71 of lib/filters/filter.c,
> > which in my version of the source is:
>  
> What version?
> Meant to have got fixed in 2.00.20.
> 
> Alasdair
> -- 
> agk@redhat.com
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
