Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i7HMKsIa023702
	for <linux-lvm@redhat.com>; Tue, 17 Aug 2004 23:20:54 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1BxCK6-00070p-KK
	for linux-lvm@redhat.com; Tue, 17 Aug 2004 23:20:54 +0100
Date: Tue, 17 Aug 2004 23:20:54 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvmove problem
Message-ID: <20040817222054.GG6264@agk.surrey.redhat.com>
References: <115936e9040807092135ccc2be@mail.gmail.com>
	<20040807115431.A17768@homer.msp.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040807115431.A17768@homer.msp.redhat.com>
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

On Sat, Aug 07, 2004 at 11:54:31AM -0500, Alasdair G Kergon wrote:
> Summary: How do I pvmove data with LVM2 if contiguous runs of
> PEs in the source LVs will have to be split up to make them fit?
  
> Quick answer:
> LVM2 doesn't support this directly yet: it's being worked on.

This code is now in CVS for testing.

It lets you restrict the PEs you want to move. 
Can only move off one PV at once (ie. only one cmdline arg).

And of course you can still restrict the PEs available for allocation
by listing them afterwards, and/or use -n to restrict the PEs
moved to those belonging to a specific LV.

pvmove /dev/sda2:1000-1999 /dev/sdb1:1000-1499:2000- /dev/sdc1:500-1000

Alasdair
-- 
agk@redhat.com
