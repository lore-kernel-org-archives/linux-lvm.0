References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
	<50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
	<5cb21c879cfff0b1916e823b85d35909@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <87a619a2-cefc-3b4e-a709-0906053503e9@redhat.com>
Date: Tue, 12 Sep 2017 16:37:57 +0200
MIME-Version: 1.0
In-Reply-To: <5cb21c879cfff0b1916e823b85d35909@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 12.9.2017 v 14:37 Xen napsal(a):
> Zdenek Kabelac schreef op 12-09-2017 13:46:
> 
> 
> You know Zdenek, it often appears to me your job here is to dissuade people 
> from having any wishes or wanting anything new.
> 
> But if you look a little bit further, you will see that there is a lot more 
> possible within the space that you define, than you think in a black & white 
> vision.

On block layer - there are many things  black & white....

If you don't know which process 'create' written page, nor if you write
i.e. filesystem data or metadata or any other sort of 'metadata' information,
you can hardly do any 'smartness' logic on thin block level side.

> Although personally I would not mind communication between layers in which 
> providing layer (DM) communicates some stuff to using layer (FS) but 90% of 
> the time that is not even needed to implement what people would like.

The philosophy with DM device is - you can replace then online with something 
else - i.e. you could have a linear LV  which is turned to 'RAID" and than it 
could be turned to   'Cache RAID'  and then even to thinLV -  all in one raw
on life running system.

So what filesystem should be doing in this case ?

Should be doing complex question of block-layer underneath - checking current 
device properties - and waiting till the IO operation is processed  - before 
next IO comes in the process - and repeat the  some  in very synchronous
slow logic ??    Can you imagine how slow this would become ?

The main problem here is - the user typically only see a one single localized 
problem - without putting it into a global context.

So of course - if you 'restrict' a device stack to some predefined fixed
state which holds 'forever'  you may get far more chances to get couple things 
running in some more optimal way - but that's not what lvm2 aims to support.

We are targeting 'generic' usage not a specialized case - which fits 1 user 
out of 1000000 - and every other user needs something 'slightly' different....


> Also we see ext4 being optimized around 4MB block sizes right? To create 
> better allocation

I don't think there is anything related...
Thin chunk-size ranges from 64KiB to 1GiB....

> So that's example of "interoperation" without mixing layers.

The only inter-operation is the main filesystem (like extX & XFS) are getting 
fixed for better reactions for ENOSPC...
and WAY better behavior when there are 'write-errors' - surprisingly there 
were numerous faulty logic and expectation encoded in them...

> I think Gionatan has demonstrated that pure block layer functionality, is 
> possible to have more advanced protection ability that does not need any 
> knowledge about filesystems.

thin-pool provides  same level of protection in terms of not letting you 
create a new thin-lv when thin-pool is above configure threshold...


And to compare apples with apples - you need to compare performance of

ZFS with zpolls with thin with thinpools running directly on top of device.

If zpools - are 'equally' fast as thins  - and gives you better protection,
and more sane logic the why is still anyone using thins???

I'd really love to see some benchmarks....

Of course if you slow down speed of thin-pool and add way more synchronization 
points and consume 10x more memory :) you can get better behavior in those 
exceptional cases which are only hit by unexperienced users who tends to 
intentionally use thin-pools in incorrect way.....

> 
> 
> Yes apologies here, I responded to this thing earlier (perhaps a year ago) and 
> the systems I was testing on was 4.4 kernel. So I cannot currently confirm and 
> probably is already solved (could be right).
> 
> Back then the crash was kernel messages on TTY and then after some 20-30 

there is by default 60sec freeze, before unresized thin-pool start to reject
all write to unprovisioned space as 'error' and switches to out-of-space 
state.  There is though a difference if you are out-of-space in data
or metadata -  the later one is more complex...

>> If you think there is OS system which keeps running uninterrupted,
>> while number of writes ends with 'error'� - show them :)� - maybe we
>> should stop working on Linux and switch to that (supposedly much
>> better) different OS....
> 
> I don't see why you seem to think that devices cannot be logically separated 
> from each other in terms of their error behaviour.


In page cache there are no thing logically separated - you have 'dirty' pages
you need to write somewhere - and if you writes leads to errors,
and system reads errors back instead of real-data - and your execution
code start to run on completely unpredictable data-set - well 'clean' reboot 
is still very nice outcome IMHO....

> If I had a system crashing because I wrote to some USB device that was 
> malfunctioning, that would not be a good thing either.

Well try to BOOT from USB :) and detach and then compare...
Mounting user data and running user-space tools out of USB is uncomparable...


> Linux kernel has had more issues with USB for example that are unacceptable, 
> and even Linus Torvalds himself complained about it. Queues filling up because 
> of pending writes to USB device and entire system grinds to a halt.
> 
> Unacceptable.

AFAIK - this is still not resolved issue...


> 
>> You can have different pools and you can use rootfs� with thins to
>> easily test i.e. system upgrades....
> 
> Sure but in the past GRUB2 would not work well with thin, I was basing myself 
> on that...

/boot   cannot be on thin

/rootfs  is not a problem - there will be even some great enhancement for Grub
to support this more easily and switching between various snapshots...



>> Most thin-pool users are AWARE how to properly use it ;)� lvm2 tries
>> to minimize (data-lost) impact for misused thin-pools - but we can't
>> spend too much effort there....
> 
> Everyone would benefit from more effort being spent there, because it reduces 
> the problem space and hence the burden on all those maintainers to provide all 
> types of safety all the time.
> 
> EVERYONE would benefit.

Fortunately most users NEVER need it ;)
Since they properly operate thin-pool and understand it's weak points....


> Not necessarily that the system continues in full operation, applications are 
> allowed to crash or whatever. Just that system does not lock up.

When you get bad data from your block device - your system's reaction is 
unpredictable -  if your /rootfs cannot store its metadata - the most sane 
behavior is to stop - all other solutions are so complex and complicated, that 
spending resources to avoid hitting this state are way better spent effort...

Lvm2 ensures block layer behavior is sane - but cannot be held responsible 
that all layers above  are 'sane' as well...

If you hit 'fs' bug - report the issue to fs maintainer.
If you experience user-space faulty app - solve the issue there.

> Then filesystem tells application "write error". That's fine.
> 
> But it might be helpful if "critical volumes" can reserve space in advance.

Once again -  USE different pool - solve problems at proper level....
Do not over-provision critical volumes...


> I.e. filesystem may guess about thin layout underneath and just write 1 byte 
> to each block it wants to allocate.

:) so how do you resolve error paths -  i.e. how do you restore space
you have not actually used....
There are so many problems with this you can't even imagine...
Yeah - we've spent quite some time in past analyzing those paths....

> So number of (unallocated) blocks are reserved for critical volume.

Please finally stop thinking about  some 'reserved' storage for critical 
volume. It leads to nowhere....


> When number drops below "needed" free blocks for those volumes, system starts 
> returning errors for volumes not that critical volume.

Do the right action at right place.

For critical volume  use  non-overprovisiong pools - there is nothing better 
you can do - seriously!

For other cases - resolve the issue at userspace when dmeventd calls you...


> 
> I don't see why that would be such a disturbing feature.
> 

Maybe start to understand how kernel works in practice ;)

Otherwise you spend you live boring developers with ideas which simply cannot 
work...

> You just cause allocator to error earlier for non-critical volumes, and 
> allocator to proceed as long as possible for critical volumes.


So use 2 different POOLS, problem solved....

You need to focus on simple solution for a problem instead of exponentially 
over-complicating 'bad' solution....


> We spoke about this topic a year ago as well, and perhaps you didn't 
> understand me because for you the problems were already fixed (in your LVM).

As said - if you see a problem/bug  - open BZ  case - so it'd be analyzed  - 
instead of spreading FUD in mailing list, where noone tells which version of 
lvm2 and which kernel version -  but we are just informed it's crashing and 
unusable...

> 
>> We are here really interested in upstream issues - not about missing
>> bug fixes� backports into every distribution� and its every released
>> version....
> 
> I understand. But it's hard for me to know which is which.
> 
> These versions are in widespread use.
> 
> Compiling your own packages is also system maintenance burden etc.

Well it's always about checking 'upstream' first and then bothering your 
upstream maintainer...

Eventually switching to distribution with better support in case your existing 
one has 'nearly' zero reaction....

> So maybe our disagreement back then came from me experiencing something that 
> was already solved upstream (or in later kernels).

Yes - we are always interested in upstream problem.

We really cannot be solving problems of every possible deployed combination of 
software.


Regards

Zdenek
