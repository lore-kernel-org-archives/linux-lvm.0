Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6TLEHV27842
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2005 17:14:17 -0400
Received: from leviathan.ele.uri.edu (leviathan.ele.uri.edu [131.128.51.64])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6TLEBre004213
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2005 17:14:11 -0400
Subject: Re: [linux-lvm] how to access the partition on LV?
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <20050729205658.GQ23710@agk.surrey.redhat.com>
References: <1122563861.9888.1.camel@localhost.localdomain>
	<20050728164523.GF4954@null.msp.redhat.com>
	<1122570830.9888.10.camel@localhost.localdomain>
	<20050728173218.GH4954@null.msp.redhat.com>
	<20050729205658.GQ23710@agk.surrey.redhat.com>
Date: Fri, 29 Jul 2005 17:14:07 -0400
Message-Id: <1122671647.5558.68.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
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

thx.

ming

On Fri, 2005-07-29 at 21:56 +0100, Alasdair G Kergon wrote:
> > > the problem is that we export a LV via iscsi to a remote box and become
> > > a scsi disk. so it is partitioned and utilized. then it does have
> > > partition on it. even it is exported to a linux box, u possibly will
> > > use /dev/sdx1 instead of directly use /dev/sdx, rite?
>  
> > dunno if kpartx or some other partitioning tool could do it
> 
> Give kpartx a try. It reads a dos partition table and creates partitions
> using device-mapper.
> 
> You'll find kpartx in multipath-tools (device-mapper-multipath package on Red Hat).
>   ftp://sources.redhat.com/pub/dm/multipath-tools/multipath-tools-0.4.5.48.tgz
> 
> Alasdair
