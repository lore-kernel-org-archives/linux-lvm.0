Date: Sat, 11 Jun 2016 10:24:39 +0100 (BST)
From: Mark Hills <mark@xwax.org>
In-Reply-To: <f8db9f60-3250-1a34-4517-1bf9fe43f700@redhat.com>
Message-ID: <1606111012220.15662@stax.localdomain>
References: <alpine.LRH.2.02.1606092320290.5953@inet.itmo.dyndns.org>
	<f8db9f60-3250-1a34-4517-1bf9fe43f700@redhat.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 10 Jun 2016, Zdenek Kabelac wrote:

> Dne 9.6.2016 v 22:24 Markus Mikkolainen napsal(a):
> > I seem to have hit the same snag as Mark describes in his post.
> >
> > https://www.redhat.com/archives/linux-lvm/2015-April/msg00025.html
> >
> > with kernel 4.4.6 I detached (--splitcache) a writeback cache from a mounted
> > lv which was then synchronized and detached. Then I reattached it and
> > shortly
> > detached it again. What was interesting is that after the second detach it
> > synchronized AGAIN starting from 100% , and then I started getting
> > filesystem
> > errors. I immediately shutdown, and forced an fsck , and didnt lose that
> > much
> > data, but still had some stuff to correct.
> >
> > It looked to me like a detached cache, being reattached will retain all
> > cached
> > data on it, even though it was supposed to be written to the backing disk,
> > and
> > then instead of marking it clean on attaching, it will continue serving old
> > data from the cache.
> >
> 
> 
> Yes - known issue,  --splitcache is rather for 'debugging' purposes.
> Use --uncache  and create new cache when needed.
> 
> Splitted cache needs to be cleared on reattachment - but that needs further
> code rework.

It's ok that this is part of a wider picture.

If it is imncomplete, it might be wise to block the user from doing the 
operation, or force them to confirm at the time of reattaching (along with 
a summary of the risk)

Or, if '--splitcache' is completely for debugging purposes, then it 
probably should be removed from the section "Cache removal" of the 
lvmcache(7) man page.

In my case I was following the instructions on the page, which state that 
the result is an "unused cache pool LV". I wrongly understood that to mean 
one which is the same as a newly-created one with the same parameters.

As with Markus, I also experienced data corruption which I was lucky to 
spot, and lucky to have a backup to restore from.
 
> The idea behind is - we want to support 'offline' writeback of data as ATM
> cache target doesn't work well if there is any disk error - i.e. cache is in
> writeback mode and has 'error' sector - you can't clean such cache...

Interesting... is there scope for long-term writeback caching in this 
design? My own personal use case is I would like to spin down the hard 
drive in the machine for the majority of the time.

Many thanks

-- 
Mark
