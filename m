Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB2AE5D9CB
	for <linux-lvm@redhat.com>; Tue, 24 Oct 2017 23:10:30 +0000 (UTC)
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1B077EBD3
	for <linux-lvm@redhat.com>; Tue, 24 Oct 2017 23:10:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9ONATbH006714
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 24 Oct 2017 16:10:29 -0700 (PDT)
Message-ID: <59EFC863.6090109@windriver.com>
Date: Tue, 24 Oct 2017 17:10:27 -0600
From: Chris Friesen <chris.friesen@windriver.com>
MIME-Version: 1.0
References: <640472762.2746512.1508882485777.ref@mail.yahoo.com>
	<640472762.2746512.1508882485777@mail.yahoo.com>
In-Reply-To: <640472762.2746512.1508882485777@mail.yahoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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
To: linux-lvm@redhat.com

On 10/24/2017 04:01 PM, matthew patton wrote:

> How in the hell is the LVM cache being used at all? It has no business
> caching ANYTHING on streaming reads. Hmm, it turns out dm-cache/lvmcache
> really is retarded. It copies data to cache on first read and furthermore
> doesn't appear to detect streaming reads which have no value for caching
> purposes.

Technically it's not entirely true to say that streaming reads have no value for 
caching purposes.  It's conceivable to have a workload where the same file gets 
read over and over, in which case it might be useful to have it cached on an SSD.

As I understand it dm-cache is using smq, which essentially uses an LRU 
algorithm.  So yes, it'll read the streaming data into the cache, but the 
read-once/written-never data should also be the most likely to be evicted from 
the cache.

For what it's worth, the Linux kernel also copies data to the page cache on 
reads, which is why they introduced posix_fadvise(POSIX_FADV_DONTNEED) to allow 
the application to indicate that it's done with the data and it can be dropped 
from the page cache.

Chris
