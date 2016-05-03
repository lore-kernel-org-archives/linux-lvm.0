Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43FlAsD003436
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 May 2016 11:47:10 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6BC91636C8
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 15:47:07 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id EFEAF7FC84
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 17:47:05 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 03 May 2016 17:47:05 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <1614984310.1700582.1462280490763.JavaMail.yahoo@mail.yahoo.com>
References: <1614984310.1700582.1462280490763.JavaMail.yahoo.ref@mail.yahoo.com>
	<1614984310.1700582.1462280490763.JavaMail.yahoo@mail.yahoo.com>
Message-ID: <9f67ac4350e6ff7ddca3dde20bd2741c@dds.nl>
Subject: Re: [linux-lvm] thin handling of available space
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

matthew patton schreef op 03-05-2016 15:01:

> Ceph?!? yeah I don't think so.

Mark's argument was nothing about comparing feature sets or something at 
this point. So I don't know what you are responding to. You respond like 
a bitten bee.

Read again. Mark Mielke described actual present-day positions. He 
described what he thinks is how LVM is positioning itself in conjunction 
with and with regards to other solutions in industry. He described that 
to his mind the bigger remote storage solutions do not or would not 
easily or readily start using LVM for those purposes, while the smaller 
scale or more localized systems would.

He described a layering solution, that you seem to be allergic to. He 
described a modularized system where thin is being used both at the 
remote backend (using a different technology) and at the local end 
(using LVM) for different purposes but achieving much of the same 
results.

He described how he considered the availability of the remote pool a 
responsibility for that remote supplier (and paying good money for it) 
while having different uses cases for LVM thin himself or themselves.

And I did think he made a very good case for this. I absolutely believe 
his use case is the most dominant and important one for LVM. LVM is for 
local systems.

In this case it is a local system running storage on a remote backend. 
Yet the local system has different requirements and uses LVM thin for a 
different purpose.

And this purpose falls along the lines of having cheap and freely 
available snapshots.

And he still feels and believes, apparently, that using the LVM admin 
tools for ensuring the stability of his systems might not be the most 
attractive and functional thing to do.

You may not agree with that but it is what he believes and feels. It is 
a real life data point, if you care about that.

Sometimes people's opinions actually simply just inform you of the 
world. It is information. It is not something to fight or disagree with, 
it is something to take note of.

The better you are able to respond to these data points, the better you 
are aware of the system you are dealing with. That could be real people 
paying or not paying you money.

However if you are going to fight every opinion that disagrees with you, 
you will never get to the point of actually realizing that they are just 
opinions and they are a wealth of information if you'd make use of it.

And that is not a devious thing to do if you're thinking that. It is 
being aware. Nothing more, nothing less.

And we are talking about awareness here. Not surprising then that the 
people most vehemently opposing this also seem to be the people least 
aware of the fact that real people with real uses cases might find the 
current situation not practical.

Mr. Zdenek can say all he wants that the current situation is very 
practical.

If that is not a data point but an opinion (not of someone experiencing 
it, but someone who wants certain people to experience certain things) 
then we must listen to actual data points and not what he wants.

Mr. Zdenek (I haven't responded to him here now) also responds like a 
bitten bee to simple allusions that Red Hat might be thinking this or 
that.

Not just stung by a bee. A bee getting stung ;-).

I mean come on people. You have nothing to lose. Either it is a good 
idea or it isn't. If it gets support, maybe someone will implement it 
and deliver proof of concept. But if you go about shooting it down the 
moment it rears its ugly (or beautiful) head you also ensure that that 
developer time is not going to be spend on it even if it were an asset 
to you.

Someone discussing a need might not always be that person that in the 
end is not going to do anything himself.

You are trying to avoid work but in doing so you avoid work being done 
for you as well.

It's give or take, it's plus plus.

Don't kill other people's ideas and maybe they start doing work for you 
too.

Oh yeah. Sorry if I'm being judgmental or belligerent (or pedantic):

The great irony and tragedy of the Linux world is this:




Someone comes with a great idea that he/she believes in and wants to 
work on.

They shoot it down.

Next they complain why there are so very few volunteers.



They can ban someone on a mailing list one instant and out loud wonder 
how they can attract more interest to their system, the next.




Not unrelated.




> sure, but that spells responsible sysadmin. Xen's post implied he
> didn't want to be bothered to manage his block layer  that magically
> the FS' job was to work closely with the block layer to suss out when
> it was safe to keep accepting writes. There's an answer to "works
> closely with block layer" - it's spelled BTRFS and ZFS.

It is not my block layer. I'm not the fucking system admin.

I can only talk to the FS. Or that might very well be the case for my 
purposes here.

It is pretty amazing that any attempt to separate responsibilities in 
actuality is met with a rebuttal that insists one use a solution that 
mingles everything.

In your ideal world then, everyone is forced to use BTRFS/ZFS because at 
least these take the worries away from the software/application 
designer.

And you ensure a beautiful world without LVM because it has no purpose.

As as software developer I cannot depend on your magical solution and 
assertion that every admin out there is going to be this amazing person 
that never makes a mistake.



> Responsible usage has nothing to do with single vs multiple customers.
> Though Xen broached the 'hosting' example and in the cut-rate hosting
> business over-provisioning is rampant. It's not a problem unless the
> syadmin drops the ball.

What if I want him to be able to drop the ball and still survive?

What about designing systems that are actually failsafe and resilient?

What about resilience?

What about goodness?

What about quality?

What about good stuff?

Why do you feed your admins bad stuff just so that they can shine and 
consider themselves important?





> So you're going to write and then backport "second guess the block
> layer" code to all filesystems in common use and god knows how many
> versions back? Of course not. Just try to get on the EXT developer
> mailing list and ask them to write "block layer second-guessing code
> (aka branch on device flag=thin)" because THINP will cause problems
> for the FS when it runs out of extents. To which the obvious and
> correct response will be "Don't use THINP if you're not prepared to
> handle it's pre-requisites."

So you are basically suggesting a solution that you know will fail, but 
still you recommend it.

That spells out "I don't know how to achieve my goals" like no other 
thing.

But you still think people should follow your recommendations.

What you say is completely anemic to how the open source world works.

You do not ask people to do your work for you.

Why do you even insist on recommending that. And then when you (in your 
imagination here) do ask those people to do it for you, they refuse. No 
small wonder.

Still you consider that a good way to approach things. To depend on 
someone else to do your work for you.

Really.

"Of course not. Just try to get on the EXT developer mailing list and 
ask them to..."

Yes I am ridiculing you.

You were sincere in saying those words. You ridicule yourself.

Of course you would start designing patches and creating a workable 
solution with yourself as the main leader or catalyst of that project. 
There is not other way to do things in life. You should know that.



> Then by all means go ahead and retrofit all known filesystems with the
> extra logic. ALL of the filesystems were written with the
> understanding that the block layer is telling the truth and that any
> "white lie" was benign in so much that it would be made good and thus
> could be assumed to be "truth" for practical purpose.

Maybe we should also retrofit all unknown filesystems and those that 
might be designed on different planets. Yeah, that would be a good way 
to approach things.

I really want to follow your recommendations here. If I do, I will have 
good chances of achieving success.
