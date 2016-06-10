References: <alpine.LRH.2.02.1606092320290.5953@inet.itmo.dyndns.org>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <f8db9f60-3250-1a34-4517-1bf9fe43f700@redhat.com>
Date: Fri, 10 Jun 2016 11:09:50 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1606092320290.5953@inet.itmo.dyndns.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] corruption on reattaching cache
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
Cc: mark@xwax.org

Dne 9.6.2016 v 22:24 Markus Mikkolainen napsal(a):
> I seem to have hit the same snag as Mark describes in his post.
>
> https://www.redhat.com/archives/linux-lvm/2015-April/msg00025.html
>
> with kernel 4.4.6 I detached (--splitcache) a writeback cache from a mounted
> lv which was then synchronized and detached. Then I reattached it and shortly
> detached it again. What was interesting is that after the second detach it
> synchronized AGAIN starting from 100% , and then I started getting filesystem
> errors. I immediately shutdown, and forced an fsck , and didnt lose that much
> data, but still had some stuff to correct.
>
> It looked to me like a detached cache, being reattached will retain all cached
> data on it, even though it was supposed to be written to the backing disk, and
> then instead of marking it clean on attaching, it will continue serving old
> data from the cache.
>


Yes - known issue,  --splitcache is rather for 'debugging' purposes.
Use --uncache  and create new cache when needed.

Splitted cache needs to be cleared on reattachment - but that needs further 
code rework.

The idea behind is - we want to support 'offline' writeback of data as ATM
cache target doesn't work well if there is any disk error - i.e. cache is in 
writeback mode and has 'error' sector - you can't clean such cache...

Regards

Zdenek
