Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3M7dEbR019093
	for <linux-lvm@redhat.com>; Wed, 22 Apr 2009 03:39:14 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3M7cp1H031208
	for <linux-lvm@redhat.com>; Wed, 22 Apr 2009 03:38:52 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id AF22D87378
	for <linux-lvm@redhat.com>; Wed, 22 Apr 2009 09:38:50 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id rk8dBT2g93rP for <linux-lvm@redhat.com>;
	Wed, 22 Apr 2009 09:38:50 +0200 (CEST)
Date: Wed, 22 Apr 2009 09:38:50 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Wierd lvm2 performance problems
Message-ID: <20090422073850.GA25276@maude.comedia.it>
References: <49EA534C.7090003@whgl.uni-frankfurt.de>
	<49EACA64.8070006@redhat.com>
	<49EB4045.7020407@whgl.uni-frankfurt.de>
	<20090420053949.GA16457@maude.comedia.it>
	<98cfe6a3ff352717b0d636c599e39c99.squirrel@ssl.verfeiert.org>
	<20090420134610.GB17461@maude.comedia.it>
	<49EE0143.5000200@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49EE0143.5000200@whgl.uni-frankfurt.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Apr 21, 2009 at 07:24:19PM +0200, Sven Eschenberg wrote:
> Hi Luca,
>
> I gave this a little more thought ...
>
> Luca Berra schrieb:
>> Because when you _write_ incomplete stripes, the raid code
>> would need to do a read-modify-write of the parity block.
>
> Okay, the question is, how often, if you modify files at random, do you 
> really write a full stripe, even if the cache holds back all modification 
> for a couple minutes. I wonder how often you can take advantage of this in 
> normal mixed load situations.
i am no expert in filesystem internals, but i believe the idea is
minimize r-m-w, non necessarily writing always full stripes
i.e
default raid5 4+1, chunk 64k stripe 256k
you write a 800k file starting with chunk 1233 it has to r-m-w stripe 308
and 311, ad full stripe 309 and 310.
if the fs was aware of the underlying device it would try allocate the
file starting from chunk 1236, resulting in 2 full stripe and only one
r-m-w

>> Filesystem, like ext3/4 and xfs have the ability to account for stripe
>> size in the block allocator to prevent unnecessary read-modify-writes,
>> but if you do not stripe-align the start of the filesystem you cannot
>> take advantage of this.
>
> Okay, understood, but doesn't this imply, as long as my application running 
> on top of an md and/or LV ontop of an md cannot take advantage of the 
> layout information, it doesn't matter at all. I do see the advantage, I.E. 
> if you have an RDBMS that can operate and organize itself ontop of some 
> blockdevice which has a certain layout, or any filesystem taking this into 
> account.
> In contrast, if I am to export the blockdevice as iSCSI target in a plain 
> NAS, this doesn't help me at all.
probably not, unless the iscsi client is also optimized

> Now, even if I properly stripe align the pe_start, what happens if I am 
> doing a whole disk online capacity expansion? As long as LVM cannot realign 
> everything online, and the filesystem can realign itself (or update it's 
> layout accordingly) online, this is pretty much pointless.
afaik lvm cannot realign itself automatically, i believe it is doable
manually by pvmoving away the first pe (or the first n pe, depending on
configuration), vgcfgbackup, vi, vgcfgrestore.
then you only have to realign PEs.
another option is planning for possible capacity upgrades and using
n1*n2 .. nn * chunk_size as unit for both pe_start and pe_size *
number_of_pe_i_align_lv_size_to (see my previous mail about non n^2
stripe size).  This is at most 3*4*5*7*chunk_size.
Filesystems _can_ be taught to update their layout (for future writes,
that is): ext3/4 with tune2fs, xfs with sunit/swidth mount options.

> In the end it all comes down to, that in most cases aligning doesn't help, 
> at leats not, if the whoel array configuration might change over time - or 
> am I mistaken there?
It all comes down to, that performance tuning is bound to the
environment we are tuning for. some choices may give performance boosts
in one environment, but be detrimental in another.
Sometimes it is not even clear at a project start what the best route
is, sometimes unforseen changes disrupt a well tought setup.
being able to adapt to all possible future changes is probably
impossible, still a little bit of foretought is not completely wasted.

L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
