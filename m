Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0BA05D961
	for <linux-lvm@redhat.com>; Tue, 23 Apr 2019 13:59:02 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E2F93086224
	for <linux-lvm@redhat.com>; Tue, 23 Apr 2019 13:59:01 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id y5so8577302qkc.11
	for <linux-lvm@redhat.com>; Tue, 23 Apr 2019 06:59:01 -0700 (PDT)
Date: Tue, 23 Apr 2019 09:58:58 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Message-ID: <20190423135858.GA5713@chatter.i7.local>
References: <20190419193036.GA24986@chatter.i7.local>
	<20190422182544.GA27249@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190422182544.GA27249@redhat.com>
Subject: Re: [linux-lvm] Network-attached block storage and local SSDs for
	dm-cache
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
Content-Transfer-Encoding: 7bit
To: Mike Snitzer <snitzer@redhat.com>
Cc: linux-lvm@redhat.com

On Mon, Apr 22, 2019 at 02:25:44PM -0400, Mike Snitzer wrote:
>> I know it's possible to set up dm-cache to combine network-attached
>> block devices and local SSDs, but I'm having a hard time finding any
>> first-hand evidence of this being done anywhere -- so I'm wondering
>> if it's because there are reasons why this is a Bad Idea, or merely
>> because there aren't many reasons for folks to do that.
>>
>> The reason why I'm trying to do it, in particular, is for
>> mirrors.kernel.org systems where we already rely on dm-cache to
>> combine large slow spinning disks with SSDs to a great advantage.
>> Most hits on those systems are to the same set of files (latest
>> distro package updates), so dm-cache hit-to-miss ratio is very
>> advantageous. However, we need to build newest iterations of those
>> systems, and being able to use network-attached storage at providers
>> like Packet with local SSD drives would remove the need for us to
>> purchase and host huge drive arrays.
>>
>> Thanks for any insights you may offer.
>
>Only thing that could present itself as a new challenge is the
>reliability of the network-attached block devices (e.g. do network
>outages compromise dm-cache's ability to function).

I expect them to be *reasonably* reliable, but of course the chances of 
network-attached block storage becoming unavailable are higher than for 
directly-attached storage.

>I've not done any focused testing for, or thinking about, the impact
>unreliable block devices might have on dm-cache (or dm-thinp, etc).
>Usually we advise people to ensure the devices that they layer upon are
>adequately robust/reliable.  Short of that you'll need to create your
>own luck by engineering a solution that provides network storage
>recovery.

I expect that in writethrough mode the worst kind of recovery we'd have 
to deal with is rebuilding the dm-cache setup, as even if the underlying 
slow storage becomes unavailable, that shouldn't result in FS corruption 
on it. Even though mirrors.kernel.org data is just that, mirrors, we 
certainly would like to avoid situations where we have to re-sync 40TB 
all over, as that usually means a week-long outage.

>If the "origin" device is network-attached and proves unreliable you
>can expect to see the dm-cache experience errors.  dm-cache is not
>raid.  So if concerned about network outages you might want to (ab)use
>dm-multipath's "queue_if_no_path" mode to queue IO for retry once the
>network-based device is available again (dm-multipath isn't raid
>either, but for your purposes you need some way to isolate potential for
>network based faults).  Or do you think you might be able to RAID1 or
>RAID5 N of these network attached drives together?

I don't think that makes sense, as these volumes would likely be coming 
from the same NAS array, so we'd be increasing complexity without 
necessarily hedging any risks.

Thanks for your help -- I think we're going to try this out as 
experimental setup and then see what kind of issue we run into.

Best,
-K
