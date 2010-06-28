Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5SIuSV8013625
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2010 14:56:28 -0400
Received: from sv4-mta-52b.us.emailfiltering.com
	(sv4-mta-52b.emailfiltering.com [208.87.137.233])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o5SIuHXr024199
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2010 14:56:18 -0400
Received: from smtp.media-brokers.com ([70.43.81.99])
	by sv4-mta-52b.us.emailfiltering.com with emfmta (version 4.5.0.261)
	vanilla id 570853242 for linux-lvm@redhat.com; b604fcabe8fd5b2c;
	Mon, 28 Jun 2010 11:56:17 -0700
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id D3BB2551A23
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2010 14:56:16 -0400 (EDT)
Message-ID: <4C28F050.9090703@Media-Brokers.com>
Date: Mon, 28 Jun 2010 14:56:16 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
References: <4BF5A883.7060503@tlinx.org>	<20100521051021.GA1412@maude.comedia.it>	<4BF62CBF.3070702@tlinx.org>	<20100522072321.GB12294@maude.comedia.it>	<4BFEA099.9020005@redhat.com>	<4C1EE9ED.9080201@tlinx.org>	<25E3A700-B320-4F84-8694-4DE5AD4D0A83@redhat.com>
	<4C246A7A.50202@tlinx.org>
In-Reply-To: <4C246A7A.50202@tlinx.org>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On 2010-06-25 4:36 AM, Linda A. Walsh wrote:
> Doug Ledford wrote:
>> Correction: all reads benefit from larger chunks now a days.  The only
>> reason to use smaller chunks in the past was to try and get all of
>> your drives streaming data to you simultaneously, which effectively
>> made the total aggregate throughput of those reads equal to the
>> throughput of one data disk times the number of data disks in the
>> array.  With modern drives able to put out 100MB/s sustained by
>> themselves, we don't really need to do this any more, ....

> I would regard 100MB/s as moderately slow.  For files in my
> server cache, my Win7 machine reads @ 110MB/s over the network,

My understanding is Gigabit ethernet is only capable of topping out at
about 30MB/s, so, I'm curious what kind of network you have? 10GBe? Fiber?

-- 

Best regards,

Charles
