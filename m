References: <23992.55411.809240.777787@quad.stoffel.home>
	<20191030104713.wf52pgh7fw77cevw@reti>
	<23995.13827.23398.434894@quad.stoffel.home>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <b728374c-2ef7-d257-9d0a-ed3bfaee973a@redhat.com>
Date: Fri, 1 Nov 2019 11:05:34 +0100
MIME-Version: 1.0
In-Reply-To: <23995.13827.23398.434894@quad.stoffel.home>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] bcache now to become io-manager?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, John Stoffel <john@stoffel.org>

Dne 31. 10. 19 v 20:29 John Stoffel napsal(a):
>>>>>> "Joe" == Joe Thornber <thornber@redhat.com> writes:
> 
> Joe> On Tue, Oct 29, 2019 at 08:25:23PM -0400, John Stoffel wrote:
>>>>>>>> "Joe" == Joe Thornber <thornber@redhat.com> writes:
>>>
>>> [ I saw this and couldn't resist asking for more details ...]
>>>
> Joe> Also there are big changes to bcache coming, that remove file
> Joe> descriptors from the interface completely.  See the branch
> Joe> 2019-09-05-add-io-manager for more info (bcache has been renamed
> Joe> io_manager).
>>>
>>> Can you post the full URL for this, and maybe give us a teaser on what
>>> to expect?  I run lvache on my home system and I'd love to know how to
>>> A) improve reporting of how well it works, and B) whether I'm using it
>>> right, and of course C) if bcache would be a better replacement.
>>>
>>> I'm using Linux v5.0.21 (self compiled) on Debian 9.11 with lvcache
>>> setup.  It's a pair of mirrored 250gb SSDs in front of 4tb of mirrored
>>> disk.
>>>
>>> So anything where I can use my SSDs to cache my data accesses is
>>> certainly interesting.
> 
> Joe> Sorry, I think we're getting confused with similarly named
> Joe> things.  There is a component in LVM source called 'block cache'
> Joe> that we use to scan devices in parallel (under the hood it uses
> Joe> aio).  That component is being renamed.  It's nothing to do with
> Joe> the disk caching technology called 'bcache'.
> 
> Ah... that's a good reason for this rename then.

In this context bcache is purely an internal lvm2 coding naming -
it's never exposed to an lvm2 man page, never used as any argument or 
parameter in lvm2 command line - so it really is purely terminology for coders...

> 
> Joe> However, Dave Teigland has been adding support to LVM for a new
> Joe> caching target that emphasises caching writes.  So keep an eye
> Joe> out for that.
> 
> Will do. It's never really been clear if lvcache has really helped or
> not, the testing was in-conclusive.


dm-cache   (aka  'lvcreate --cache')  is  a hotspot cache - so
it does 'monitor' your device usage and moves to caching device hotspot areas 
(those which are frequently used).  And there need to be seen that often
there is also hidden 'page-cache' usage which avoids increasing
usage of real disk reads - so it simply takes times before dm-cache
gets well populated - this is something you could hardly 'benchmark' with like 
couple minutes long benchmark.

The recently introduced dm-writecache (aka 'lvconvert --type writecache) 
support on the other hand looks more or less like 'extended' page-caching - 
where all dirty pages from memory quickly lends in fast write caching device 
where they are copied to your slower physical storage device.


Regads

Zdenek
