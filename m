Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i64BckeS021473
	for <linux-lvm@redhat.com>; Sun, 4 Jul 2004 12:38:46 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Bh5KY-0006sE-CR
	for linux-lvm@redhat.com; Sun, 04 Jul 2004 12:38:46 +0100
Date: Sun, 4 Jul 2004 12:38:46 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvmove - Can't expand LV: Mirror
	supportmissingfromkernel?
Message-ID: <20040704113846.GA12587@agk.surrey.redhat.com>
References: <20040703164638.GF32058@agk.surrey.redhat.com>
	<000101c46160$b5cb22c0$0201a8c0@fosi>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000101c46160$b5cb22c0$0201a8c0@fosi>
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

On Sun, Jul 04, 2004 at 12:49:06PM +1200, Steve Wray wrote:
> but pvmove -tv /dev/hdf4 still fails with;
>   ABORTING: Temporary mirror activation failed.

That's test mode for you: it's continuing further into
the pvmove than is possible when all writes are turned off
(which is what test mode does) - it needs fixing to bail
out sooner cleanly.
 
> # lvm version
>   LVM version:     2.00.08 (2003-11-14)
>   Library version: 1.00.07-ioctl (2003-11-21)

You really should update both of those.
Look at the current WHAT_NEW file to see how many fixed bugs 
you're running with!
 
Alasdair
-- 
agk@redhat.com
