Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D28322166B2B
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2020 11:37:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D521800295
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2020 11:37:56 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 24 Mar 2020 12:37:51 +0100
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <7a6785c5-61b6-e398-293d-795ddc48e406@redhat.com>
References: <CACRKOwz_fOJiTVhbUqJR_EaxrKbf2bk+wb6LYOy0yWDkvt+buw@mail.gmail.com>
	<20200323082608.7i6wzq2t3k24hzun@reti>
	<7931a754-cf8e-eb6c-adf1-d54784dbf73f@redhat.com>
	<CACRKOwzT2qk_wWNo5m_ZeKa-S6ZoXSxPhJhQVGceNVDzmKu-GQ@mail.gmail.com>
	<7a6785c5-61b6-e398-293d-795ddc48e406@redhat.com>
Message-ID: <3b205fe6a822fc4e33053985ed8ed51d@assyoma.it>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Scott Mcdermott <scott@smemsh.net>

Il 2020-03-24 10:43 Zdenek Kabelac ha scritto:
> By default we require migration threshold to be at least 8 chunks big.
> So with big chunks like 2MiB in size - gives you 16MiBof required I/O 
> threshold.
> 
> So if you do i.e. read 4K from disk - it may cause i/o load of 2MiB
> chunk block promotion into cache - so you can see the math here...

Hi Zdenek, I am not sure to following you description of 
migration_threshold. From dm-cache kernel doc:

"Migrating data between the origin and cache device uses bandwidth.
The user can set a throttle to prevent more than a certain amount of
migration occurring at any one time.  Currently we're not taking any
account of normal io traffic going to the devices.  More work needs
doing here to avoid migrating during those peak io moments.
For the time being, a message "migration_threshold <#sectors>"
can be used to set the maximum number of sectors being migrated,
the default being 2048 sectors (1MB)."

Can you better explain what really migration_threshold accomplishes? It 
is a "max bandwidth cap" settings, or something more?

> If the main workload is to read whole device over & over again likely
> no caching will enhance your experience and you may simply need fast
> whole
> storage.

 From what I understand the OP want to cache filesystem metadata to 
speedup rsync directory traversal. So a cache device should definitely 
be useful; albeit dm-cache being "blind" in regard to data vs metadata, 
the latter should be good candidate for hotspot promotion.

For reference, I have a ZFS system exactly used for such a workload 
(backup with rsnapshot, which uses rsync and hardlink to create 
deduplicated backups) and setting cache=metadata (rather than "all", so 
data and metadata) gives a very noticeable boot to rsync traversal.

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it [1]
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
