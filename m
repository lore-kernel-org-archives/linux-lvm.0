Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88DF42166B27
	for <linux-lvm@redhat.com>; Tue, 10 Dec 2019 11:23:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 906C785A333
	for <linux-lvm@redhat.com>; Tue, 10 Dec 2019 11:23:19 +0000 (UTC)
References: <A8A53B0E4B7ACF4BAD5C77D3671AC8976ABE90D8@EX01.edgeware.tv>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <0154b0c2-be41-cf37-0973-2ade719321cd@assyoma.it>
Date: Tue, 10 Dec 2019 12:23:14 +0100
MIME-Version: 1.0
In-Reply-To: <A8A53B0E4B7ACF4BAD5C77D3671AC8976ABE90D8@EX01.edgeware.tv>
Content-Language: it
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Best way to run LVM over multiple SW RAIDs?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Daniel Janzon <daniel.janzon@edgeware.tv>

On 09/12/19 11:26, Daniel Janzon wrote:
> Exactly. The md driver executes on a single core, but with a bunch of RAID5s
> I can distribute the load over many cores. That's also why I cannot join the
> bunch of RAID5's with a RAID0 (as someone suggested) because then again
> all data is pulled through a single core.

MD RAID0 is extremely fast, using a single core at the striping level 
should pose no problem. Did you actually tried this setup?

Anyway, the suggestion from Guoqing Jiang sound promising. Let me quote him:

> Perhaps set "/sys/block/mdx/md/group_thread_cnt" could help here,
> see below commits:
> 
> commit b721420e8719131896b009b11edbbd27d9b85e98
> Author: Shaohua Li <shli@kernel.org>
> Date:   Tue Aug 27 17:50:42 2013 +0800
> 
>      raid5: sysfs entry to control worker thread number
> 
> commit 851c30c9badfc6b294c98e887624bff53644ad21
> Author: Shaohua Li <shli@kernel.org>
> Date:   Wed Aug 28 14:30:16 2013 +0800
> 
>      raid5: offload stripe handle to workqueue

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
