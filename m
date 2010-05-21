Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4LIp97k029322
	for <linux-lvm@redhat.com>; Fri, 21 May 2010 14:51:09 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4LIov48012073
	for <linux-lvm@redhat.com>; Fri, 21 May 2010 14:50:57 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.3/8.14.3/SuSE Linux 0.8) with ESMTP id
	o4LIosMc019142
	for <linux-lvm@redhat.com>; Fri, 21 May 2010 11:50:56 -0700
Message-ID: <4BF6D60E.4020306@tlinx.org>
Date: Fri, 21 May 2010 11:50:54 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4BF5A883.7060503@tlinx.org>	<20100521051021.GA1412@maude.comedia.it>	<4BF62CBF.3070702@tlinx.org>
	<OFCFCB47DB.6AADE92B-ON8025772A.0027DF7C-8025772A.0028479D@cardiff.ac.uk>
In-Reply-To: <OFCFCB47DB.6AADE92B-ON8025772A.0027DF7C-8025772A.0028479D@cardiff.ac.uk>
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

Lyn Rees wrote:
>   > 192.00K is listed as the start of each!  GRR...why would that
>>  be a default...I suppose it works for someone, but it's NOT a power of 2!
>>  Hmph!
> 
> 192 is a multiplier of 64... so it's aligned - assuming you used the 
> whole disk as a PV (you didn't partition the thing first).
---
Isn't 64 the amount written / disk, so the strip size is 256K?
Wouldn't that make each strip have 1 64K chunk written odd,
and the next 3 written in the next 'row'....
I suppose maybe it doesn't matter...but when you break the pv up into
vg's and lvs, somehow it seems odd to have them all skewed by 64K...

But I haven't worked with RAIDS that much, so it's probably just a 
conceptual thing in my head.

Anyway...I wanted to redo the array anyway.  I didn't like the performance
I was getting, so thought I'd try RAID 50.  I was only getting 150-300 on
writes/reads on the RAID60 which seemed a bit low.  I get more than that
on a a 4-data-disk RAID5 (200/400). It's a bit of pain to do all this 
reconfiguring now, but better now than when they are all full!  It was
a mistake to do RAID60, though I don't know if the performance on 
a 10data-disk RAID6 would be any better for writes...still has to do
alot of XORing even with a hardware card.

I had 2x6 and am going to try 4x3disks, so my hmmm....I guess now that 
I think about it my strip size was really 8, not 4, since I had 2 of them.
But I'll still have a strip width of 8 with 4x3 RAID5's.  I don't know if it
will be much faster or not...but guess I'll see.



   
