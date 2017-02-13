Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1DCtlnB026906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 07:55:47 -0500
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B14AA61D28
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 12:55:45 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id 89so24005734wrr.1
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 04:55:44 -0800 (PST)
References: <CAPWV3huuXGcpuvOd8DYykHfDR+x+QuxLO7u5u5hLg1RZMov2TA@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <7252715d-7ef5-a105-becf-03c028b3e1cc@gmail.com>
Date: Mon, 13 Feb 2017 13:55:41 +0100
MIME-Version: 1.0
In-Reply-To: <CAPWV3huuXGcpuvOd8DYykHfDR+x+QuxLO7u5u5hLg1RZMov2TA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Caching policy in machine learning context
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
To: Jonas.Degrave@ugent.be, LVM general discussion and development <linux-lvm@redhat.com>

Dne 13.2.2017 v 11:58 Jonas Degrave napsal(a):
> Hi,
>
> We are a group of scientists, who work on reasonably sized datasets
> (10-100GB). Because we had troubles managing our SSD's (everyone likes to have
> their data on the SSD), I set up a caching system where the 500GB SSD caches
> the 4TB HD. This way, everybody would have their data virtually on the SSD,
> and only the first pass through the dataset would be slow. Afterwards, it
> would be cached anyway, and the reads would be faster.
>
> I used lvm-cache for this. Yet, it seems that the (only) smq-policy is very
> reluctant in promoting data to the cache, whereas what we would need, is that
> data is promoted basically upon the first read. Because if someone is using
> the machine on certain data, they will most likely go over the dataset a
> couple of hundred times in the following hours.
>
> Right now, after a week of testing lvm-cache with the smq-policy, it looks
> like this:
>
>     jdgrave@kat:~$ sudo ./lvmstats
>     start              0
>     end                7516192768
>     segment_type       cache
>     md_block_size      8
>     md_utilization     14353/1179648
>     cache_block_size   128
>     cache_utilization  7208960/7208960
>     read_hits          19954892
>     read_misses        84623959
>     read_hit_ratio     19.08%
>     write_hits         672621
>     write_misses       7336700
>     write_hit_ratio    8.40%
>     demotions          151757
>     promotions         151757
>     dirty              0
>     features           1
>
>
>      jdgrave@kat:~$ sudo ./lvmcache-statistics.sh
>     -------------------------------------------------------------------------
>     LVM [2.02.133(2)] cache report of found device /dev/VG/lv
>     -------------------------------------------------------------------------
>     - Cache Usage: 100.0% - Metadata Usage: 1.2%
>     - Read Hit Rate: 19.0% - Write Hit Rate: 8.3%
>     - Demotions/Promotions/Dirty: 151757/151757/0
>     - Feature arguments in use: writeback
>     - Core arguments in use : migration_threshold 2048 smq 0
>       - Cache Policy: stochastic multiqueue (smq)
>     - Cache Metadata Mode: rw
>     - MetaData Operation Health: ok
>
>
> The number of promotions has been very low, even though the read hit rate is
> low as well. This is with a cache of 450GB, and currently only 614GB of data
> on the cached device. A read hit rate of lower than 20%, when just randomly
> caching would have achieved 73% is not what I would have hoped to get.
>
> Is there a way to make the caching way more aggressive? Some settings I can tweak?
>

Hi

You've not reported kernel version use.
Please provide results kernel 4.9.

Also note - cache will NOT cache blocks which are well enough covered by 
'page-cache' and it's also 'slow' moving case - so it needs couple repeated 
usage of blocks (without page-cache)  to be promoted to cache.

Regards

Zdenek
