Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i6UKpH4I014445
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2004 21:51:17 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1BqeLU-0007gj-U8
	for linux-lvm@redhat.com; Fri, 30 Jul 2004 21:51:16 +0100
Date: Fri, 30 Jul 2004 21:51:16 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2 segfault w/devfs on amd64
Message-ID: <20040730205116.GU18235@agk.surrey.redhat.com>
References: <20040730203958.GE4108@li2-47.members.linode.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040730203958.GE4108@li2-47.members.linode.com>
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

On Fri, Jul 30, 2004 at 03:39:58PM -0500, Randall Nortman wrote:
> I have tracked the segfault down to line 71 of lib/filters/filter.c,
> which in my version of the source is:
 
What version?
Meant to have got fixed in 2.00.20.

Alasdair
-- 
agk@redhat.com
