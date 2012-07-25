Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6PK6TcA019588
	for <linux-lvm@redhat.com>; Wed, 25 Jul 2012 16:06:30 -0400
Received: from zimbra.linbit.com (zimbra.linbit.com [212.69.161.123])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6PK6QHg007795
	for <linux-lvm@redhat.com>; Wed, 25 Jul 2012 16:06:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by zimbra.linbit.com (Postfix) with ESMTP id 294D06CA002
	for <linux-lvm@redhat.com>; Wed, 25 Jul 2012 22:06:26 +0200 (CEST)
Received: from zimbra.linbit.com ([127.0.0.1])
	by localhost (zimbra.linbit.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EbqfkrMLDt8f for <linux-lvm@redhat.com>;
	Wed, 25 Jul 2012 22:06:26 +0200 (CEST)
Received: from soda.linbit (tuerlsteher.linbit.com [86.59.100.100])
	by zimbra.linbit.com (Postfix) with ESMTP id 0D70F1B435C
	for <linux-lvm@redhat.com>; Wed, 25 Jul 2012 22:06:26 +0200 (CEST)
Date: Wed, 25 Jul 2012 22:06:25 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20120725200625.GH29767@soda.linbit>
References: <500C44EF.4080004@tlinx.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <500C44EF.4080004@tlinx.org>
Subject: Re: [linux-lvm] RFE?  Really power of 2?  extents,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Sun, Jul 22, 2012 at 11:22:39AM -0700, Linda Walsh wrote:
> 
> 
> 
> I was trying to figure out why I didn't get performance out of my RAID,
> except when operating on really large files where it's many stripes
> v. 1 stripe.
> 
> I have 12 data disks in a RAID 50 (3 RAID5's in a RAID0) and use a suggested
> stripesize of 64k, so a stripe-width of 768k.
> 
> Some issues that have been nagging me though are getting my allocations
> lined up on 768k boundaries.  xfs is no prob -- tell it 64k and 12
> and it does it.
> 
> But I just realized that lvm doesn't really tell me where it is
> aligning things

pvs --units s -o pv_name,vg_name,pe_start

pvcreate: --metadatasize, --dataalignment, --dataalignmentoffset
vgcreate: --physicalextentsize

> and worse, only lets me align both chunksizes for lv's and extents for vg's
> in powers of 2.   Um... Not a multiple of 4k? or 64k?
> 
> Am I wrong in thinking this would tend to give me both pv's and lv's that
> are very likely NOT to be stripe-width aligned, but, worse, not stripewidth
> alignable, at all.
> 
> This would mean that a high performance file system aware of RAID
> stripe with
> that tries to allocate chunks starting on a 768k boundary are likely
> to just
> get it completely wrong?  No?
> 
> Or what am I missing?

If you get the pvcreate --dataalignment right,
Any PE size 256k and larger will be fine,
just make sure you allocate your LV sizes in multiple of 3 PEs.

lvcreate -n lv_bla -l $(( (lv_size_kb / pe_size_kb + 2) / 3 * 3 )) vg_foo


-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com
