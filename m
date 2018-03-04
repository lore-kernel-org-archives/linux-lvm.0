References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
	<b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
	<6dd12ab9-0390-5c07-f4b7-de0d8fbbeacf@redhat.com>
	<3831e817d7d788e93a69f20e5dda1159@xenhideout.nl>
	<0ab1c4e1-b15e-b22e-9455-5569eeaa0563@redhat.com>
	<51faeb921acf634609b61bff5fd269d4@xenhideout.nl>
	<4b4d56ef-3127-212b-0e68-00b595faa241@redhat.com>
	<bd9a12f33412163e9c65b4a9b78eeb4f@xenhideout.nl>
	<6dd3a268-8a86-31dd-7a0b-dd08fdefdd55@redhat.com>
	<b4ecd15331b44c31ae822d968b77970a@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <c5dc5afe-8572-a00a-9ade-b794645125ea@redhat.com>
Date: Mon, 5 Mar 2018 00:27:42 +0100
MIME-Version: 1.0
In-Reply-To: <b4ecd15331b44c31ae822d968b77970a@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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

Dne 3.3.2018 v 18:52 Xen napsal(a):
> I did not rewrite this entire message, please excuse the parts where I am a 
>> I'll probably repeat my self again, but thin provision can't be
>> responsible for all kernel failures. There is no way DM team can fix
>> all the related paths on this road.
> 
> Are you saying there are kernel bugs presently?

Hi

It's sure thing there are kernel bugs present - feel free to dive
in bugzilla list either in RH pages or kernel itself...

>> Overprovisioning on DEVICE level simply IS NOT equivalent to full
>> filesystem like you would like to see all the time here and you've
>> been already many times explained that filesystems are simply not
>> there ready - fixes are on going but it will take its time and it's
>> really pointless to exercise this on 2-3 year old kernels...
> 
> Pardon me, but your position has typically been that it is fundamentally 
> impossible, not that "we're not there yet".

Some things are still fundamentally impossible.

We are just closing/making 'time-window' where user can hit problem much smaller.

Think of as if you are seeking for a car the never crashes...


> My questions have always been about fundamental possibilities, to which you 
> always answer in the negative.

When you post 'detailed' question - you will get detailed answer.

If you ask in general - then general answer is - there are some fundamental 
kernel issues (like shared page cache) where some cases are unsolvable.

If you change your working constrain set - you can get different 
results/performance...

> If something is fundamentally impossible, don't be surprised if you then don't 
> get any help in getting there: you always close off all paths leading towards it.

The Earth can be blasted by Gamma-rays from supernova any second - can we 
prevent this?

So seriously if have scenario where it does fail - open bugzilla provide 
description/reproducer for your case.

If you seek for 1000% guaranty it will never fail - them we are sorry - this 
is not a system with 10 states you can easily get in control...

> My interest has always been, at least philosophically, or concerning principle 

We are solving real bugs not philosophy.

> abilities, in development and design, but you shut it off saying it's impossible.

Please can you stop accusing me here I'm shutting anyone here off.
Provide exact full sentences where I did that....

>> Thin provisioning has it's use case and it expects admin is well aware
>> of possible problems.
> 
> That's a blanket statement once more that says nothing about actual 
> possibilities or impossibilities.

This forum is really not about detailed description of Linux core 
functionality. You are always kindly asked to get active and learn how Linux 
kernel works.

Here we are discussing what LVM2 can do.

LVM2 usused whatever DM target + kernel provides.

So whenever I say  that something is impossible for lvm2  - it's always 
related to current state of kernel.

If them something changes in kernel to make things moving on - lvm2 can use it.


> You brought up thin snapshotting as a reason for putting root on thin, as a 
> way of saying that thin failure would lead to system failure and not just 
> application failure,
> 
> whereas I maintained that application failure was acceptable.

It's getting pointless to react on this again and again...

> 
> I tried to make the distinction between application level failure (due to 
> filesystem errors) and system instability caused by thin.
> 
> You then tried to make those equivalent by saying that you can also put root 
> on thin, in which case application failure becomes system failure.

So once again for Xen -  there *ARE* scenarios where usage of thin for your 
rootfs will block your system if thin-pool gets full - and this still applies 
for latest kernel.

On the other hand it's pretty complicated set of condition you would need to 
meet to hit this...

There should be no such case (system freeze) if you hit full thin-pool for 
non-rootfs.  A bit more 'fuzzy' question is if you will be able to recover 
your filesystem located on such thin volume....

> You want only to take care of the special use case where nothing bad happens.
> 
> Why not just take care of the general use case where bad things can happen?
> 
> You know, real life?

Because the answer  '42'  will usually not recover user's data...

The more complex answer is - we solve more trivial things first...

> In any development process you first don't take care of all error conditions, 
> you just can't be bothered with them yet. Eventually, you do.

We always do care about error paths - likely way more than you can actually 
even imagine...

That's why we to admit there are very hard to solve problems...
and solving them is way harder then educating users to use thin-pool properly.

You are probably missing how big the team behind dm & lvm2 is ;) and how busy 
this team already is....

> It seems you are trying to avoid having to deal with the glaring error 
> conditions that have always existed, but you are trying to avoid having to 
> take any responsibility for it by saying that it was not part of the design.

Yep we can mainly support 'designed' use cases -  sad but true....

> To make this more clear Zdenek, your implementation does not cater to the 

If you think lvm2 is using  dm thin-pool kernel target in bad way - open 
bugzilla how it should use this target better - my best advice here.

Keep in mind, I've not implemented dm thin-pool kernel targets....
(and filesystems and page case and linux memory model...)


> That's a glaring omission in any design. You can go on and on on how thin-p 
> was not "targetted" at that "use case", but that's like saying you built a car 
> engine that was not "targetted" at "running out of fuel".

Do you expect your engine will do any work when it runs out of fuel?

Adding more fuel/space fixes 99.999% problems with thin-pool as well.

> Then when the engine breaks down you say it's the user's fault.

When we are at this comparison:

Formula One engine can damage itself even when temperature gets too low....

Currently most users we support do prefer more speed and are taking care about 
the thin-pool to prevent its running into unsupported corner cases...

> 
> Maybe retarget your design?

When you find a lot of users with the interest of having/(paying devel) of low 
performing thin-pool where every sector update makes full validation of 
metadata......

Possibly waiting for you to show how to do it better.

I promise I'll implement lvm2 support for your DM target then when users will 
find it worthy....

> It's a failure condition that you have to design for.

You probably still missed the message - thin-pool *IS* designed to not crash 
itself!

If kernel crashes on kernel bug because of thin-pool - it'd be a serious bug 
to fix and you need to open BZ for such case.

However the problem you are usually seeing is some 'related' problem - like 
unrecoverability of filesystem sitting on top of thin volume....


> 
>> Full thin-pool is serious ERROR condition with bad/ill effects on systems.
> 
> Yes and your job as a systems designer is to design for those error conditions 
> and make sure they are handled gracefully.

Just repeating here - thin-pool is designed for out-out-space (our-of-fuel) 
case. Rest of kernel - i.e. filesystem, user-space has quite some room for 
improvements since it's not expecting it's using non-existing space....

> This is a false analogy, we only care about application failure in the general 
> use case of stuff that is allowed to happen, and we distinguish system failure 
> which is not allowed to happen.

Your system runs just set of user-space applications...

At  'block-layer' we have no idea which blocks belong to anything.

> Yes Zdenek, system failure is your responsibility as the designer, it's not 

To give you another thinking point:

Think of thin running from  thin-pool out-of-space as a device with 
unpredictable error behavior (returning WRITE errors from time to time)

Do you expect any HDD/SSD developer/manufacturer is responsible for making 
your system unstable when device hits error condition.


> But that, clearly, would be seen as a failure on behalf of the one designing 
> the engine >
> You are responding so defensively when I have barely said anything that it is 
> clear you feel extremely guilty about this.

Not at all.

And I hope to see your patches will show us all how bad/poor developers we are...

> You only designed for a very special use case in which the fuel never runs out.

So when it's been your last time you run out-of-fuel in your car?
I'm driving for many many years and never did that. And I don't even known 
ANYONE in person who run out of fuel.

I'm sure there ARE few people who managed to run out of fuel - those will have 
pretty bad day - and for sure they have to 'restart' their car! - but because 
of this possibility I'm not advocating to build  gas station every mile...

> You built a system that only works if certain conditions are met.

Yes - we have priorities, we want to address.

You happen to have different one - it's very simple to design things differently.

Just please stop us pointlessly convincing us only your goals are GOOD and 
ours are BAD and we are kindergarten kids...

It's open-source world - just make your design fly...


> So yes: I hear you, you didn't design for the error condition.
> 
> That's all I've been saying.

And you are completely misunderstanding it.

The only way you can likely to even slightly understand if - you simply start 
writing something yourself.


> I mean I doubt that it would require a huge rewrite, I think that if I were to 
> do that thing, I could start off with thin-p just fine.

Unfortunately you can't....

> Certainly, interesting, and a worthy goal.

Please just go for it.


> I was just explaining why I was experiencing hangs and you didn't know what I 
> was talking about, causing some slight confusion in our threads.

I'd experienced my window manager crashed, my kernel crashed many times, many 
apps are crashing.

When I'm getting annoyed - I sit and try to do a proper bugzilla report - and 
surprise - in a lot of case I get a fix made by maintainer or in trivial case 
i can post patch myself...

So it's my best advice also for you.

> Please, if you keep responding to development inquiries with status quo 
> answers, you will never find any help in getting there.

Well yeah - if someone asks me how he can solve existing problem today,
I'll not be answering his question with long story how he could solve in next 
decade...

It either works today or not...

There is no question  'what if I would fix  A, B, C, D, ....'


> Those system hangs, sure, status quo. Those snapshots? Development interest.

I'm confused then about which HANG your are still talking about ?

Thin-pool itself does NOT hang.

> Like I said, I was just INQUIRING about the possibility of limiting the size 
> of a thin snapshot.

And you've got the answer already many times - ATM thin-pool data structures 
are not designed to meet this request.

It really a complete redesign.

For existing thin-pool users is good enough to know total free space in 
thin-pool, and manage operations based on this.


> The fact that you respond so defensively with respect to thin pools 
> overflowing, means you feel and are guilty about not taking care of that 
> situation.

It's not about taking care - it's been intentional.
Performance and memory constrains are behind this.

If you don't care about performance and memory (aka you have different 
constrain set) - you can have your ideas supported better.

It's also worth to say, your particular case with one thin origin and just 
number of snapshots is rather very limited minor use case.
Thin-pool is more about parallel independent volume usage....

> I asked a technical question. You respond like a guy who is asked why he 
> didn't clean the bathroom.

You get your answers many times repeatedly in this list....

> Easy now, I just asked whether it was possible or not.

No it's *NOT* possible with dm thin-pool target.
It can be possible with XEN provisioning target...

> I would say you feel rather guilty and to every insinuation that there is a 
> missing feature you respond with great noise as to why the feature isn't 
> actually missing.
> 

I've not been design DM thin-pool target myself, so whatever kind of personal 
blame you are making here constantly on me, is actually completely 
irrelevant... (and this is not 1st. time you've been explained this).

> So if I say "Is this possible?" you respond with "YOU ARE USING IT THE WRONG 
> WAY" as if to feel rather uneasy to say that something isn't possible.

With all my answers - it's always related to current linux kernel
and dm thin-pool target.


> Which again, leads, of course, to bad design.
> 
> Your uneasiness Zdenek is the biggest signpost here.

I can say it's not me who is 'uneasy' here...

> 
> 2) My only inquiry had been about preventing snapshot overflow.
> 

And you were explained that supported and suggested solution is to monitor 
thin-pool and solve the problem in user-space by removing unneeded thin 
volumes ahead of time...

Is your all 'lengthy' messaging here on the list here, just because you don't 
like to 'play' the game lvm2 way??

Regards

Zdenek
