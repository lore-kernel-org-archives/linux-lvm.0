Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KKkxOG000554
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 16:46:59 -0400
Received: from mail.volved.com (c-71-192-139-98.hsd1.ma.comcast.net
	[71.192.139.98])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8KKkqDc027432
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 16:46:52 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.volved.com (Postfix) with ESMTP id 2177C1BA8
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 15:46:00 -0400 (EDT)
Received: from mail.volved.com ([127.0.0.1])
	by localhost (monolith [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 09700-18 for <linux-lvm@redhat.com>;
	Wed, 20 Sep 2006 15:45:48 -0400 (EDT)
Received: from [192.168.0.210] (unknown [192.168.0.210])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.volved.com (Postfix) with ESMTP id 7A41B1BA7
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 15:45:48 -0400 (EDT)
Message-ID: <45119A6B.6090508@volved.com>
Date: Wed, 20 Sep 2006 15:45:47 -0400
From: Barnaby Claydon <bclaydon@volved.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Misleading documentation
References: <1158603016.7182.12.camel@localhost.localdomain>	<450EEEA0.7020703@mdmiller.com>	<1158606792.7182.15.camel@localhost.localdomain>	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>	<1158608077.7182.18.camel@localhost.localdomain>	<20060918193728.GC28043@arvo.suso.org>	<4B875923-CB76-4792-837B-EDA3B9E53756@slamb.org>	<20060920032222.GF28043@arvo.suso.org>
	<1158751643.12030.46.camel@bounty.rider.geekspirit.net>
In-Reply-To: <1158751643.12030.46.camel@bounty.rider.geekspirit.net>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Fabien Jakimowicz wrote:
> On Wed, 2006-09-20 at 03:22 +0000, Mark Krenz wrote:
>   
>>   Personally I like it when documentation is kept simple and uses simple
>> examples.  There is nothing worse than when you are trying to learn
>> something and it tells you how to how to intantiate a variable, and then
>> it immediately goes on to show you how to make some complicated reference
>> to it using some code.
>>
>>   I agree with you though, its probably a good idea to steer newcomers
>> in the right direction on disk management and a few notes about doing
>> LVM ontop of RAID being a good idea couldn't hurt.  This is especially
>> so since I've heard three mentions of people using LVM on a server
>> without doing RAID this week alone. :-/
>>     
> We should add something in faq page
> ( http://tldp.org/HOWTO/LVM-HOWTO/lvm2faq.html ), like "i've lost one of
> my hard drive and i can't mount my lv, did i lost everything ?" followed
> by a quick explanation : lvm is NOT faulty tolerant like raid1/5, if you
> lose a PV, you lose every LV which was (even partially) on on it.
>   
<snip>

Not to nit-pick, but when one of my multi-PV LVs experienced a single PV 
failure, I did NOT lose all the data on the LV. The VG was using linear 
spanning, so using the --partial parameter with read-only file-system 
mounting (XFS in my case) I recovered all the data from the LV that 
wasn't physically spanned onto the failed PV.

If this was some sort of miracle and shouldn't have worked, well I 
suppose I'll count my blessings but it seemed perfectly reasonable at 
the time.

:)

-Barnaby
