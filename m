Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A02442166B2B
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2020 22:35:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58515185A78E
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2020 22:35:18 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 24 Mar 2020 23:35:12 +0100
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <4f10a1a7-0dc4-0e66-641d-62176f26614e@redhat.com>
References: <CACRKOwz_fOJiTVhbUqJR_EaxrKbf2bk+wb6LYOy0yWDkvt+buw@mail.gmail.com>
	<20200323082608.7i6wzq2t3k24hzun@reti>
	<7931a754-cf8e-eb6c-adf1-d54784dbf73f@redhat.com>
	<CACRKOwzT2qk_wWNo5m_ZeKa-S6ZoXSxPhJhQVGceNVDzmKu-GQ@mail.gmail.com>
	<7a6785c5-61b6-e398-293d-795ddc48e406@redhat.com>
	<3b205fe6a822fc4e33053985ed8ed51d@assyoma.it>
	<4f10a1a7-0dc4-0e66-641d-62176f26614e@redhat.com>
Message-ID: <da1ff669e1f69c4f02c10dc4726190d9@assyoma.it>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] when bringing dm-cache online,
	consumes all memory and reboots
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: Mcdermott <scott@smemsh.net>, Scott, LVM general discussion and development <linux-lvm@redhat.com>

Il 2020-03-24 16:09 Zdenek Kabelac ha scritto:
> In past we had problem that when users have been using huge chunk size,
> and small 'migration_threashold' - the cache was unable to demote 
> chunks
> from the cache to the origin device  (the size of 'required' data for
> demotion were bigger then what has been allowed by threshold).
> 
> So lvm2/libdm implemented protection to always set at least 8 chunks
> is the bare minimum.
> 
> Now we face clearly the problem from 'the other side' - users have way
> too big chunks (we've seen users with 128M chunks) - and so threshold
> is set to 1G
> and users are facing serious bottleneck on the cache side doing to many
> promotions/demotions.
> 
> We will likely fix this by setting max chunk size somewhere around 
> 2MiB.

Thanks for the explanation. Maybe is a naive proposal, but can't you 
simply set migration_threshold equal to a single chunk for >2M sized 
chunks, and 8 chunks for smaller ones?

> Yeah - if you read only 'directory' metadata structures - it's
> perfectly OK with caching, if you do a full data read of the whole
> storage it's not going to help (which is what I've meant).
> 
> The main message is - cache is there to accelerate often read disk 
> blocks.
> If there is no hotspot and disk is mostly read over the whole address
> space equally there will be no big benefit of cache usage.
> 
> However main message should be - user should think about sizes of 
> caching
> devices and its implications - there is no universal setting that fits
> best all users.

Sure.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it [1]
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
