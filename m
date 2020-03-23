Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00CBB100D6F
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 22:02:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EC7B8F7821
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 22:02:38 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id m9so9900731vso.2
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 15:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <CACRKOwz_fOJiTVhbUqJR_EaxrKbf2bk+wb6LYOy0yWDkvt+buw@mail.gmail.com>
	<20200323082608.7i6wzq2t3k24hzun@reti>
	<7931a754-cf8e-eb6c-adf1-d54784dbf73f@redhat.com>
In-Reply-To: <7931a754-cf8e-eb6c-adf1-d54784dbf73f@redhat.com>
From: Scott Mcdermott <scott@smemsh.net>
Date: Mon, 23 Mar 2020 15:02:24 -0700
Message-ID: <CACRKOwzT2qk_wWNo5m_ZeKa-S6ZoXSxPhJhQVGceNVDzmKu-GQ@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Mar 23, 2020 at 2:57 AM Zdenek Kabelac <zkabelac@redhat.com> wrote:
> Dne 23. 03. 20 v 9:26 Joe Thornber napsal(a):
> > On Sun, Mar 22, 2020 at 10:57:35AM -0700, Scott Mcdermott wrote:
> > > have a 931.5 GibiByte SSD pair in raid1 (mdraid) as cache LV for a
> > > data LV on 1.8 TebiByte raid1 (mdraid) pair of larger spinning disk.
>
> Users should be 'performing' some benchmarking about the 'useful' sizes of
> hotspot areas - using nearly 1T of cache for 1.8T of origin doesn't look
> the right ration for caching.
> (i.e. like if your CPU cache would be halve of your DRAM)

the 1.8T origin will be upgraded over time with larger/more spinning
disks, but the cache will remain as it is.  hopefully it can perform
well whether it is 1:2 cache:data as now or 1:10+ as later.

> Too big 'cache size' leads usually into way too big caching chunks
> (since we try to limit number of 'chunks' in cache to 1 milion  - you
> can rise up this limit - but it will consume a lot of your RAM space as well)
> So IMHO I'd recommend to use at most 512K chunks - which gives you
> about 256GiB of cache size -  but still users should be benchmarking what is
> the best for them...)

how to raise this limit? since I'm low RAM this is a problem, but why
are large chunks an issue, besides memory usage? is this causing
unnecessary I/O by an amplification effect? if my system doesn't have
enough memory for this job I will have to find a host board with more
RAM.

> Another hint - lvm2 introduced support for new dm-writecache target as well.

this won't work for me since a lot of my data is reads, and I'm low
memory with large numbers of files.  rsync of large trees is the main
workload; existing algorithm is not working fantastically well, but
nonetheless giving a nice boost to my rsync completion times over the
uncached times.
