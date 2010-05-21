Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4L6n6ks023213
	for <linux-lvm@redhat.com>; Fri, 21 May 2010 02:49:06 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4L6mfJn028383
	for <linux-lvm@redhat.com>; Fri, 21 May 2010 02:48:46 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.3/8.14.3/SuSE Linux 0.8) with ESMTP id
	o4L6mVc5031648
	for <linux-lvm@redhat.com>; Thu, 20 May 2010 23:48:35 -0700
Message-ID: <4BF62CBF.3070702@tlinx.org>
Date: Thu, 20 May 2010 23:48:31 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4BF5A883.7060503@tlinx.org>
	<20100521051021.GA1412@maude.comedia.it>
In-Reply-To: <20100521051021.GA1412@maude.comedia.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Volume alignment over RAID
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

Luca Berra wrote:
> On Thu, May 20, 2010 at 02:24:19PM -0700, Linda A. Walsh wrote:
>> I'm a bit unclear as to where some units are applied in my RAID setup, but
>> was wondering how LVM interacted, could be, or should be setup so that
>> created volumes would be aligned properly on top of a RAID disk.
> note that if your rig uses fairly recent software data alignment should
> happen automagically.
---
	So I'm told, but I like to verify, I'm paranoid :-)

>> I'm using a RAID 'chunk' size of 64k as suggested by the RAID documentation
>> and am using 6 disks to create a RAID6, giving 4 units of data/stripe.  Does
> I suppose by raid you mean md, so i wonder what documentation you were
> looking at?
---
	Well, doc in 2 different raid controllers LSI and rocket raid both
suggest 64K as a unit size (forget, their exact term).

> I think 64k might be small as a chunk size, depending on your array size
> you probably want a bigger size.
---
	Really?  What are the trade offs?  Array size well 6 disks and 4 of data.

> 
> Then, since with a six drive raid 6 stripe size is always a power of 2,
> answers are easy :)
---
	I like easy...figure 4 should divide into most things.


>> this mean my logical volume needs to be aligned on a 64K boundary, or a 256k
>> boundary? I.e. does 64k usually specify chunk/unit, or chunk/stripe?
> align to stripe size
> 
>> What do I need to do to make sure my logical volumes always line up on RAID
>> stripe boundaries?
> make the volume group with pe size multiple of stripe size
>> I've been using default logical volume parameters, which I think use an
>> allocation size measured in Megabytes, so does that imply I'm automatically
>> aligned (as 64k and 256k both divide into 1 Meg)
----
	It's 4.0M, so not a problem...but this next one is:


>>  Or is some offset involved?
> run:
> pvs -o pv_name,pe_start



	192.00K is listed as the start of each!  GRR...why would that
be a default...I suppose it works for someone, but it's NOT a power of 2! 
Hmph!

So each start is messed up.  Is there a way I can change the default on a per
volume basis? ...(yes: --datalignment; if I'd just read manpage
before shooting!)

(off to read manpage...thanks for the help....this is most unpleasant,
given I' just copied 1.3T (6 hours worth) of data on to this thing already...
looks like I was a bit too eager, but was out of disk space on old partition.
Oh well..).

*sigh*
