Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4M7adhX008137
	for <linux-lvm@redhat.com>; Sat, 22 May 2010 03:36:39 -0400
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4M7aS6T022749
	for <linux-lvm@redhat.com>; Sat, 22 May 2010 03:36:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id AB12C86F58
	for <linux-lvm@redhat.com>; Sat, 22 May 2010 09:36:27 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id JJEwi111t9VB for <linux-lvm@redhat.com>;
	Sat, 22 May 2010 09:36:22 +0200 (CEST)
Date: Sat, 22 May 2010 09:36:22 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100522073622.GC12294@maude.comedia.it>
References: <4BF5A883.7060503@tlinx.org>
	<20100521051021.GA1412@maude.comedia.it>
	<4BF62CBF.3070702@tlinx.org>
	<OFCFCB47DB.6AADE92B-ON8025772A.0027DF7C-8025772A.0028479D@cardiff.ac.uk>
	<4BF6D60E.4020306@tlinx.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4BF6D60E.4020306@tlinx.org>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, May 21, 2010 at 11:50:54AM -0700, Linda A. Walsh wrote:
> Lyn Rees wrote:
>>   > 192.00K is listed as the start of each!  GRR...why would that
>>>  be a default...I suppose it works for someone, but it's NOT a power of 2!
>>>  Hmph!
>>
>> 192 is a multiplier of 64... so it's aligned - assuming you used the whole 
>> disk as a PV (you didn't partition the thing first).
it is chunk aligned, not stripe aligned, reads would be ok, but
writes...

> Isn't 64 the amount written / disk, so the strip size is 256K?
> Wouldn't that make each strip have 1 64K chunk written odd,
> and the next 3 written in the next 'row'....
> I suppose maybe it doesn't matter...but when you break the pv up into
> vg's and lvs, somehow it seems odd to have them all skewed by 64K...
it will cause multiple R-M-W cycles fro writes that cross stripe
boundary, not good.

> Anyway...I wanted to redo the array anyway.  I didn't like the performance
> I was getting, so thought I'd try RAID 50.  I was only getting 150-300 on
> writes/reads on the RAID60 which seemed a bit low.  I get more than that
> on a a 4-data-disk RAID5 (200/400). It's a bit of pain to do all this 
> reconfiguring now, but better now than when they are all full!  It was
> a mistake to do RAID60, though I don't know if the performance on a 
> 10data-disk RAID6 would be any better for writes...still has to do
> alot of XORing even with a hardware card.
the choice between raid5 and raid6 has a lot to do with data safety.
also other constraints would mandate the use of spare drives in the
raid5 case. personally i prefer striping smaller redundant sets for
critical data. not to say that 10 is not a power of 2 and aligning lvm
becomes interesting.

> I had 2x6 and am going to try 4x3disks, so my hmmm....I guess now that I 
> think about it my strip size was really 8, not 4, since I had 2 of them.
yes it was 8
> But I'll still have a strip width of 8 with 4x3 RAID5's.  I don't know if it
> will be much faster or not...but guess I'll see.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
