Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAJJk5r08668
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 14:46:05 -0500
Received: from nile.gs.washington.edu (nile.gs.washington.edu [128.95.231.71])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAJJjxuO008687
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 14:45:59 -0500
Received: from nile.gs.washington.edu (localhost [127.0.0.1])
	by nile.gs.washington.edu (8.12.11/8.12.11) with ESMTP id
	iAJJjwwO011141
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 11:45:58 -0800
Received: (from dgs@localhost)
	by nile.gs.washington.edu (8.12.11/8.12.11/Submit) id iAJJjwHg011140
	for linux-lvm@redhat.com; Fri, 19 Nov 2004 11:45:58 -0800
Date: Fri, 19 Nov 2004 11:45:58 -0800
From: "David S." <dgs@gs.washington.edu>
Subject: Re: [linux-lvm] HA Fileserver configuration recommendation sought.
Message-ID: <20041119194558.GC10969@nile.gs.washington.edu>
References: <1100857645.13422.99.camel@grma-lap>
	<1100885267.19894.217.camel@rct07.cadence.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1100885267.19894.217.camel@rct07.cadence.com>
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
To: linux-lvm@redhat.com


> I use the ATABoy 2x (dual active/active FC) with great success.  I use
> md to create a failover path (see mdadm) on newer kernels (2.6.9) and I
> have multiple 3.2T LUNS (multiple ataboys).  I use LVM2 to partition
> some of the LUNs with great success.

I tried using LVM2 on a 2.6.9 kernel to stripe together four 1T LUNs
from two 3 Ware 9000 SATA raid controllers to make ~4T file system,
but experienced file corruption under heavy I/O loads.  In copying 
large directories into the file system (via tar+rsh/ssh or rsync+rsh/ssh),
I'd get files that seemed to have blocks exchanged with a different file.
I saw this using XFS, Reiserfs, and EXT3 as the file system in the LVM2
stripe.  Some tests I made of a similar configuration using 'md' instead
of LVM2 were more successful, but I didn't put quite the I/O load on
that configuration.

David S.

> 
