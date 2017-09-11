References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<e364950a-22fa-6cd2-ed81-2c675b4b3390@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <c53601ab-e003-0c9b-038f-a3f6475a1e6a@redhat.com>
Date: Mon, 11 Sep 2017 17:52:31 +0200
MIME-Version: 1.0
In-Reply-To: <e364950a-22fa-6cd2-ed81-2c675b4b3390@suse.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: Eric Ren <zren@suse.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 11.9.2017 v 17:31 Eric Ren napsal(a):
> Hi Zdenek,
> 
> On 09/11/2017 09:11 PM, Zdenek Kabelac wrote:
> 
> [..snip...]
> 
>> So don't expect lvm2 team will be solving this - there are more prio work....
> 
> Sorry for interrupting your discussion. But, I just cannot help to ask:
> 
> It's not the first time I see "there are more prio work". So I'm wondering: 
> can upstream
> consider to have these high priority works available on homepage [1] or trello 
> tool [1]?
> 
> I really hope upstream can do so. Thus,
> 
> 1. Users can expect what changes will likely happen for lvm.
> 
> 2. It helps developer reach agreements on what problems/features should be on 
> high
> priority and avoid overlap efforts.
> 

lvm2 is using  upstream community BZ located here:

https://bugzilla.redhat.com/enter_bug.cgi?product=LVM%20and%20device-mapper

You can check RHBZ easily for all lvm2 bZ
(mixes  RHEL/Fedora/Upstream)

We usually want to have upstream BZ being linked with Community BZ,
but sometimes it's driven through other channel - not ideal - but still easily 
search-able.

> - lvmetad slows down activation much if there are a lot of PVs on system (say 
> 256 PVs, it takes >10s to pvscan
> in my testing).

It's should be opposite case - unless something regressed recently...
Easiest is to write out  lvm2 test suite some test.

And eventually bisect which commit broke it...

> - pvmove is slow. I know it's not fault of LVM. The time is almost spent in DM 
> (the IO dispatch/copy).

Yeah - this is more or less design issue inside kernel - there are
some workarounds - but since primary motivation was not to overload
system - it's been left a sleep a bit - since focus gained  'raid' target
and these pvmove fixes are working with old dm mirror target...
(i.e. try to use bigger  region_size for mirror in lvm.conf  (over 512K)
and evaluate performance  - there is something wrong - but core mirror 
developer is busy with raid features ATM....


> - snapshot cannot be used in cluster environment. There is a usecase: user has 
> a central backup system

Well, snapshot CANNOT work in cluster.
What you can do is to split snapshot and attach it different volume,
but exclusive assess is simply required - there is no synchronization of 
changes like with cmirrord for old mirror....

> 
> If our upstream have a place to put and discuss what the prio works are, I 
> think it will encourage me to do
> more contributions - because I'm not 100% sure if it's a real issue and if 

You are always welcome to open Community BZ  (instead of trello/github/.... )
Provide justification, present patches.

Of course I cannot hide :) RH has some sort of influence which bugs are more 
important then the others...

> it's a work that upstream hopes
> to see, every engineer wants their work to be accepted by upstream :) I can 
> try to go forward to do meaningful
> work (research, testing...) as far as I can, if you experts can confirm that 
> "that's a real problem. Go ahead!".

We do our best....

Regards

Zdenek
