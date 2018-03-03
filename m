Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EED805D9C5
	for <linux-lvm@redhat.com>; Sat,  3 Mar 2018 17:52:28 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DE9985540
	for <linux-lvm@redhat.com>; Sat,  3 Mar 2018 17:52:24 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id 8105D40BCD51
	for <linux-lvm@redhat.com>; Sat,  3 Mar 2018 18:52:22 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 03 Mar 2018 18:52:22 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <6dd3a268-8a86-31dd-7a0b-dd08fdefdd55@redhat.com>
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
Message-ID: <b4ecd15331b44c31ae822d968b77970a@xenhideout.nl>
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
To: linux-lvm@redhat.com

I did not rewrite this entire message, please excuse the parts where I 
am a little more "on the attack".



Zdenek Kabelac schreef op 28-02-2018 10:26:

> I'll probably repeat my self again, but thin provision can't be
> responsible for all kernel failures. There is no way DM team can fix
> all the related paths on this road.

Are you saying there are kernel bugs presently?

> If you don't plan to help resolving those issue - there is not point
> in complaining over and over again - we are already well aware of this
> issues...

I'm not aware of any issues, what are they?

I was responding here to an earlier thread I couldn't respond to back 
then, the topic was whether it was possible to limit thin snapshot 
sizes, you said it wasn't, I was just recapping this thread.

> If the admin can't stand failing system, he can't use thin-p.

That just sounds like a blanket excuse for any kind of failure.

> Overprovisioning on DEVICE level simply IS NOT equivalent to full
> filesystem like you would like to see all the time here and you've
> been already many times explained that filesystems are simply not
> there ready - fixes are on going but it will take its time and it's
> really pointless to exercise this on 2-3 year old kernels...

Pardon me, but your position has typically been that it is fundamentally 
impossible, not that "we're not there yet".

My questions have always been about fundamental possibilities, to which 
you always answer in the negative.

If something is fundamentally impossible, don't be surprised if you then 
don't get any help in getting there: you always close off all paths 
leading towards it.

You shut off any interest, any discussion, and any development interest 
in paths that a long time later, you then say "we're working on it" 
whereas before you always said "it's impossible".

This happened before where first you say "It's not a problem, it's admin 
error" and then a year later you say "Oh yeah, it's fixed now".

Which is it?

My interest has always been, at least philosophically, or concerning 
principle abilities, in development and design, but you shut it off 
saying it's impossible.

Now you complain you are not getting any help.

> Thin provisioning has it's use case and it expects admin is well aware
> of possible problems.

That's a blanket statement once more that says nothing about actual 
possibilities or impossibilities.

> If you are aiming for a magic box working always right - stay away
> from thin-p - the best advice....

Another blanket statement excusing any and all mistakes or errors or 
failures the system could ever have.

> Do NOT take thin snapshot of your root filesystem so you will avoid
> thin-pool overprovisioning problem.

Zdenek, could you please make up your mind?

You brought up thin snapshotting as a reason for putting root on thin, 
as a way of saying that thin failure would lead to system failure and 
not just application failure,

whereas I maintained that application failure was acceptable.

I tried to make the distinction between application level failure (due 
to filesystem errors) and system instability caused by thin.

You then tried to make those equivalent by saying that you can also put 
root on thin, in which case application failure becomes system failure.

I never wanted root on thin, so don't tell me not to snapshot it, that 
was your idea.


> Rule #1:
> 
> Thin-pool was never targeted for 'regular' usage of full thin-pool.

All you are asked is to design for error conditions.

You want only to take care of the special use case where nothing bad 
happens.

Why not just take care of the general use case where bad things can 
happen?

You know, real life?

In any development process you first don't take care of all error 
conditions, you just can't be bothered with them yet. Eventually, you 
do.

It seems you are trying to avoid having to deal with the glaring error 
conditions that have always existed, but you are trying to avoid having 
to take any responsibility for it by saying that it was not part of the 
design.

To make this more clear Zdenek, your implementation does not cater to 
the general use case of thin provisioning, but only to the special use 
case where full thin pools never happen.

That's a glaring omission in any design. You can go on and on on how 
thin-p was not "targetted" at that "use case", but that's like saying 
you built a car engine that was not "targetted" at "running out of 
fuel".

Then when the engine breaks down you say it's the user's fault.

Maybe retarget your design?

Running out of fuel is not a use case.

It's a failure condition that you have to design for.

> Full thin-pool is serious ERROR condition with bad/ill effects on 
> systems.

Yes and your job as a systems designer is to design for those error 
conditions and make sure they are handled gracefully.

You just default on your responsibility there.

The reason you brought up root on thin was to elevate application 
failure to the level of system failure so as to make them equivalent and 
then to say that you can't do anything about system failure.

This is a false analogy, we only care about application failure in the 
general use case of stuff that is allowed to happen, and we distinguish 
system failure which is not allowed to happen.

Yes Zdenek, system failure is your responsibility as the designer, it's 
not the admin's job except when he has a car that breaks down when the 
fuel runs out.

But that, clearly, would be seen as a failure on behalf of the one 
designing the engine.

You are responding so defensively when I have barely said anything that 
it is clear you feel extremely guilty about this.


> Thin-pool was designed to 'delay/postpone' real space usage - aka you
> can use more 'virtual' space with the promise you deliver real storage
> later.

That doesn't cover the full spectrum of what we consider to be "thin 
provisioning".

You only designed for a very special use case in which the fuel never 
runs out.

The aeroplane that doesn't need landing gear because it was designed to 
never run out of fuel.

In the kingdom of birds, only swallows do that. Most other birds are 
designed for landing and taking off too.

You built a system that only works if certain conditions are met.

I'm just saying you could expand your design and cover the error 
conditions as well.

So yes: I hear you, you didn't design for the error condition.

That's all I've been saying.

> So if you have different goals - like having some kind of full
> equivalency logic to full filesystem - you need to write different
> target....

Maybe I could but I still question why it was not designed into thin-p, 
and I also doubt that it couldn't be redesigned into it.

I mean I doubt that it would require a huge rewrite, I think that if I 
were to do that thing, I could start off with thin-p just fine.

Certainly, interesting, and a worthy goal.

There are a billion fun projects I would like to take on, but generally 
I am just inquiring, sometimes I am angry about stuff not working,

but when I talk about "could this be possible?" you can assume I am 
talking from a development perspective, and you don't have to constantly 
only defend the thing currently not existing.

Sometimes I am just asking about possibilities.

"Yes, it doesn't exist, and it would require that and that and that" 
would be a sufficient answer.

I don't always need to hear all of the excuses as to why it isn't so, 
sometimes I just wonder how it could be done.



>> I simply cannot reconcile an attitude that thin-full-risk is 
>> acceptable and the admin's job while at the same time advocating it 
>> for root filesystems.
> 
> Do NOT use thin-provinioning - as it's not meeting your requirements.

It was your suggestion to use thin for root as a way of artificially 
increasing those requirements and then saying that they can't be met.

> Big news -  we are at ~4.16 kernel upstream - so noone is really
> taking much care about 4.4 troubles here - sorry about that....

I said back then.

You don't really listen, do you...

> Speaking of 4.4 - I'd generally advice to jump to higher versions of
> kernel ASAP - since  4.4 has some known bad behavior in the case
> thin-pool 'metadata' get overfilled.

I never said that I was using 4.4, if you took care to read you would 
see that I was speaking about the past.

Xenial is at 4.13 right now.

> There is on going 'BOOM' project - check it out please....

Okay...

> There is not much point in commenting support for some old distros
> other then you really should try harder with your distro
> maintainers....

I was just explaining why I was experiencing hangs and you didn't know 
what I was talking about, causing some slight confusion in our threads.

>> That's a lot easier if your root filesystem doesn't lock up.
> 
> - this is not really a fault of dm thin-provisioning kernel part.

I was saying, Zdenek, that your suggestion to use root on thin was 
rather unwise.

I don't know what you're defending against, I never said anything other 
than that.

> - on going fixes to file systems are being pushed upstream (for years).
> - fixes will not appear in years old kernels as such patches are
> usually invasive so unless you use pay someone to do the backporting
> job the easiest way forward is to user newer improved kernel..

I understand that you are mixing up my system hangs with the above 
problems you would have by using root on full thin pool, I have already 
accepted that the system hangs are fixed in later kernels.

> ATM  thin-pool can't deliver equivalent logic - just like old-snaps
> can't deliver thin-pool logic.

Sure, but my question was never about "ATM".

I asked about potential, not status quo.

Please, if you keep responding to development inquiries with status quo 
answers, you will never find any help in getting there.

The "what is" and the "what is to be" don't have to be the same, but you 
are always responding defensively as to the "what is", not understanding 
the questions.

Those system hangs, sure, status quo. Those snapshots? Development 
interest.

>> However, I don't have the space for a full copy of every filesystem, 
>> so if I snapshot, I will automatically overprovision.
> 
> Back to rule #1 - thin-p is about 'delaying' deliverance of real space.
> If you already have plan to never deliver promised space - you need to
> live with consequences....

Like I said, I was just INQUIRING about the possibility of limiting the 
size of a thin snapshot.

The fact that you respond so defensively with respect to thin pools 
overflowing, means you feel and are guilty about not taking care of that 
situation.

I was inquiring about a way to prevent thin pool overflow.

If you then suggest that the only valid use case is to have some 
auto-expanding pool, then either you are not content with just giving 
the answer to that question, or you feel it's your fault that something 
isn't possible and you try to avoid that by putting the blame on the 
user for "using it in a wrong way".

I asked a technical question. You respond like a guy who is asked why he 
didn't clean the bathroom.

According to schedule.

Easy now, I just asked whether it was possible or not.

I didn't ask you to explain why it hasn't been done.

Or where to put the blame for that.

I would say you feel rather guilty and to every insinuation that there 
is a missing feature you respond with great noise as to why the feature 
isn't actually missing.

So if I say "Is this possible?" you respond with "YOU ARE USING IT THE 
WRONG WAY" as if to feel rather uneasy to say that something isn't 
possible.

Which again, leads, of course, to bad design.

Your uneasiness Zdenek is the biggest signpost here.

Sorry to be so liberal here.


>> My snapshots are indeed meant for backups (of data volumes) ---- not 
>> for rollback ----- and for rollback ----- but only for the root 
>> filesystem.
> 
> There is more fundamental problem here:
> 
> !SNAPSHOTS ARE NOT BACKUPS!

Can you please stop screaming?

Do I have to spell out that I use the snapshot to make the backup and 
then discard the snapshot?

> This is the key problem with your thinking here (unfortunately you are
> not 'alone' with this thinking)

Yeah, maybe you shouldn't jump to conclusions and learn to read better.

>> My problem was system hangs, but my question was about limiting 
>> snapshot size on thin.
> 
> Well your problem primarily is usage of too old system....

I said "was", learn to read, Zdenek.

> Sorry to say this - but if you insist to stick with old system

Where did I say that? I said that back then, I had an 4.4 system that 
experienced these issues.

> - ask
> your distro maintainers to do all the backporting work for you - this
> is nothing lvm2 can help with...

I explained to you that our confusion back then was due to my using the 
then-current release of Ubuntu Xenial which had these problems.

I was just responding to an old thread with these conclusions:

1) Our confusion with respect to those "system hangs" was due to the 
fact that you didn't know what I was talking about, thus I thought you 
were excusing them, when you weren't.

2) My only inquiry had been about preventing snapshot overflow.
