Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27BF92157F25
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 19:49:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D26F101A569
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 19:49:52 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 09 Sep 2020 21:49:31 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <695805084.5038574.1599680480630.JavaMail.zimbra@karlsbakk.net>
References: <79061390.1069833.1599071934227.JavaMail.zimbra@karlsbakk.net>
	<53661d4eefb635710b51cf9bfee894ef@assyoma.it>
	<83152674.4938205.1599663690759.JavaMail.zimbra@karlsbakk.net>
	<3503b4f5b55345beb24de4b156ee75c7@assyoma.it>
	<695805084.5038574.1599680480630.JavaMail.zimbra@karlsbakk.net>
Message-ID: <daf74778e6b44904e6a07a4e38c8c03a@assyoma.it>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Roy Sigurd Karlsbakk <roy@karlsbakk.net>, =?UTF-8?Q?H=C3=A5kon?= <hawken@thehawken.org>

Il 2020-09-09 21:41 Roy Sigurd Karlsbakk ha scritto:
>>> First, filelevel is usually useless. Say you have 50 VMs with Windows
>>> server something. A lot of them are bound to have a ton of equal
>>> If you look at IOPS instead of just sequencial speed, you'll see the
>>> difference. A set of 10 drives in a RAID-6 will perhaps, maybe, give
>>> you 1kIOPS, while a single SSD might give you 50kIOPS or even more.
>>> This makes a huge impact.
>> 
>> IOPs are already well server by LVM cache. So, I genuinely ask: what
>> would be tiering advantage here? I'll love to ear a reasonable use 
>> case.
> 
> LVMcache only helps if the cache is there in the first place and IIRC
> it's cleared after a reboot.

I seem to remember that cache is persistent, but a writeback cache must 
be flushed to the underlying disk in case of unclean shutdown. This, 
however, should not empty the cache itself.

> It help won't that much over time with large storage. It also wastes 
> space.

I tend to disagree: with large storage, you really want an hotspot cache 
vs a tiered approach unless:
a) the storage tiers are comparable in size, which is quite rare;
b) the slow storage does some sort of offline compression/deduplication, 
with the faster layer being a landing zone for newly ingested data.

Can you describe a reasonable real-world setup where plain LVM tiering 
would be useful? Again, this is a genuine question: I am interested in 
different storage setup than mine.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
