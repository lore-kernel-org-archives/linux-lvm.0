Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC65B2018035
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 19:22:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51E5D1021E16
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 19:22:01 +0000 (UTC)
MIME-Version: 1.0
Message-ID: <24409.11092.463210.979119@quad.stoffel.home>
Date: Wed, 9 Sep 2020 15:21:56 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <47bb87b8-d2c9-e3ce-0e76-d60fbd39ec99@redhat.com>
References: <79061390.1069833.1599071934227.JavaMail.zimbra@karlsbakk.net>
	<53661d4eefb635710b51cf9bfee894ef@assyoma.it>
	<83152674.4938205.1599663690759.JavaMail.zimbra@karlsbakk.net>
	<3503b4f5b55345beb24de4b156ee75c7@assyoma.it>
	<24409.9033.527504.36789@quad.stoffel.home>
	<47bb87b8-d2c9-e3ce-0e76-d60fbd39ec99@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Looking ahead - tiering with LVM?
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: Roy Sigurd Karlsbakk <roy@karlsbakk.net>, =?iso-8859-1?Q?H=E5kon?= <hawken@thehawken.org>, LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "Zdenek" == Zdenek Kabelac <zkabelac@redhat.com> writes:

Zdenek> Dne 09. 09. 20 v 20:47 John Stoffel napsal(a):
>>>>>>> "Gionatan" == Gionatan Danti <g.danti@assyoma.it> writes:
>> 
Gionatan> Il 2020-09-09 17:01 Roy Sigurd Karlsbakk ha scritto:
>>>> First, filelevel is usually useless. Say you have 50 VMs with Windows
>>>> server something. A lot of them are bound to have a ton of equal
>>>> storage in the same areas, but the file size and content will vary
>>>> over time. With blocklevel tiering, that could work better.
>> 
Gionatan> It really depends on the use case. I applied it to a
Gionatan> fileserver, so working at file level was the right
Gionatan> choice. For VMs (or big files) it is useless, I agree.
>> 
>> This assumes you're tiering whole files, not at the per-block level
>> though, right?
>> 
>>>> This is all known.
>> 
Gionatan> But the only reason to want tiering vs cache is the
Gionatan> additional space the former provides. If this additional
Gionatan> space is so small (compared to the combined, total volume
Gionatan> space), tiering's advantage shrinks to (almost) nothing.
>> 
>> Do you have numbers?  I'm using DM_CACHE on my home NAS server box,
>> and it *does* seem to help, but only in certain cases.   I've got a
>> 750gb home directory LV with an 80gb lv_cache writethrough cache
>> setup.  So it's not great on write heavy loads, but it's good in read
>> heavy ones, such as kernel compiles where it does make a difference.
>> 
>> So it's not only the caching being per-file or per-block, but how the
>> actual cache is done?  writeback is faster, but less reliable if you
>> crash.  Writethrough is slower, but much more reliable.

Zdenek> dm-cache (--type cache) is  hotspot cache (most used areas of device)

I assume this is what I'm using on Debian Buster (10.5) right now?  I
use the crufty tool 'lvcache' to look at and manage my cache devices.  

Zdenek> dm-writecache (--type writecache) is great with
Zdenek> write-extensive load (somewhat extends your page cache on your
Zdenek> NMVe/SSD/persistent-memory)

I don't think I'm using this at all:

sudo lvcache status data/home
+-----------------------+------------------+
| Field                 | Value            |
+-----------------------+------------------+
| cached                | True             |
| size                  | 806380109824     |
| cache_lv              | home_cache       |
| cache_lv_size         | 85899345920      |
| metadata_lv           | home_cache_cmeta |
| metadata_lv_size      | 83886080         |
| cache_block_size      | 192              |
| cache_utilization     | 873786/873813    |
| cache_utilization_pct | 99.996910094     |
| demotions             | 43213            |
| dirty                 | 0                |
| end                   | 1574961152       |
| features              | 1                |
| md_block_size         | 8                |
| md_utilization        | 2604/20480       |
| md_utilization_pct    | 12.71484375      |
| promotions            | 43208            |
| read_hits             | 138697828        |
| read_misses           | 7874434          |
| segment_type          | cache            |
| start                 | 0                |
| write_hits            | 777455171        |
| write_misses          | 9841866          |
+-----------------------+------------------+


Zdenek> We were thinking about layering cached above each other - but so far there
Zdenek> was no big demand and also the complexity of solving problem is rising greatly 
Zdenek> -  aka there is no problem to let users to stack cache on top of another cache
Zdenek> on top of 3rd. cache - but what should have when it starts failing...

Zdenek> AFAIK there is no one yet writing driver for combining i.e. SSD + HDD
Zdenek> into a single drive which would be relocating blocks (so you get total size as 
Zdenek> aproximate sum of both devices) - but there is dm-zoned  which solves somewhat 
Zdenek> similar problem - but I've no experience with that...

Zdenek> Zdenek
