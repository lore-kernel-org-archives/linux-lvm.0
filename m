Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E48495D6A6
	for <linux-lvm@redhat.com>; Wed,  7 Nov 2018 17:20:12 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4EBF5307D842
	for <linux-lvm@redhat.com>; Wed,  7 Nov 2018 17:20:11 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id u18so12029787lff.10
	for <linux-lvm@redhat.com>; Wed, 07 Nov 2018 09:20:11 -0800 (PST)
MIME-Version: 1.0
References: <CAPE0SYz1YErdNSn0_3MHmyoVXdOr90n1M-nJZ4_TwfzsULzQOg@mail.gmail.com>
In-Reply-To: <CAPE0SYz1YErdNSn0_3MHmyoVXdOr90n1M-nJZ4_TwfzsULzQOg@mail.gmail.com>
From: Liwei <xieliwei@gmail.com>
Date: Thu, 8 Nov 2018 01:19:54 +0800
Message-ID: <CAPE0SYxeLHQLBpvgC+-DyynBpZ8zwnEJmLr_bpjv3XwQKx3MSA@mail.gmail.com>
Subject: Re: [linux-lvm] Detaching a failed cache pool
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 24 Oct 2018 at 14:36, Liwei <xieliwei@gmail.com> wrote:
>
> Hi list,
>     I have an LV with a corrupted cache. Looking at the cmeta using
> cache_dump, I get this:
>
> <superblock uuid="" block_size="128" nr_cache_blocks="0" policy=""
> hint_width="4">
>   <mappings>
> metadata contains errors (run cache_check for details).
> perhaps you wanted to run with --repair ?
>
>     Running with --repair just produces metadata with no mappings and
> hints, which is incorrect too.
>
>     Obviously the metadata volume is corrupted beyond recovery, but I
> am okay with that as it is a read-only LV and we are using the cache
> for read acceleration. However, there seems to be no way for us to get
> out of this state into something usable? I can't seem to remove the
> cache from the LV. I've read through the documentation for lvmcache
> and can't find any information about this.
>
>     At the moment I can't access the original LV anymore. Whatever I
> try to do always results in "Check of pool vg/lv-cache failed
> (status:1). Manual repair required!" What am I missing?
>
> Thanks!
> Liwei

Okay, just a quick response to close up this issue. There is a simple solution.

Note that this only makes sense for a writethrough cache as whatever
is in the cache should be safe to discard. I'm not sure if it makes
sense to try this for other cache types. Please do make sure you
understand what's happening before trying the following.

Also, this is based on very limited understanding I have obtained from
trying to search for a solution. Those who are more experienced please
do correct me if what I'm doing is superfluous, stupid or just
outright dangerously wrong!

Assuming the block_size of 128 sectors is correct, I simply have to
calculate the correct nr_cache_blocks and edit the generated cmeta xml
file.

Once edited, run cache_restore using the modified xml file to generate
the required metadata (albeit an empty cache). Swap the cmeta LV back
into the cache LV and it should stop complaining. At this point, I
could split off the cache pool from the origin LV and work with my
origin LV as per a normal uncached LV.

To be sure of the block_size and nr_cache_blocks, you can try creating
a dummy cache pool LV of the exact size and dump its cmeta as xml.
Assuming you're using the same kernel and lvm tools versions, the
block_size should match the corrupted one.

(Then again, I realise if we're going to thrash the cache anyway, we
don't need the block_size to be correct, just make sure that
block_size and nr_cache_blocks make sense in covering the entire cdata
LV)

Hope this helps!
Liwei
