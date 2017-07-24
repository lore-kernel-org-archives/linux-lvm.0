MIME-Version: 1.0
In-Reply-To: <20170724160720.GB19898@redhat.com>
References: <CAGqmV7oCXLyjio67mksc-rKrLQGvoyOeJfPH4T0or3STrbdbrA@mail.gmail.com>
	<20170724160720.GB19898@redhat.com>
From: CoolCold <coolthecold@gmail.com>
Date: Mon, 24 Jul 2017 23:12:38 +0700
Message-ID: <CAGqmV7oMKUeRA1Rdg5WhXNwgndnoTZmxwgPQYC5c0KiUp5zDeQ@mail.gmail.com>
Subject: Re: [linux-lvm] dm-cache size is limited by 946GB
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: Brice Barotin <brice.barotin@gmail.com>, linux-lvm@redhat.com

Hello!
I will try to check with 4.12 kernel, but doesn't it looks suspicious
to you that 946GB works almost instantly, while 947GB and more do not
at all? (waited 2.6TB for ~ 1.6 days and 3TB of data).

On Mon, Jul 24, 2017 at 11:07 PM, Mike Snitzer <snitzer@redhat.com> wrote:
> On Sun, Jul 23 2017 at  9:48am -0400,
> CoolCold <coolthecold@gmail.com> wrote:
>
>> Hello!
>> We started to adopting new servers for image storages, and hit the
>> strange problem - no caching happens for cache lv > 946GB (so 947GB
>> and above do no work).
>>
>> Storage box looks like:
>> 2x240GB SSD for system (sw raid 1, lvm on top)
>> 20x1.8TB SATA HDD for data  (sw raid 10, md124 + lvm on top)
>> 4x960GB SSD for dm-caching puprose (sw raid5, md125).
>>
>> Our naive approach was to create PV from md125 and make it all cache -
>> around 2.6TB of cache for 16TB of "raw" data should be quite good.
>> Cache created successfully, has seen the whole 2.6TB, but after
>> copying ~ 3TB data from old box, we still got only misses for reads
>> and writes in statistics and almost no activity in iostat for md125.
>> When i say "almost no activity" it was having some write operations,
>> but zeroes in KB -
>> https://gist.github.com/CoolCold/f79bb706d4dd1c083a4f4ed0ebd850d5 -
>> where dm-2 and dm-3 are cache data and cache meta volumes accordingly.
>>
>> We have "old" servers which are running a bit different setup in
>> number of drives, they have 350-750GB of space for caching and it
>> works well. We tried to reduce cache size for new box, it worked for
>> 80GB, so bisected to 946GB.
>>
>> It doesn't look like any "magic" number (I though may be some problems
>> around 2TB for signed/unsigned or so) and right now i'm out of ideas
>> what the problem may be and need your advice.
>>
>> Kernel version we are using:
>> 3.10.0-514.26.2.el7.x86_64
>
> the 7.4 dm-cache will be much more performant than the 7.3 cache you
> appear to be using.
>
> As for you "no caching happens for cache lv > 946GB".  Cache shouldn't
> have any concerns about the size.  It could be that your workload isn't
> accessing the data enough to warrant promotion to the cache.  dm-cache
> is a "hotspot" cache.  If you aren't accessing the data repeatedly then
> you won't see much benefit (particularly with the 7.3 and earlier
> releases).
>
> Just to get a feel, you could try the latest upstream 4.12 kernel to see
> how effective the 7.4 dm-cache will be for your setup.
>
> Mike



-- 
Best regards,
[COOLCOLD-RIPN]
