Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05B4EF1020
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 19:53:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A46B318AE956
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 19:53:34 +0000 (UTC)
MIME-Version: 1.0
Message-ID: <24409.12987.382863.95686@quad.stoffel.home>
Date: Wed, 9 Sep 2020 15:53:31 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <7d62cb86425416d5a3db115afdbd996c@assyoma.it>
References: <79061390.1069833.1599071934227.JavaMail.zimbra@karlsbakk.net>
	<53661d4eefb635710b51cf9bfee894ef@assyoma.it>
	<83152674.4938205.1599663690759.JavaMail.zimbra@karlsbakk.net>
	<3503b4f5b55345beb24de4b156ee75c7@assyoma.it>
	<24409.9033.527504.36789@quad.stoffel.home>
	<7d62cb86425416d5a3db115afdbd996c@assyoma.it>
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
To: Gionatan Danti <g.danti@assyoma.it>
Cc: Roy Sigurd Karlsbakk <roy@karlsbakk.net>, =?iso-8859-1?Q?H=E5kon?= <hawken@thehawken.org>, LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "Gionatan" == Gionatan Danti <g.danti@assyoma.it> writes:

Gionatan> Il 2020-09-09 20:47 John Stoffel ha scritto:
>> This assumes you're tiering whole files, not at the per-block level
>> though, right?

Gionatan> The tiered approach I developed and maintained in the past, yes. For any 
Gionatan> LVM-based tiering, we are speaking about block-level tiering (as LVM 
Gionatan> itself has no "files" concept).

>> Do you have numbers?  I'm using DM_CACHE on my home NAS server box,
>> and it *does* seem to help, but only in certain cases.   I've got a
>> 750gb home directory LV with an 80gb lv_cache writethrough cache
>> setup.  So it's not great on write heavy loads, but it's good in read
>> heavy ones, such as kernel compiles where it does make a difference.

Gionatan> Numbers for available space for tiering vs cache can vary
Gionatan> based on your setup. However, storage tiers generally are at
Gionatan> least 5-10X apart from each other (ie: 1 TB SSD for 10 TB
Gionatan> HDD). Hence my gut fealing that tiering is not drastically
Gionatan> better then lvm cache. But hey - I reserve the right to be
Gionatan> totally wrong ;)

Very true, numbers talk, annecdotes walk... 

>> So it's not only the caching being per-file or per-block, but how the
>> actual cache is done?  writeback is faster, but less reliable if you
>> crash.  Writethrough is slower, but much more reliable.

Gionatan> writeback cache surely is more prone to failure vs
Gionatan> writethoug cache. The golden rule is that writeback cache
Gionatan> should use a mirrored device (with device-level powerloss
Gionatan> protected writeback cache if sync write speed is important).

Even in my case I use mirrored SSDs for my cache LVs.  It's the only
sane thing to do IMHO.

Gionatan> But this is somewhat ortogonal to the original question:
Gionatan> block-level tiering itself increases the chances of data
Gionatan> loss (ie: losing the SSD component will ruin the entire
Gionatan> filesystem), so you should used mirrored (or parity) device
Gionatan> for tiering also.

It does, you really need to have a solid setup in terms of hardware,
with known failures modes you can handle, before you start trying to
tier blocks.

Though maybe a write through block cache would be ok, since the cache
would only be for reads, not writes.  Which could help if you have a
bunch of VMs (or containers, or whatevers) with alot of duplicated
data that are all hitting the disk systems at once.
