References: <CACRKOwz_fOJiTVhbUqJR_EaxrKbf2bk+wb6LYOy0yWDkvt+buw@mail.gmail.com>
	<20200323082608.7i6wzq2t3k24hzun@reti>
	<7931a754-cf8e-eb6c-adf1-d54784dbf73f@redhat.com>
	<CACRKOwzT2qk_wWNo5m_ZeKa-S6ZoXSxPhJhQVGceNVDzmKu-GQ@mail.gmail.com>
	<7a6785c5-61b6-e398-293d-795ddc48e406@redhat.com>
	<3b205fe6a822fc4e33053985ed8ed51d@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <4f10a1a7-0dc4-0e66-641d-62176f26614e@redhat.com>
Date: Tue, 24 Mar 2020 16:09:27 +0100
MIME-Version: 1.0
In-Reply-To: <3b205fe6a822fc4e33053985ed8ed51d@assyoma.it>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>
Cc: Scott Mcdermott <scott@smemsh.net>

Dne 24. 03. 20 v 12:37 Gionatan Danti napsal(a):
> Il 2020-03-24 10:43 Zdenek Kabelac ha scritto:
>> By default we require migration threshold to be at least 8 chunks big.
>> So with big chunks like 2MiB in size - gives you 16MiBof required I/O 
>> threshold.
>>
>> So if you do i.e. read 4K from disk - it may cause i/o load of 2MiB
>> chunk block promotion into cache - so you can see the math here...
> 
> Hi Zdenek, I am not sure to following you description of migration_threshold. 
>  From dm-cache kernel doc:
> 
> "Migrating data between the origin and cache device uses bandwidth.
> The user can set a throttle to prevent more than a certain amount of
> migration occurring at any one time.� Currently we're not taking any
> account of normal io traffic going to the devices.� More work needs
> doing here to avoid migrating during those peak io moments.
> For the time being, a message "migration_threshold <#sectors>"
> can be used to set the maximum number of sectors being migrated,
> the default being 2048 sectors (1MB)."
> 
> Can you better explain what really migration_threshold accomplishes? It is a 
> "max bandwidth cap" settings, or something more?
> 

In past we had problem that when users have been using huge chunk size,
and small 'migration_threashold' - the cache was unable to demote chunks
from the cache to the origin device  (the size of 'required' data for demotion 
were bigger then what has been allowed by threshold).

So lvm2/libdm implemented protection to always set at least 8 chunks
is the bare minimum.

Now we face clearly the problem from 'the other side' - users have way too big 
chunks (we've seen users with 128M chunks) - and so threshold is set to 1G
and users are facing serious bottleneck on the cache side doing to many
promotions/demotions.

We will likely fix this by setting max chunk size somewhere around 2MiB.

But threshold is not an ultimate protection against overloading of users' 
systems. There is nothing doing 'bandwidth' monitoring of the disk throughput. 
It's just rather a simple limition how many bytes (chunks) can be shifted 
between origin & cache...

>> If the main workload is to read whole device over & over again likely
>> no caching will enhance your experience and you may simply need fast
>> whole
>> storage.
> 
>  From what I understand the OP want to cache filesystem metadata to speedup 
> rsync directory traversal. So a cache device should definitely be useful; 
> albeit dm-cache being "blind" in regard to data vs metadata, the latter should 
> be good candidate for hotspot promotion.
> 
> For reference, I have a ZFS system exactly used for such a workload (backup 
> with rsnapshot, which uses rsync and hardlink to create deduplicated backups) 
> and setting cache=metadata (rather than "all", so data and metadata) gives a 
> very noticeable boot to rsync traversal.

Yeah - if you read only 'directory' metadata structures - it's perfectly OK 
with caching, if you do a full data read of the whole storage it's not going 
to help (which is what I've meant).

The main message is - cache is there to accelerate often read disk blocks.
If there is no hotspot and disk is mostly read over the whole address space 
equally there will be no big benefit of cache usage.

However main message should be - user should think about sizes of caching
devices and its implications - there is no universal setting that fits best 
all users.


Zdenek
