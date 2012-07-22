Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q6MIMhKb021716
	for <linux-lvm@redhat.com>; Sun, 22 Jul 2012 14:22:44 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6MIMgTZ018366
	for <linux-lvm@redhat.com>; Sun, 22 Jul 2012 14:22:43 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.5/8.14.4/SuSE Linux 0.8) with ESMTP id
	q6MIMd7I013120
	for <linux-lvm@redhat.com>; Sun, 22 Jul 2012 11:22:41 -0700
Message-ID: <500C44EF.4080004@tlinx.org>
Date: Sun, 22 Jul 2012 11:22:39 -0700
From: Linda Walsh <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] RFE?  Really power of 2?  extents,
	chunks and raid alignment
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>




I was trying to figure out why I didn't get performance out of my RAID,
except when operating on really large files where it's many stripes v. 1 
stripe.

I have 12 data disks in a RAID 50 (3 RAID5's in a RAID0) and use a suggested
stripesize of 64k, so a stripe-width of 768k.

Some issues that have been nagging me though are getting my allocations
lined up on 768k boundaries.  xfs is no prob -- tell it 64k and 12 and 
it does it.

But I just realized that lvm doesn't really tell me where it is aligning 
things
and worse, only lets me align both chunksizes for lv's and extents for vg's
in powers of 2.   Um... Not a multiple of 4k? or 64k? 

Am I wrong in thinking this would tend to give me both pv's and lv's that
are very likely NOT to be stripe-width aligned, but, worse, not stripewidth
alignable, at all.

This would mean that a high performance file system aware of RAID stripe 
with
that tries to allocate chunks starting on a 768k boundary are likely to 
just
get it completely wrong?  No?

Or what am I missing?

Thanks...
-linda
