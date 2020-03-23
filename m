Received: from [10.40.194.70] (unknown [10.40.194.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DCF0912AB
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 09:57:04 +0000 (UTC)
References: <CACRKOwz_fOJiTVhbUqJR_EaxrKbf2bk+wb6LYOy0yWDkvt+buw@mail.gmail.com>
	<20200323082608.7i6wzq2t3k24hzun@reti>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <7931a754-cf8e-eb6c-adf1-d54784dbf73f@redhat.com>
Date: Mon, 23 Mar 2020 10:57:03 +0100
MIME-Version: 1.0
In-Reply-To: <20200323082608.7i6wzq2t3k24hzun@reti>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 23. 03. 20 v 9:26 Joe Thornber napsal(a):
> On Sun, Mar 22, 2020 at 10:57:35AM -0700, Scott Mcdermott wrote:
>> have a 931.5 GibiByte SSD pair in raid1 (mdraid) as cache LV for a
>> data LV on 1.8 TebiByte raid1 (mdraid) pair of larger spinning disk.
>> these disks are hosted by a small 4GB big.little ARM system
>> running4.4.192-rk3399 (armbian 5.98 bionic).  parameters were set
>> with: lvconvert --type cache --cachemode writeback --cachepolicy smq
>> --cachesettings migration_threshold=10000000
> 
> If you crash then the cache assumes all blocks are dirty and performs
> a full writeback.  You have set the migration_threshold extremely high
> so I think this writeback process is just submitting far too much io at once.
> 
> Bring it down to around 2048 and try again.
> 

Hi

Users should be 'performing' some benchmarking about the 'useful' sizes of
hotspot areas - using nearly 1T of cache for 1.8T of origin doesn't look
the right ration for caching.
(i.e. like if your CPU cache would be halve of your DRAM)

Too big 'cache size' leads usually into way too big caching chunks
(since we try to limit number of 'chunks' in cache to 1 milion  - you
can rise up this limit - but it will consume a lot of your RAM space as well)
So IMHO I'd recommend to use at most 512K chunks - which gives you
about 256GiB of cache size -  but still users should be benchmarking what is 
the best for them...)

Another hint - lvm2 introduced support for new dm-writecache target as well.
So if you intent to accelerate mainly 'write throughput' - dm-cache isn't
the one with highest performance here.

Regards

Zdenek
