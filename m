Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4ANwWtM012054
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 10 May 2016 19:58:33 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 541BC10B848
	for <linux-lvm@redhat.com>; Tue, 10 May 2016 23:58:29 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 67F9A7F891
	for <linux-lvm@redhat.com>; Wed, 11 May 2016 01:58:27 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 11 May 2016 01:58:27 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <573256FA.80503@tlinx.org>
References: <75be777705b8abc643a67ca9b90d7b1b@dds.nl>
	<573256FA.80503@tlinx.org>
Message-ID: <a557cf4a7349903b141c12f40143621f@dds.nl>
Subject: Re: [linux-lvm] thin disk -- like overcomitted/virtual memory? (was
 Re: about the lying nature of thin)
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

Hey sweet Linda,

this is beyond me at the moment. You go very far with this.

Linda A. Walsh schreef op 10-05-2016 23:47:

>    Isn't using a thin memory pool for disk space similar to using
> a virtual memory/swap space that is smaller than the combined sizes of 
> all
> processes?

I think there is a point to that, but for me the concordance is in the 
idea that filesystems should perhaps have different modes of requesting 
memory (space) as you detail below.

Virtual memory typically cannot be expanded (automatically) although you 
could.

Even with virtual memory there is normally a hard limit, and unless you 
include shared memory, there is not really any relation with 
overprovisioned space, unless you started talking about prior allotment, 
and promises being given to processes (programs) that a certain amount 
of (disk) space is going to be available when it is needed.

So what you are talking about here I think is expectation and 
reservation.

A process or application claims a certain amount of space in advance. 
The system agrees to it. Maybe the total amount of claimed space is 
greater than what is available.

Now processes (through the filesystem) are notified whether the space 
they have reserved is actually going be there, or whether they need to 
wait for that "robot cartridge retrieval system" and whether they want 
to wait or will quit.

They knew they needed space and they reserved it in advance. The system 
had a way of knowing whether the promises could be met and the requests 
could be met.

So the concept that keeps recurring here seems to be reservation of 
space in advance.

That seems to be the holy grail now.

Now I don't know but I assume you could develop a good model for this 
like you are trying here.

Sparse files are difficult for me, I have never used them.

I assume they could be considered sparse by nature and not likely to 
fill up.

Filling up is of the same nature as expanding.

The space they require is virtual space, their real space is the 
condensed space they actually take up.

It is a different concept. You really need two measures for reporting on 
these files: real and virtual.

So your filesystem might have 20G real space.
Your sparse file is the only file. It uses 10G actual space.
Its virtual file size is 2T.

Free space is reported as 10G.

Used space is given two measures: actual used space, and virtual used 
space.

The question is how you store these. I think you should store them 
condensed.

As such only the condensed blocks are given to the underlying block 
layer / LVM.

I doubt you would want to create a virtual space from LVM such that your 
sparse files can use a huge filesystem in a non-condensed state sitting 
on that virtual space?

But you can?

Then the filesystem doesn't need to maintain blocklists or whatever, but 
keep in mind that normally a filesystem will take up a lot of space in 
inode structres and the like, when the filesystem is huge but the actual 
volume is not.

If you create one thin pool, and a bunch of filesystems (thin volumes) 
of the same size, with default parameters, your entire thin pool will 
quickly fill up with just metadata structures.

I don't know. I feel that sparse files are weird anyway, but if you use 
them, you'd want them to be condensed in the first place and existing in 
a sort of mapped state where virtual blocks are mapped to actual blocks. 
That doesn't need to be LVM and would feel odd there. That's not its 
purpose right.

So for sparse you need a mapping at some point but I wouldn't abuse LVM 
for that primarily. I would say that is 80% filesystem and 20% LVM, or 
maybe even 60% custom system, 20% filesystem and 20% LVM.

Many games pack their own filesystems, like we talked about earlier 
(when you discussed inefficiency of many small files in relation to 4k 
block sizes).

If I really wanted sparse personally, as an application data storage 
model, I would first develop this model myself. I would probably want to 
map it myself. Maybe I'd want a custom filesystem for that. Maybe a 
loopback mounted custom filesystem, provided that its actual block file 
could grow.

I would imagine allocating containers for it, and I would want the 
"real" filesystem to expand my containers or to create new instances of 
them. So instead of mapping my sectors directly, I would want to map 
them myself first, in a tiered system, and the filesystem to map the 
higher hierarchy level for me. E.g. I might have containers of 10G each 
allocated in advance, and when I need more, the filesystem allocates 
another one. So I map the virtual sectors to another virtual space, such 
that my containers

container virtual space / container size = outer container addressing
container virtual space % container size = inner container addressing

outer container addressing goes to filesystem structure telling me (or 
it) where to write my data to.

inner container addressing follows normal procedure, and writes "within 
a file".

so you would have an overflow where the most significant bits cause 
container change.

At that point I've already mapped my "real" sparse space to container 
space, its just that the filesystem allows me to address it without 
breaking a beat.

What's the difference with a regular file that grows? You can attribute 
even more significant bits to filesystem change as well. You can have as 
many tiers as you want. You would get "falls outside of my jurisdiction" 
behaviour, "passing it on to someone else".

LVM thin? Hardly relates to it.

You could have addressing bits that reach to another planet ;-) :).


>    If a file system can be successfully closed with 'no errors' --
> doesn't that still mean it is "integrous" -- even if its sparse files
> don't all have enough room to be expanded?

Well that makes sense. But that's the same as saying that a thin pool is 
still "integrous" even though it is over-allocated. You are saying the 
same thing here, almost.

You are basically saying: v-space > r-space == ok?

Which is the basic premise of overprovisioning to begin with.

With the added distinction of "assumed possible intent to go and fill up 
that space".

Which comes down to:

"I have a total real space of 2GB, but my filesystem is already 8GB. 
It's a bit deceitful, but I expect to be able to add more real space 
when required."

There are two distinct cases:

- total allotment > real space, but individual allotments < real space
- total allotment > real space, AND individual allotments > real space

I consider the first acceptable. The second is spending money you don't 
have.

I would consider not ever creating an indvidual filesystem (volume) that 
is actually bigger (ON ITS OWN) than all the space that exists.

I would never consider that. I think it is like living on debt.

You borrow money to buy a house. It is that system.

You borrow future time.

You get something today but you will have to work for it for a long 
time, paying for something you bought years ago.

So how do we deal with future time? That is the question. Is it 
acceptable to borrow money from the future?

Is it acceptable to use space now, that you will only have tomorrow?

>    If a file system can be successfully closed with 'no errors' --
> doesn't that still mean it is "integrous" -- even if its sparse files
> don't all have enough room to be expanded?

If your sparse file has no intent to become non-sparse, then it is no 
issue.

If your sparse file already tells you it is going to get you in trouble, 
it is different.

This system is integrous depending on planned actions.

Same is true for LVM now. The system is safe until some program decides 
to allocate the entire filesystem.

And there are no checks and balances, the system will just crash.

The peculiar condition is that you have built a floor. You have a floor, 
like a circular area of a certain surface area. But 1/3 of the floor is 
not actually there.

You keep telling yourself not to go there.

The entire circle appears to be there. But you know some parts are 
missing.

That is the current nature of LVM thin.

You know that if you step on certain zones, you will fall through and 
crash to the ground below.

(I have had that happen as a kid. We were in the attic and we had 
covered the ladder gap with cardboard. Then, we (or at least I) forgot 
that the floor was not actually real and I walked on it, instantly 
falling through and ending on a step on the ladder below.)

[ People here keep saying that a real admin would not walk on that 
ladder gap. A real admin would know where the gap was at all times. He 
would not step on it, and not fall though.

But I've had it happen that I forgot where the gap was and I stepped on 
it anyway. ]



>    Does it make sense to think about a OOTS (OutOfThinSpace) daemon 
> that
> can be setup with priorities to reclaim space?

Does make some sense, certainly, to me at least, no matter if I 
understand little or are of no real importance here, but, I don't really 
understand the implications at this point.


>    Processes could also be willing to "give up memory and suspend" --
> where, when called, a handler could give back Giga-or Tera bytes of
> memory
> and save it's state as needing to restart the last pass.

That is almost a calamity mode. I need to shower, but I was actually 
just painting the walls. Need to stop painting that shower, so I can use 
it for something else.

I think it makes sense to lay a claim to some uncovered land, but when 
someone else also claims it, you discuss who needs it most, whether you 
feel like letting the other one have it, whose turn it is now, will it 
hurt you to let go of that.

It is almost the same as reserving classrooms.

So like I said, reservation. And like you say, only temporary space that 
you need for jobs. In a normal user system that is not computationally 
heavy, these things do not really arise, except maybe for video editing 
and the like.

If you have large data jobs like you are talking about, I think you 
would need a different kind of scheduling system anyway. But not so much 
automatic. Running out of space is not a serious issue if the 
administrator system allots space to jobs. Doesn't have to be a 
filesystem doing that.

But I guess your proposed daemon is just a layer above that, knowing 
about space constraints, and then allotting space to jobs based on 
priority queues. Again doesn't really have much to do with thin, unless 
every "job" would have its own "thin volume". And the "thin pool-volume 
system" would get used to "allot space" (the V-size of the volume) but 
if too much space was allotted, the system would get in trouble 
(overprovisioning) if all jobs run. Again, borrowing money from the 
future.

The premise of LVM is not that every volume is going to be able to use 
all its space. It's not that it should, has to, or is going to fill up 
as a matter of course, as an expected and normal thing.

You see thin LVM only works if the volumes are independent.

In that job system they are not independent. The independence entails an 
expected growth that does happen on purpose. It involves a probability 
distribution in which the average of expected space usage to be less 
than the maximum.

LVM thin is really a statistical thing basing itself on the laws of 
large numbers, averaging, and the expectation that if ONE volume is 
going to be max, another one won't.

If you are going to allot jobs that are expected to completely fill up 
the reserved space, you are talking about an entirely different thing.

You should provision based on average, but if average is max, it makes 
no sense anymore and you should just proportion according to available 
real space. You do not need thin volumes or a thin pool to do that sort 
of thing: just regular fixed-size filesystem with jobs and space 
requests.

In other words, the amount of sane overprovisioning you can do is 
related to the difference between max and average.

The different (max - average) is the amount you can safely overprovision 
given normal circumstances.

You do not "on purpose" and willfully provision less than the average 
you expect. Average is your criterium. Max is the individual max size. 
Overprovisioning is the ability of an individual volume to grow beyond 
average towards max. If the calculations hold, some other volume will be 
below average.

However if your numbers are smaller (not 1000s of volumes, but just a 
few) the variance grows enormously. And with the growth in variance you 
can no longer predict what is going to happen. But the real question is 
whether there is going to be any covariance, and in a real thin system, 
there should be none (independent).

For instance, if there is some hype and all your clients suddenly start 
downloading the next best movie from 200G television, you already have 
covariance.

Social unrest always indicates covariance. People stop making their own 
choices, and your predications and business and usual no longer hold 
true. Not because your values weren't sane. More like because people 
don't act naturally in those circumstances.

Covariance indicates that there is a tertiary factor, causing (for 
instance) growth in (volumes) across the line.

John buys a car, and Mary buys a house, but actually it is because they 
are getting married.

Or, John buys a car, and Mary buys a house, but the common element is 
that they have both been brainwashed by contemporary economists working 
at the World Bank.

All in all the insanity happens when you start to borrow from the 
future, which causes you to have to work your ass off to meet the 
demands you placed on yourself earlier, always having to rush, panic, 
and be under pressure.

Better not overprovision beyond your average, in the sense of not even 
having enough for what you expect to happen.


>    From how it sounds -- when you run out of thin space, what happens
> now is that the OS keeps allocating more Virtual space that has no
> backing store (in memory or on disk)...with a notification buried in a
> system log
> somewhere.

Sounds like the gold standard and having money that has no gold behind 
it or anything else of value.
