References: <79061390.1069833.1599071934227.JavaMail.zimbra@karlsbakk.net>
	<53661d4eefb635710b51cf9bfee894ef@assyoma.it>
	<83152674.4938205.1599663690759.JavaMail.zimbra@karlsbakk.net>
	<3503b4f5b55345beb24de4b156ee75c7@assyoma.it>
	<24409.9033.527504.36789@quad.stoffel.home>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <47bb87b8-d2c9-e3ce-0e76-d60fbd39ec99@redhat.com>
Date: Wed, 9 Sep 2020 21:10:13 +0200
MIME-Version: 1.0
In-Reply-To: <24409.9033.527504.36789@quad.stoffel.home>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, John Stoffel <john@stoffel.org>
Cc: Roy Sigurd Karlsbakk <roy@karlsbakk.net>, =?UTF-8?B?SMOla29u?= <hawken@thehawken.org>

Dne 09. 09. 20 v 20:47 John Stoffel napsal(a):
>>>>>> "Gionatan" == Gionatan Danti <g.danti@assyoma.it> writes:
> 
> Gionatan> Il 2020-09-09 17:01 Roy Sigurd Karlsbakk ha scritto:
>>> First, filelevel is usually useless. Say you have 50 VMs with Windows
>>> server something. A lot of them are bound to have a ton of equal
>>> storage in the same areas, but the file size and content will vary
>>> over time. With blocklevel tiering, that could work better.
> 
> Gionatan> It really depends on the use case. I applied it to a
> Gionatan> fileserver, so working at file level was the right
> Gionatan> choice. For VMs (or big files) it is useless, I agree.
> 
> This assumes you're tiering whole files, not at the per-block level
> though, right?
> 
>>> This is all known.
> 
> Gionatan> But the only reason to want tiering vs cache is the
> Gionatan> additional space the former provides. If this additional
> Gionatan> space is so small (compared to the combined, total volume
> Gionatan> space), tiering's advantage shrinks to (almost) nothing.
> 
> Do you have numbers?  I'm using DM_CACHE on my home NAS server box,
> and it *does* seem to help, but only in certain cases.   I've got a
> 750gb home directory LV with an 80gb lv_cache writethrough cache
> setup.  So it's not great on write heavy loads, but it's good in read
> heavy ones, such as kernel compiles where it does make a difference.
> 
> So it's not only the caching being per-file or per-block, but how the
> actual cache is done?  writeback is faster, but less reliable if you
> crash.  Writethrough is slower, but much more reliable.

Hi

dm-cache (--type cache) is  hotspot cache (most used areas of device)

dm-writecache (--type writecache) is great with write-extensive load (somewhat 
extends your page cache on your NMVe/SSD/persistent-memory)

We were thinking about layering cached above each other - but so far there
was no big demand and also the complexity of solving problem is rising greatly 
-  aka there is no problem to let users to stack cache on top of another cache
on top of 3rd. cache - but what should have when it starts failing...

AFAIK there is no one yet writing driver for combining i.e. SSD + HDD
into a single drive which would be relocating blocks (so you get total size as 
aproximate sum of both devices) - but there is dm-zoned  which solves somewhat 
similar problem - but I've no experience with that...

Zdenek
