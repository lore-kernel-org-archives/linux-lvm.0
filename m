Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5L4QlI1016489
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2010 00:26:48 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o5L4QTqc010258
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2010 00:26:33 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.3/8.14.3/SuSE Linux 0.8) with ESMTP id
	o5L4QLXx026225
	for <linux-lvm@redhat.com>; Sun, 20 Jun 2010 21:26:24 -0700
Message-ID: <4C1EE9ED.9080201@tlinx.org>
Date: Sun, 20 Jun 2010 21:26:21 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4BF5A883.7060503@tlinx.org>	<20100521051021.GA1412@maude.comedia.it>	<4BF62CBF.3070702@tlinx.org>	<20100522072321.GB12294@maude.comedia.it>
	<4BFEA099.9020005@redhat.com>
In-Reply-To: <4BFEA099.9020005@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] RAID chunk size & LVM 'offset' affecting RAID
	stripe alignment
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

Revisiting an older topic (I got sidetracked w/other issues,
as usual, fortunately email usually waits...).

About a month ago, I'd mentioned docs for 2 HW raid cards
(LSI & Rocket Raid) both suggested 64K as a RAID chunk size.

Two responses came up, Doug Ledford said:
  Hardware raid and software raid are two entirely different things
  when it comes to optimization.
 

And Luca Berra said:
  I think 64k might be small as a chunk size, depending on your
  array size you probably want a bigger size.  

(I asked why and Luca contiued..)

  First we have to consider usage scenarios, i.e. average read and
  average write size, large reads benefit from larger chunks, small
  writes with too large chunks would still result on whole stripe
  Read-Modify-Write.
 
  there were people on linux-raid ml doing benchmarks, and iirc
  using chunks between 256k and 1m gave better average results...

(Doug seconded this, as he was the benchmarker..)
  
  That was me.  The best results are with 256 or 512k chunk sizes.
  Above 512k you don't get any more benefit.

------

  My questions at this point -- why are SW and HW raid so different?
Aren't they doing the same algorithms on the same media?  SW might
be a bit slower at some things (or it might be faster if it's good
SW and the HW doesn't clearly make it faster).

  Secondly, how would array size affect the choice for chunk size?  
Wouldn't chunk size be based on your average update size, trading
off against the increased benefit of a larger chunk size benefitting 
reads more than writes.  I.e. if you read 10 times as much as write,
then maybe faster reads provide a clear win, but if you update
nearly as much as read, then a stripe size closer to your average
update size would be preferable.

  Concerning the benefit of a larger chunk size benefitting reads --
would that benefit be less if one also was using read-ahead on the
array?

  >-----------------------<
   
In another note, Luca Berra commented, in response to my observation 
that my 256K-data wide stripes (4x64K chunks) would be skewed by a
chunk size on my PV's that defaulted to starting data@offset 192K:

LB> it will cause multiple R-M-W cycles fro writes that cross stripe
LB> boundary, not good.

I don't see how it would make a measurable difference.  If it did, 
wouldn't we also have to account for the parity disks so that they
are aligned as well -- as they also have to be written during 
a stripe-write?  I.e. -- if it is a requirement that they be aligned,
it seems that the LVM alignment has to be:

  (total disks)x(chunk-size)

not 

  (data-disks)x(chunk-size)

as I *think* we were both thinking when we earlier discussed this.

Either way, I don't know how much of an effect there would be if,
when updating a stripe, some of the disks read/write chunk "N", while
the other disks use chunk "N-1"...  They would all be writing 1
chunk/stripe update, no?  The only conceivable impact on performance
would be at some 'boundary' point -- if your volume contained
multiple physical partitions -- but those would be far and few 
between large areas where it should (?) make no difference.  Eh?

Linda
