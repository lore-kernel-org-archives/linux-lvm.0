Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8CAFq7e027767
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 06:15:53 -0400
Received: from mail.linbit.com (aug.linbit.com [212.69.162.22])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l8CAFh6F008287
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 06:15:46 -0400
Received: from soda.linbit (office.linbit [86.59.100.100])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id E6CF22E3986E
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 12:15:41 +0200 (CEST)
Date: Wed, 12 Sep 2007 12:15:43 +0200
From: Lars Ellenberg <linux-lvm@linbit.com>
Subject: Re: [linux-lvm] Can LVM block I/O and hang a system?
Message-ID: <20070912101543.GA10093@barkeeper1.linbit>
References: <a06240411c30cd5dee72c@[129.98.90.227]>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a06240411c30cd5dee72c@[129.98.90.227]>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Sep 12, 2007 at 03:09:14AM -0400, Maurice Volaski wrote:
> A working system begins hanging and it seems to be stuck on I/O 
> processes that use ext3 partitions that are running on top of LVM. 
> The system is AMD 64-bit running Gentoo. Kernel is Gentoo 2.6.22-r3 
> and LVM lvm2-2.02.27. Here is the disk setup:
> 
> Boot disk, attached to motherboard via SATA
> 1) some partitions accessed via ext3 -> hardware partition.
> 2) some partitions accessed via ext3 -> drbd, which is version 8.0.5, 

please use drbd 8.0.6 with kernels that do not allow recursion in
generic_make_request, otherwise any lock is likely to be caused by this.

then, if there are still lockups, these may be caused by lvm, and may be
due to some similar problem, namely doing synchronous (housekeeping) io
from within the generic_make_request path within the same "thread".

> -> hardware partition.
> 
> External SATA-SCSI RAID, attached to via an LSI Logic card,
> 3) one partition accessed via ext3 -> drbd -> hardware partition.
> 4) some partitions accessed via ext3 -> LVM -> drbd -> hardware partition.
> 
> On repeated reboots, #1) boots fine, and I can fsck #2) no problem. I 
> can also fsck #3, but the fsck processes on #4, which all are trying 
> to recover the journals, just seem to not do anything. There is no 
> evidence of I/O and there are no errors reported anywhere. The frozen 
> fsck processes cannot even be killed and the system ignores the 
> shutdown command.
> 
> That the hanging fsck processes are all occurring on just the LVM 
> partitions seems to imply that LVM is responsible.
> 
> drbd had been unattached to its peer during this time, and when I 
> reattached it, it had no trouble syncing to the peer. That system, 
> which should basically be identical, however, has no trouble running 
> running fsck everywhere. I'm not sure, though, if that lets LVM off 
> the hook.
> -- 
> 
> Maurice Volaski, mvolaski@aecom.yu.edu
> Computing Support, Rose F. Kennedy Center
> Albert Einstein College of Medicine of Yeshiva University

-- 
: Lars Ellenberg                            Tel +43-1-8178292-0  :
: LINBIT Information Technologies GmbH      Fax +43-1-8178292-82 :
: Vivenotgasse 48, A-1120 Vienna/Europe    http://www.linbit.com :
__
please use the "List-Reply" function of your email client.
