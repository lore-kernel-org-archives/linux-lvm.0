References: <CACRKOwz_fOJiTVhbUqJR_EaxrKbf2bk+wb6LYOy0yWDkvt+buw@mail.gmail.com>
	<20200323082608.7i6wzq2t3k24hzun@reti>
	<7931a754-cf8e-eb6c-adf1-d54784dbf73f@redhat.com>
	<CACRKOwzT2qk_wWNo5m_ZeKa-S6ZoXSxPhJhQVGceNVDzmKu-GQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <7a6785c5-61b6-e398-293d-795ddc48e406@redhat.com>
Date: Tue, 24 Mar 2020 10:43:07 +0100
MIME-Version: 1.0
In-Reply-To: <CACRKOwzT2qk_wWNo5m_ZeKa-S6ZoXSxPhJhQVGceNVDzmKu-GQ@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Scott Mcdermott <scott@smemsh.net>

Dne 23. 03. 20 v 23:02 Scott Mcdermott napsal(a):
> On Mon, Mar 23, 2020 at 2:57 AM Zdenek Kabelac <zkabelac@redhat.com> wrote:
>> Dne 23. 03. 20 v 9:26 Joe Thornber napsal(a):
>>> On Sun, Mar 22, 2020 at 10:57:35AM -0700, Scott Mcdermott wrote:
>>>> have a 931.5 GibiByte SSD pair in raid1 (mdraid) as cache LV for a
>>>> data LV on 1.8 TebiByte raid1 (mdraid) pair of larger spinning disk.
>>
>> Users should be 'performing' some benchmarking about the 'useful' sizes of
>> hotspot areas - using nearly 1T of cache for 1.8T of origin doesn't look
>> the right ration for caching.
>> (i.e. like if your CPU cache would be halve of your DRAM)
> 
> the 1.8T origin will be upgraded over time with larger/more spinning
> disks, but the cache will remain as it is.  hopefully it can perform
> well whether it is 1:2 cache:data as now or 1:10+ as later.

Hi

Here would be my personal 'experience' - if you need to use so much
data in 'fast' cache - it's probably still better to use real fast storage.
Though I'd question if you have power enough hw to handle that much
data in your system if you are already struggling with memory.
You should probably size your cache on some realistic calculation how
much data can go effectively through your system.

Note - there is 'dmstats' tool to analyze 'hotspots' areas on your
storage (the more details you want to know, the more memory it will take)

Hot-spots dm-cache is efficient for 'repeatedly' accessed same data.
If the workload is about 'streaming' large data sets without having some
rather focused working areas on your disk - the over performance might be 
actually degraded (thats why I'd recommend to use fast big storage for whole 
data set)


> 
>> Too big 'cache size' leads usually into way too big caching chunks
>> (since we try to limit number of 'chunks' in cache to 1 milion  - you
>> can rise up this limit - but it will consume a lot of your RAM space as well)
>> So IMHO I'd recommend to use at most 512K chunks - which gives you
>> about 256GiB of cache size -  but still users should be benchmarking what is
>> the best for them...)
> 
> how to raise this limit? since I'm low RAM this is a problem, but why
> are large chunks an issue, besides memory usage? is this causing
> unnecessary I/O by an amplification effect? if my system doesn't have
> enough memory for this job I will have to find a host board with more
> RAM.

Cache is managing its counters in RAM - so the more 'chunks' cache will have 
the more memory is consumed (possibly seriously crippling performance of your 
system, stressing swap and being low on resources).
The number of cache chunks is a very simple math here. Just devide the size of 
your caching device with size of caching chunk.

Just like with your CPU uses your RAM for page descriptors...

The smaller the cache chunks are - the smaller I/O load it makes when the
chunk is 'promoted'/'demoted' between caching device and origin device.
And also the more 'efficient/precise' disk area is cached.

And as you have figured yourself out this load is BIG!.

By default we require migration threshold to be at least 8 chunks big.
So with big chunks like 2MiB in size - gives you 16MiBof required I/O threshold.

So if you do i.e. read 4K from disk - it may cause i/o load of 2MiB chunk 
block promotion into cache - so you can see the math here...


>> Another hint - lvm2 introduced support for new dm-writecache target as well.
> 
> this won't work for me since a lot of my data is reads, and I'm low
> memory with large numbers of files.  rsync of large trees is the main
> workload; existing algorithm is not working fantastically well, but
> nonetheless giving a nice boost to my rsync completion times over the
> uncached times.

If the main workload is to read whole device over & over again likely no 
caching will enhance your experience and you may simply need fast whole
storage.

dm-cache targets  'hotspots' caching
dm-writecache is like 'extension to your page cache'

Regards

Zdenek
