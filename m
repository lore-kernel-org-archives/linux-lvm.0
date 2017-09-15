Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95F526F953
	for <linux-lvm@redhat.com>; Fri, 15 Sep 2017 08:37:19 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7B1C85546
	for <linux-lvm@redhat.com>; Fri, 15 Sep 2017 08:37:16 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp1.signet.nl (Postfix) with ESMTP id 4B8A85BD01
	for <linux-lvm@redhat.com>; Fri, 15 Sep 2017 10:37:14 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Fri, 15 Sep 2017 10:37:14 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <789E8B9F-A4FF-46A8-806F-A97786F1BCA3@redhat.com>
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
	<789E8B9F-A4FF-46A8-806F-A97786F1BCA3@redhat.com>
Message-ID: <b6a18f74386f83d177c29642e6b9ce49@xenhideout.nl>
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

Brassow Jonathan schreef op 15-09-2017 4:06:

> There are many solutions that could work - unique to every workload
> and different user.  It is really hard for us to advocate for one of
> these unique solutions that may work for a particular user, because it
> may work very badly for the next well-intentioned googler.

Well, thank you.

Of course in the split between saying "it is the administrator's job 
that everyone works well" and at the same time saying that those 
administrators can be "googlers".

There's a big gap between that. I think that many who do employ thinp 
will be at least a bit more serious about it, but perhaps not as serious 
that they can devote all the resources to developing all of the 
mitigating measures that anyone could want.

So I think the common truth lies more in the middle: they are not 
googlers who implement the first random article they find without 
thinking about it, and they are not professional people in full time 
employment doing this thing.


So because of that fact that most administrators interested in thin like 
myself will have read LVM manpages a great deal already on their own 
systems...

And any common default targets for "thin_command" could also be well 
documented and explained, and pros and cons layed out.

The only thing we are talking about today is reserving space due to some 
threshold.

And performing an action when that reservation is threatened.

So this is the common need here.

This need is going to be the same for everyone that uses any scheme that 
could be offered.

Then the question becomes: are interventions also as common?

Well there are really only a few available:

a) turning into error volume as per the bug
b) fsfreezing
c) merely reporting
d) (I am not sure if "lvremove" should really be seriously considered).

At this point you have basically exhausted any default options you may 
have that are "general". No one actually needs more than that.

What becomes interesting now is the logic underpinning these decisions.

This logic needs some time to write and this is the thing that 
administrators will put off.

So they will live with not having any intelligence in automatic response 
and will just live with the risk of a volume filling up without having 
written the logic that could activate the above measures.

That's the problem.

So what I am advocating for -- I am not disregarding Mr. Zdenek's bug 
;-), [1], In fact I think this "lverror" would be very welcome 
(paraphrasing here) even though personally I would want to employ a 
filesystem mechanic if I am doing this using a userland too anyway!!!

But sure, why not.

I think that is complementary to and orthogonal to the issue of where 
the logic is coming from, and that the logic also requires a lot of 
resources to write.

So even though you could probably hack it together in some 15 minutes, 
and then you need testing etc...

I think it would just be a lot more pleasant if this logic framework 
already existed, was tried and tested, did the job correctly, and can 
easily be employed by anyone else.

So I mean to say that currently we are only talking about space 
reservation.


You can only do this in a number of ways:

- % of total volume size.

- fixed amount configured per volume

And that's basically it.

The former merely requires each volume to be 'flagged' as 'critical' as 
suggested.
The latter requires some number to be defined and then flagging is 
unnecessary.

The script would ensure that:

- not ALL thin volumes are 'critical'.
- as long as a single volume is non-critical, the operation can continue
- all critical volumes are aggregated in required free space
- the check is done against currently available free space
- the action on the non-critical-volumes is performed if necessary.

That's it. Anyone could use this.



The "Big vs. Small" model is a little bit more involved and requires a 
little bit more logic, and I would not mind writing it, but it follows 
along the same lines.

*I* say that in this department, *only* these two things are needed.

+ potentially the lverror thing.

So I don't really see this wildgrowth of different ideas.


So personally I would like the "set manual size" more than the "use 
percentage" in the above. I would not want to flag volumes as critical, 
I would just want to set their reserved space.

I would prefer if I could set this in the LVM volumes themselves, rather 
than in the script.

If the script used a percentage, I would want to be able to configure 
the percentage outside the script as well.

I would want the script to do the heavy lifting of knowing how to 
extract these values from the LVM volumes, and some information on how 
to put them there.

(Using tags and all of that is not all that common knowledge I think).

Basically, I want the script to know how to set and retrieve properties 
from the LVM volumes.

Then I want it to be easy to see the reserved space (potentially) 
(although this can conflict with not being a really integrated feature) 
and perhaps to set and change it...

So I think that what is required is really only minimal...

But that doesn't mean it is unnecessary.

> We’ve tried to strike a balance of doing the things that are knowably
> correct and getting 99% of the problems solved, and making the user
> aware of the remaining problems (like 100% full thin-provisioning)
> while providing them the tools (like the ‘thin_command’ setting) so
> they can solve the remaining case in the way that is best for them.

I am really happy to learn about these considerations.

I hope that we can see as the result of this today the inclusion of the 
script you mentioned in the previous email.

Something that hopefully would use values tagged into volumes, and a 
script that would need no modification by the user.

Something that would e.g. be called with the name of the thin pool as 
first parameter (pardon my ignorance) and would take care of all the 
rest by retrieving values tagged onto volumes.


( I mean that's what I would write, but if I were to write it probably 
no one else would ever use it, so .... (He says with a small voice) ).

And personally I would prefer this script to use "fsfreeze" as you 
mentioned (I was even not all that aware of this command...) rather than 
changing to an error target.

But who knows.

I am not saying it's a bad thing.

Seems risky though.

So honestly I just completely second the script you proposed, mr. 
Jonathan.

;-).


While I still don't know why any in-kernel thing is impossible, seeing 
that Zdenek-san mentioned overall block availability to be known, and 
that you only need overall block availability + some configured values 
to impose any sanctions on non-critical volumes.....

I would hardly feel a need for such a measure if the script mentioned 
and perhaps the other idea that I like so much of "big vs small" would 
be readily available.

I really have no other wishes than that personally.

It's that simple.

Space reservation and big to small protection.

Those are the only things I want.

Now all that's left to do is upgrade my LVM version ;-).

(Hate messing with a Debian install ;-)).

And I feel almost like writing it myself after having talked about it 
for so long anyway...

(But that's what happens when you develop ideas).



> We probably won’t be able to provide any highly refined scripts that
> users can just plug in for the behavior they want, since they are
> often so highly specific to each customer.  However, I think it will
> be useful to try to create better tools so that users can more easily
> get the behavior they want.  We want to travel as much distance toward
> the user as possible and make things as usable as we can for them.
> From this discussion, we have uncovered a handful of useful ideas
> (e.g. this bug that Zdenek filed:
> https://bugzilla.redhat.com/show_bug.cgi?id=1491609) that will make
> more robust scripts possible.  We are also enhancing our reporting
> tools so users can better sort through LVM information and take
> action.  Again, this is in direct response to the feedback we’ve
> gotten here.

Well that's very good. It took me a long time to sort through the 
information without the thinls command.

Indeed, if such data is readily available it makes the burden of writing 
the script yourself much less as well.

Still I would still vouch for the inclusion of the 2 scripts mentioned:

- space reservation
- big vs. small

And I don't mind writing the second one myself, or at least an example 
of it.

Regards.


[1] https://bugzilla.redhat.com/show_bug.cgi?id=1491609
