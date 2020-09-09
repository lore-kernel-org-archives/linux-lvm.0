Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4743E2157F45
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 19:44:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEF208C0867
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 19:44:36 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 09 Sep 2020 21:44:22 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <24409.9033.527504.36789@quad.stoffel.home>
References: <79061390.1069833.1599071934227.JavaMail.zimbra@karlsbakk.net>
	<53661d4eefb635710b51cf9bfee894ef@assyoma.it>
	<83152674.4938205.1599663690759.JavaMail.zimbra@karlsbakk.net>
	<3503b4f5b55345beb24de4b156ee75c7@assyoma.it>
	<24409.9033.527504.36789@quad.stoffel.home>
Message-ID: <7d62cb86425416d5a3db115afdbd996c@assyoma.it>
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

Il 2020-09-09 20:47 John Stoffel ha scritto:
> This assumes you're tiering whole files, not at the per-block level
> though, right?

The tiered approach I developed and maintained in the past, yes. For any 
LVM-based tiering, we are speaking about block-level tiering (as LVM 
itself has no "files" concept).

> Do you have numbers?  I'm using DM_CACHE on my home NAS server box,
> and it *does* seem to help, but only in certain cases.   I've got a
> 750gb home directory LV with an 80gb lv_cache writethrough cache
> setup.  So it's not great on write heavy loads, but it's good in read
> heavy ones, such as kernel compiles where it does make a difference.

Numbers for available space for tiering vs cache can vary based on your 
setup. However, storage tiers generally are at least 5-10X apart from 
each other (ie: 1 TB SSD for 10 TB HDD). Hence my gut fealing that 
tiering is not drastically better then  lvm cache. But hey - I reserve 
the right to be totally wrong ;)

> So it's not only the caching being per-file or per-block, but how the
> actual cache is done?  writeback is faster, but less reliable if you
> crash.  Writethrough is slower, but much more reliable.

writeback cache surely is more prone to failure vs writethoug cache. The 
golden rule is that writeback cache should use a mirrored device (with 
device-level powerloss protected writeback cache if sync write speed is 
important).

But this is somewhat ortogonal to the original question: block-level 
tiering itself increases the chances of data loss (ie: losing the SSD 
component will ruin the entire filesystem), so you should used mirrored 
(or parity) device for tiering also.

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
