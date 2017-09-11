References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
Date: Mon, 11 Sep 2017 15:11:06 +0200
MIME-Version: 1.0
In-Reply-To: <2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 11.9.2017 v 14:06 Xen napsal(a):
> Zdenek Kabelac schreef op 11-09-2017 13:20:
> 
>> Wondering from where they could get this idea...
>> We always communicate clearly - do not plan to use 100% full
>> unresizable thin-pool as a part of regular work-flow
> 
> No one really PLANS for that.
> 
> They probably plan for some 80% usage or less.


Thin-provisioning is - about 'postponing'  available space to be delivered in 
time - let's have an example:

You order some work which cost $100.
You have just $30, but you know, you will have $90 next week -
so the work can start....

But it seems some users know it will cost $100, but they still think the work 
could be done with $10 and it's will 'just' work the same....

Sorry it won't....


> But they *do* use thin provisioning for over-provisioning.

Noone is blaming anyone for over-provisioning - but using over-provising 
without the plan of adding this space in case the space is really needed - 
that's the main issue and problem here.

thin-provisiong is giving you extra TIME - not the SPACE :)

> 
> File system level failure can also not be critical because of using 
> non-critical volume because LVM might fail even though filesystem does not 
> fail or applications.

So my Laptop machine has 32G RAM - so you can have 60% of dirty-pages
those may raise pretty major 'provisioning' storm....

> 
> Block level layer failure is much more serious, and can prevent system from 
> recovering when it otherwise could.

Yep - the idea is - when thin-pool gets full - it will stop working,
but you can't rely on 'usable' system when this happens....

Of course - it differs on case by case - if you run your /rootvolume
out of such overfilled thin-pool - you have much bigger set of problems
compared with user which has just some mount  data volume - so
the rest of system is sitting on some 'fully provisioned' volume....

But we are talking about generic case here no on some individual sub-cases
where some limitation might give you the chance to rescue better...

> 
> That is not possible in the use case described. Not all systems have instantly 
> more space available, or even able to expand, and may still want to use LVM 
> thin provisioning because of the flexibility it provides.

Again - it's admin's  gambling here - if he let the system overprovisiong
and doesn't have 'backup' plan -  you can't blame here  lvm2.....

> 
> Only manual intervention this one... and last resort only to prevent crash so 
> not really useful in general situation?

Let's simplify it for the case:

You have  1G thin-pool
You use 10G of thinLV on top of 1G thin-pool

And you ask for 'sane' behavior ??

You would have to probably write your whole own linux kernel - to continue 
work reasonable well when 'write-failure' starts to appear.

It's completely out-of-hand of  dm/lvm2.....

The most 'sane' is to stop and reboot and fix missing space....

Any idea of having 'reserved' space for 'prioritized' applications and other 
crazy ideas leads to nowhere.

Actually there is very good link to read about:

https://lwn.net/Articles/104185/

Hopefully this will bring your mind further ;)

>> - lvm2 fully supports now to call 'smart' scripts
>> directly out of dmeventd for such action.
> 
> Yes that is very good, thank you for that. I am still on older LVM making use 
> of existing logging feature, which also works for me for now.

Well yeah - it's not useless to discuses solution for  old releases of lvm2...

Lvm2 should be compilable and usable on older distros as well - so upgrade and 
do not torture yourself with older lvm2....



> 
>> It's illusion to hope anyone will be able to operate lvm2 thin-pool at
>> 100% fullness reliable
> 
> That's not what we want.
> 
> 100% is not the goal. Is exceptional situation to begin with.

And we believe it's fine to solve exceptional case  by reboot.
Since the effort you would need to put into solve all kernel corner case is 
absurdly high compared with the fact 'it's exception' for normally used and 
configured and monitored thin-pool....

So don't expect lvm2 team will be solving this - there are more prio work....


>> - there should be always enough room to give
>> 'scripts' reaction time
> 
> Sure but some level of "room reservation" is only to buy time -- or really 
> perhaps to make sure main system volume doesn't crash when data volume fills  > up by accident.

If the system volume IS that important - don't use it with over-provisiong!

The answer is that simple.

You can user different thin-pool for your system LV where you can maintain
snapshot without over-provisioning.

It's way more practical solution the trying to fix  OOM problem :)

>> to gain some more space in-time
> 
> Yes email monitoring would be most important I think for most people.
Put mail messaging into  plugin script then.
Or use any monitoring software for messages in syslog - this worked pretty 
well 20 years back - and hopefully still works well :)

>> serve free chunks for provisioning - that's been design
> 
> Aye but does design have to be complete failure when condition runs out?

YES

> I am just asking whether or not there is a clear design limitation that would 
> ever prevent safety in operation when 100% full (by accident).

Don't user over-provisioning in case you don't want to see failure.

It's the same as you should not overcommit your RAM in case you do not want to 
see OOM....


> I still think theoretically solution would be easy if you wanted it.

My best advice - please you should try to write it - so you would see more in 
depth how yours 'theoretical solution'  meets with reality....


Regards

Zdenek
