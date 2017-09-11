References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
From: Eric Ren <zren@suse.com>
Message-ID: <e364950a-22fa-6cd2-ed81-2c675b4b3390@suse.com>
Date: Mon, 11 Sep 2017 23:31:16 +0800
MIME-Version: 1.0
In-Reply-To: <f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: Xen <list@xenhideout.nl>, LVM general discussion and development <linux-lvm@redhat.com>

Hi Zdenek,

On 09/11/2017 09:11 PM, Zdenek Kabelac wrote:

[..snip...]

> So don't expect lvm2 team will be solving this - there are more prio 
> work....

Sorry for interrupting your discussion. But, I just cannot help to ask:

It's not the first time I see "there are more prio work". So I'm 
wondering: can upstream
consider to have these high priority works available on homepage [1] or 
trello tool [1]?

I really hope upstream can do so. Thus,

1. Users can expect what changes will likely happen for lvm.

2. It helps developer reach agreements on what problems/features should 
be on high
priority and avoid overlap efforts.

I know all core developer are working for RedHat. But, I guess you 
experts will also be happy
to see any real contributions from other engineers. For me, some big 
issues in LVM I can see by now:

- lvmetad slows down activation much if there are a lot of PVs on system 
(say 256 PVs, it takes >10s to pvscan
in my testing).
- pvmove is slow. I know it's not fault of LVM. The time is almost spent 
in DM (the IO dispatch/copy).
- snapshot cannot be used in cluster environment. There is a usecase: 
user has a central backup system
   running on a node. They want to make snapshot and backup some LUNs 
attached to other nodes, on this
   backup system node.

If our upstream have a place to put and discuss what the prio works are, 
I think it will encourage me to do
more contributions - because I'm not 100% sure if it's a real issue and 
if it's a work that upstream hopes
to see, every engineer wants their work to be accepted by upstream :)   
I can try to go forward to do meaningful
work (research, testing...) as far as I can, if you experts can confirm 
that "that's a real problem. Go ahead!".

[1] https://sourceware.org/lvm2/
[2] https://trello.com/

Regards,
Eric
