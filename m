Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A30D05C550
	for <linux-lvm@redhat.com>; Fri, 15 Sep 2017 07:34:34 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95140C0587C7
	for <linux-lvm@redhat.com>; Fri, 15 Sep 2017 07:34:30 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp1.signet.nl (Postfix) with ESMTP id 2D2EF5BCE1
	for <linux-lvm@redhat.com>; Fri, 15 Sep 2017 09:34:28 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Fri, 15 Sep 2017 09:34:28 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <eb24f4de-2b58-38a4-9c8d-950a36530ed7@redhat.com>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
	<50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
	<aca4355a-d7f3-c116-fc7b-7379f269a21a@assyoma.it>
	<B6F45B41-86FC-4810-BC40-0EEE8DD9E372@redhat.com>
	<f2e24a01b1e548b6b15db6d30596208b@xenhideout.nl>
	<595ff1d4-3277-ca5e-a18e-d62eaaf0b1a0@redhat.com>
	<9aa2d67c38af3e4042bd3f37559b799d@xenhideout.nl>
	<eb24f4de-2b58-38a4-9c8d-950a36530ed7@redhat.com>
Message-ID: <2d1025d7784ab44cbc03cfe7f6778599@xenhideout.nl>
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
To: linux-lvm@redhat.com

Zdenek Kabelac schreef op 14-09-2017 21:05:

> Basically user-land tool takes a runtime snapshot of kernel metadata
> (so gets you information from some frozen point in time) then it
> processes the input data (up to 16GiB!) and outputs some number - like
> what is the
> real unique blocks allocated in thinLV.

That is immensely expensive indeed.

> Typically snapshot may share
> some blocks - or could have already be provisioning all blocks  in
> case shared blocks were already modified.

I understand and it's good technology.

>> Yes I mean my own 'system' I generally of course know how much data is 
>> on it and there is no automatic data generation.
> 
> However lvm2 is not 'Xen oriented' tool only.
> We need to provide universal tool - everyone can adapt to their needs.

I said that to indicate that prediction problems are not current 
important for me as much but they definitely would be important in other 
scenarios or for other people.

You twist my words around to imply that I am trying to make myself 
special, while I was making myself unspecial: I was just being modest 
there.

> Since your needs are different from others needs.

Yes and we were talking about the problems of prediction, thank you.

>> But if I do create snapshots (which I do every day) when the root and 
>> boot snapshots fill up (they are on regular lvm) they get dropped 
>> which is nice,
> 
> old snapshot are different technology for different purpose.

Again, what I was saying was to support the notion that having snapshots 
that may grow a lot can be a problem.

I am not sure the purpose of non-thin vs. thin snapshots is all that 
different though.

They are both copy-on-write in a certain sense.

I think it is the same tool with different characteristics.

> With 'plain'  lvs output is - it's just an orientational number.
> Basically highest referenced chunk for a thin given volume.
> This is great approximation of size for a single thinLV.
> But somewhat 'misleading' for thin devices being created as 
> snapshots...
> (having shared blocks)

I understand. The above number for "snapshots" were just the missing 
numbers from this summing up the volumes.

So I had no way to know snapshot usage.

I just calculated all used extents per volume.

The missing extents I put in snapshots.

So I think it is a very good approximation.

> So you have no precise idea how many blocks are shared or uniquely
> owned by a device.

Okay. But all the numbers were attributed to the correct volume 
probably.

I did not count the usage of the snapshot volumes.

Whether they are shared or unique is irrelevant from the point of view 
of wanting to know the total consumption of the "base" volume.

In the above 6 extents were not accounted for (24 MB) so I just assumed 
that would be sitting in snapshots ;-).

> Removal of snapshot might mean you release  NOTHING from your
> thin-pool if all snapshot blocks where shared with some other thin
> volumes....

Yes, but that was not indicated in above figure either. It was just 24 
MB that would be freed ;-).

Snapshots can only become a culprit if you start overwriting a lot of 
data, I guess.

>> If you say that any additional allocation checks would be infeasible 
>> because it would take too much time per request (which still seems odd 
>> because the checks wouldn't be that computation intensive and even for 
>> 100 gigabyte you'd only have 25.000 checks at default extent size) -- 
>> of course you asynchronously collect the data.
> 
> Processing of mapping of upto 16GiB of metadata will not happen in
> miliseconds.... and consumes memory and CPU...

I get that. If that is the case.

That's just the sort of thing that in the past I have been keeping track 
of continuously (in unrelated stuff) such that every mutation also 
updated the metadata without having to recalculate it...

I am meaning to say that if indeed this is the case and indeed it is 
this expensive, then clearly what I want is not possible with that 
scheme.

I mean to say that I cannot argue about this design. You are the 
experts.

I would have to go in learning first to be able to say anything about it 
;-).

So I can only defer to your expertise. Of course.

But the purpose of what you're saying is that the number of uniquely 
owned blocks by any snapshot is not known at any one point in time.

And needs to be derived from the entire map. Okay.

Thus reducing allocation would hardly be possible, you say.

Because the information is not known anyway.


Well pardon me for digging this deeply. It just seemed so alien that 
this thing wouldn't be possible.

I mean it seems so alien that you cannot keep track of those numbers 
runtime without having to calculate them using aggregate measures.

It seems information you want the system to have at all times.

I am just still incredulous that this isn't being done...

But I am not well versed in kernel concurrency measures so I am hardly 
qualified to comment on any of that.

In any case, thank you for your time in explaining. Of course this is 
what you said in the beginning as well, I am just still flabbergasted 
that there is no accounting being done...

Regards.


>> I think they are some of the most pleasant command line tools 
>> anyway...
> 
> We try really hard....

You're welcome.

>> On the other hand if all you can do is intervene in userland, then all 
>> LVM team can do is provide basic skeleton for execution of some 
>> standard scripts.
> 
> Yes - we give all the power to suit thin-p for individual needs to the 
> user.

Which is of course pleasant.

>>> So all you need to do is to use the tool in user-space for this task.
>> 
>> So maybe we can have an assortment of some 5 interventionalist 
>> policies like:
>> 
>> a) Govern max snapshot size and drop snapshots when they exceed this
>> b) Freeze non-critical volumes when thin space drops below aggegrate 
>> values appropriate for the critical volumes
>> c) Drop snapshots when thin space <5% starting with the biggest one
>> d) Also freeze relevant snapshots in case (b)
>> e) Drop snapshots when exceeding max configured size in case of 
>> threshold reach.
> 
> But you are aware you can run such task even with cronjob.

Sure the point is not that it can't be done, but that it seems an unfair 
burden on the system maintainer to do this in isolation of all other 
system maintainers who might be doing the exact same thing.

There is some power in numbers and it is just rather facilitating if a 
common scenario is somewhat provided by a central party.

I understand that every professional outlet dealing in terabytes upon 
terabytes of data will have the manpower to do all of this and do it 
well.

But for everyone else, it is a landscape you cannot navigate because you 
first have to deploy that manpower before you can start using the 
system!!!

It becomes a rather big enterprise to install thinp for anyone!!!

Because to get it running takes no time at all!!! But to get it running 
well then implies huge investment.

I just wouldn't mind if this gap was smaller.

Many of the things you'd need to do are pretty standard. Running more 
and more cronjobs... well I am already doing that. But it is not just 
the maintenance of the cron job (installation etc.) but also the script 
itself that you have to first write.

That means for me and for others that may not be doing it professionally 
or in a larger organisation, the benefit of spending all that time may 
not weigh up to the cost it has and the result is then that you keep 
stuck with a deeply suboptimal situation in which there is little or no 
reporting or fixing, all because the initial investment is too high.

Commonly provided scripts just hugely reduce that initial investment.

For example the bigger vs. smaller system I imagined. Yes I am eager to 
make it. But I got other stuff to do as well :p.

And then, when I've made it, chances are high no one will ever use it 
for years to come.

No one else I mean.


>> So for example you configure max size for snapshot. When snapshots 
>> exceeds size gets flagged for removal. But removal only happens when 
>> other condition is met (threshold reach).
> 
> We are blamed already for having way too much configurable knobs....

Yes but I think it is better to script these things anyway.

Any official mechanism is only going to be inflexible when it goes that 
far.

Like I personally don't like SystemD services compared to cronjobs. 
Systemd services take longer to set up, have to agree to a descriptive 
language, and so on.

Then you need to find out exactly what are the extents of the 
possibilities of that descriptive language, maybe there is a feature you 
do not know about yet, but you can probably also code it using knowledge 
you already have and for which you do not need to read any man pages.

So I do create those services.... for the boot sequence... but anything 
I want to run regularly I still do with a cron job...

It's a bit archaic to install but... it's simple, clean, and you have 
everything in one screen.

>> So you would have 5 different interventions you could use that could 
>> be considered somewhat standard and the admit can just pick and choose 
>> or customize.
>> 
> 
> And we have way longer list of actions we want to do ;) We have not
> yet come to any single conclusion how to make such thing manageable
> for a user...

Hmm.. Well I cannot ... claim to have the superior idea here.

But Idk... I think you can focus on the model right.

Maintaining max snapshot consumption is one model.

Freezing bigger volumes to protect space for smaller volumes is another 
model.

Doing so based on a "critical" flag is another model... (not myself such 
a fan of that)... (more to configure).

Reserving max, set or configured space for a specific volume is another 
model.

(That would be actually equivalent to a 'critical' flag since only those 
volumes that have reserved space would become 'critical' and their space 
reservation is going to be the threshold to decide when to deny other 
volumes more space).

So you can simply call the 'critical flag' idea the same as the 'space 
reservation' idea.

The basic idea is that all space reservations get added together and 
become a threshold.

So that's just one model and I think it is the most important one.

"Reserve space for certain volumes" (but not all of them or it won't 
work). ;-).

This is what Gionatan refered to with the ZFS ehm... shit :p.

And the topic of this email thread.




So you might as well focus on that one alone as per mr. Jonathan's 
reply.

(Pardon for my language there).




While personally I also like the bigger versus smaller idea because you 
don't have to configure it.


The only configuration you need to do is to ensure that the more 
important volumes are a bit smaller.

Which I like.

Then there is automatic space reservation using fsfreezing.

Because the free space required for bigger volumes is always going to be 
bigger than that of smaller volumes.



>> But how expensive is it to do it say every 5 seconds?
> 
> If you have big metadata - you would keep you Intel Core busy all the 
> time ;)
> 
> That's why we have those thresholds.
> 
> Script is called at  50% fullness, then when it crosses 55%, 60%, ...
> 95%, 100%. When it drops bellow threshold - you are called again once
> the boundary is crossed...

How do you know when it is at 50% fullness?

> If you are proud sponsor of your electricity provider and you like the
> extra heating in your house - you can run this in loop of course...

> Threshold are based on  mapped size for whole thin-pool.
> 
> Thin-pool surely knows all the time how many blocks are allocated and 
> free for
> its data and metadata devices.

But didn't you just say you needed to process up to 16GiB to know this 
information?

I am confused?

This means the in-kernel policy can easily be implemented.

You may not know the size and attribution of each device but you do know 
the overall size and availability?

>> In any case the only policy you could have in-kernel would be either 
>> what Gionatan proposed (fixed reserved space for certain volumes) 
>> (easy calculation right) or potentially allocation freeze at threshold 
>> for non-critical volumes,
> 
> 
> In the single thin-pool  all thins ARE equal.

But you could make them unequal ;-).

> Low number of 'data' block may cause tremendous amount of provisioning.
> 
> With specifically written data pattern you can (in 1 second!) cause
> provisioning of large portion of your thin-pool (if not the whole one
> in case you have small one in range of gigabytes....)

Because you only have to write a byte to every extent, yes.

> And that's the main issue - what we solve in  lvm2/dm  - we want to be
> sure that when thin-pool is FULL  -  written & committed data are
> secure and safe.
> Reboot is mostly unavoidable if you RUN from a device which is 
> out-of-space -
> we cannot continue to use such device - unless you add MORE space to
> it within 60second window.

That last part is utterly acceptable.

> All other proposals solve only very localized solution and problems
> which are different for every user.
> 
> I.e. you could have a misbehaving daemon filling your system device
> very fast with logs...
> 
> In practice - you would need some system analysis and detect which
> application causes highest pressure on provisioning  - but that's well
> beyond range lvm2 team ATM with the amount of developers can
> provide....

And any space reservation would probably not do much; if it is not 
filled 100% now, it will be so in a few seconds, in that sense.

The goal was more to protect the other volumes, supposing that log 
writing happened on another one, for that other log volume not to impact 
the other main volumes.

So you have thin global reservation of say 10GB.

Your log volume is overprovisioned and starts eating up the 20GB you 
have available and then runs into the condition that only 10GB remains.

The 10GB is a reservation maybe for your root volume. The system 
(scripts) (or whatever) recognises that less than 10GB remains, that you 
have claimed it for the root volume, and that the log volume is 
intruding upon that.

It then decides to freeze the log volume.

But it is hard to decide what volume to freeze because it would need 
that run-time analysis of what's going on. So instead you just freeze 
all non-reserved volumes.

So all non-critical volumes in Gionatan and Brassow's parlance.


>> I just still don't see how one check per 4MB would be that expensive 
>> provided you do data collection in background.
>> 
>> You say size can be as low as 64kB... well.... in that case...
> 
> Default chunk size if 64k for the best 'snapshot' sharing - the bigger
> the pool chunk is the less like you could 'share' it between
> snapshots...

Okay.. I understand. I guess I was deluded a bit by non-thin snapshot 
behaviour (filled up really fast without me understanding why, and 
concluding that it was doing 4MB copies).

As well as of course that extents were calculated in whole numbers in 
overviews... apologies.

But attribution of an extent to a snapshot will still be done in 
extent-sizes right?

So I was just talking about allocation, nothing else.

BUT if allocator operates on 64kB requests, then yes...

> (As pointed in other thread - ideal chunk for best snapshot sharing
> would be 4K - but that's not affordable for other reasons....)

Okay.

>>        2) I would freeze non-critical volumes ( I do not write to 
>> snapshots so that is no issue ) when critical volumes reached safety 
>> threshold in free space ( I would do this in-kernel if I could ) ( But 
>> Freezing In User-Space is almost the same ).
> 
> There are lots of troubles when you have freezed filesystems present
> in your machine fs tree... -  if you know all connections and
> restrictions - it can be 'possibly' useful - but I can't imagine this
> being useful in generic case...

Well, yeah. Linux.

(I mean, just a single broken NFS or CIFS connection can break so 
much....).



> And more for your thinking -
> 
> If you have pressure on provisioning caused by disk-load on one of
> your 'critical' volumes this FS 'freezeing' scripting will 'buy' you
> only couple seconds

Oh yeah of course, this is correct.

> (depends how fast drives you have and how big
> thresholds you will use) and you are in the 'exact' same situation -
> expect now you have  system in bigger troubles - and you already might
> have freezed other systems apps by having them accessing your
> 'low-prio' volumes....

Well I guess you would reduce non-critical volumes to single-purpose 
things.

Ie. only used by one application.

> And how you will be solving 'unfreezing' in cases thin-pool usage
> drops down is also pretty interesting topic on its own...

I guess that would be manual?

> I need to wish good luck when you will be testing and developing all
> this machinery.

Well as you say it has to be an anomaly in the first place -- an error 
or problem situation.

It is not standard operation.

So I don't think the problems of freezing are bigger than the problems 
of rebooting.

The whole idea is that you attribute non-critical volumes to single apps 
or single purposes so that when they run amock, or in any case, that if 
anything runs amock on them...

Yes it won't protect the critical volumes from being written to.

But that's okay.

You don't need to automatically unfreeze.

You need to send an email and say stuff has happened ;-).

"System is still running but some applications may have crashed. You 
will need to unfreeze and restart in order to solve it, or reboot if 
necessary. But you can still log into SSH, so maybe you can do it 
remotely without a console ;-)".

I don't see any issues with this.

One could say: use filesystem quotas.

Then that involves setting up users etc.

Setting up a quota for a specific user on a specific volume...

All more configuration.

And you're talking mostly about services of course.

The benefit (and danger) of LVM is that it is so easy to create more 
volumes.

(The danger being that you now also need to back up all these volumes).

(Independently).

>>> Default is to auto-extend thin-data & thin-metadata when needed if 
>>> you
>>> set threshold bellow 100%.
>> 
>> Q: In a 100% filled up pool, are snapshots still going to be valid?
>> 
>> Could it be useful to have a default policy of dropping snapshots at 
>> high consumption? (ie. 99%). But it doesn't have to be default if you 
>> can easily configure it and the scripts are available.
> 
> All snapshots/thins with 'fsynced' data are always secure.
> Thin-pool is protecting all user-data on disk.
> 
> The only lost data are those flying in your memory (unwritten on disk).
> And depends on you 'page-cache' setup how much that can be...

That seemes pretty secure. Thank you.

So there is no issue with snapshots behaving differently. It's all the 
same and all committed data will be safe prior to the fillup and not 
change afterward.

I guess.
