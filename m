Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9CA210F26F3
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2020 21:24:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FD5D80096B
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2020 21:24:17 +0000 (UTC)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 15 Sep 2020 23:24:08 +0200
Message-Id: <257A9B1C-04AC-4EDE-9671-9E7A60104F9F@gmail.com>
References: <2d496550-4609-0a26-489b-8721737c783b@redhat.com>
In-Reply-To: <2d496550-4609-0a26-489b-8721737c783b@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvm limitations
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
Content-Type: text/plain; charset="utf-8"
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>

thanks 

ok, lets say that I have 10 LV on a server, and want create a thin lv snapshot every hour and keep that for 30 days
that would be 24h * 30days * 10lv = 720 lv

if I want to keep snapshot copies from more nodes, to serve a single repository of snapshot copies, than these would easily become several hundred thousands of lv

not sure if this is a good idea, but I guess it can be very useful in some sense as block level incremental forever and instant recovery can be implemented for open sourced based applications

what reflections do you have on this idea?

regards Tomas

Sent from my iPhone

> On 15 Sep 2020, at 22:08, Zdenek Kabelac <zkabelac@redhat.com> wrote:
> 
> ﻿Dne 15. 09. 20 v 21:16 Tomas Dalebjörk napsal(a):
>> thanks for the feedback
>> in previous older versions of LVM, I guess that each lv requires a minor, major and these are might have limitations of how many can be addressed
>> but how about LVM2?
>> if I intend to have many hundred thousands of LV, would that be any issue?
> 
> Hi
> 
> 
> If you are asking about these limits -
> 
> major number is 12bits  4096
> minor number is 20bits  1048576
> 
> Since DM uses 1 single major - you are limited to ~1 million active LVs.
> But I assume system would be already slowed down to unsable level
> if you would ever reach 100 000 devices on a single system.
> (but you will experience major system slow-down with even just 10000
> active LVs...)
> 
> So as had been said - sensible/practical limit for lvm2 is around couple thousands of LVs. You can use 'more' but it would be more and more painful experience ;)
> 
> If you would have enough time :) and massive CPU power behind -
> you probably can even create VG with 1 million LVs - but the usability
> of such VG would be really for long-suffering users ;)
> 
> So yes hundred thousands of LVs in a single VG would be a BIG problem,
> but I don't see any useful use-case why anyone would need to manipulate
> with so many device within a single VG.
> 
> And if you really need hundred thousands - you will need to write much more efficient metadata management system...
> 
> And purely theoretically it's worth to note there is nontrivial amount of kernel memory and other resources needed per single device - so to run with million devices you would probably need some expensive hw (many TiB of RAM...)
> just to make the available - and then there should be some caching and something to use them....
> 
> Regards
> 
> Zdenek
> 
