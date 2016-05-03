Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43CgLpF004463
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 May 2016 08:42:21 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FB3E80086
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 12:42:19 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id F20FC7FC60
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 14:42:16 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 03 May 2016 14:42:16 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <57234421.5040902@redhat.com>
References: <929635034.3140318.1461840230292.JavaMail.yahoo.ref@mail.yahoo.com>
	<929635034.3140318.1461840230292.JavaMail.yahoo@mail.yahoo.com>
	<445afc4b9ae3fbf477f8f66db9d28580@dds.nl> <57234421.5040902@redhat.com>
Message-ID: <ddbbb6646a8f324ca1554a62a1095ebc@dds.nl>
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

Zdenek Kabelac schreef op 29-04-2016 13:23:

> I'm not going to add much to this thread - since there is nothing
> really useful for devel.  But let me strike out few important moments:

If you like to keep things short now I will give short replies. Also 
other people have responded and I haven't read everything yet.

> it's still the admin who creates thin-volume and gets WARNING if VG is 
> not big enough when
> all thin volumes would be fully provisioned.

That is just what we could call insincere or that beautiful strange word 
that I cannot remember.

The opposite of innocuous. Disingenuous (thank you dictionary).

You know perfectly well that this warning doesn't do much of anything 
when all people approach thin from the view point of wanting to 
overprovision.

That is like saying "Don't enter this pet store here, because you might 
buy pets, and pets might scratch your arm. Now what can we serve you 
with?".

It's those insincere warnings many business or ideas give to people to 
supposedly warn them in advance of what they want to do anyway. "I told 
you it was a bad idea, now what can we do for you? :) :) :) :)". It's a 
way of being politically correct mostly.

You want to do it anyway. But now someone tells you it might be a bad 
idea even if both of you want it.


> So you try to design  'another btrfs' on top of thin provisioning?

Maybe I am. At least you recognise that I am trying to design something, 
many people would just throw it in the wastebasket with "empty 
complains".

That in itself.... ;-)

speaks some volumes.

But let's talk about real volumes now :p.

There's nothing bad about btrfs except that it usurps everything, 
doesn't separate any layers, and just overall means the end and death of 
a healthy filesystem system. It wants to be the monopoly.

> With 'thinp' you  want simplest  filesystem with robust metadata -  so
> in theory  -  'ext4' or  XFS without all 'improvements for rotational
> hdd that has accumulated over decades of their evolution.

I agree. I don't even use ext4, I use ext3. I feel ext4 may have some 
benefits but they are not really worth anything.

> You miss the 'key' details.
> 
> Thin pool is not constructing  'free-maps'  for each LV all the time -
> that's why tools like  'thin_ls'  are meant to be used from the
> user-space.
> It IS very EXPENSIVE operation.
> 
> So before you start to present your visions here, please spend some
> time with reading doc and understanding all the technology behind it.

Sure I could do that. I could also allow myself to die without ever 
having contributed to anything.

>> Even with a perfect LVM monitoring tool, I would experience a 
>> consistent
>> lack of feedback.
> 
> Mistake of your expectations

It is nothing to do with expectations. Things and feeling that keep 
creeping up to you and keep annoying you have nothing to do with 
expectations.

That is like being thoroughly annoyed about something for years and 
expecting it to go away by itself, is the epitome of sanity.

For example: monitor makes buzzing noise when turned off. Deeply 
frustrating, annoying, downright bad. Gives me nightmares even. You say 
"You have bad expectations of hardware, hardware just does that thing, 
you have to live with it." I go to shop, shop says "Yeah all hardware 
does that (so we don't need to pay you anything back)".

That has nothing to do with bad expectations.

> If you are trying to operate  thin-pool near 100% fullness - you will
> need to write and design completely different piece of software -
> sorry thinp
> is not for you and never will...

I am not trying to operate near 100% fullness.

Although it wouldn't be bad if I could manage that.

That would not be such a bad thing at all. If the tools where there to 
actually do it, and the mechanisms. Wouldn't you agree? Regardless of 
what is possible or even what is to be considered "wise" here, wouldn't 
it be beneficial in some way?

> 
>> 
>> Just a simple example: I can adjust "df" to do different stuff. But 
>> any
>> program reporting free diskspace is going to "lie" to me in that 
>> sense. So
>> yes I've chosen to use thin LVM because it is the best solution for me
>> right now.
> 
> 'df'  has nothing in common with  'block' layer.

A clothing retailer has nothing in common with a clothing manufacturer 
either, but they are just both in the same business.

> But if you've never planned to buy 10TB - you should have never allow
> to create such big volume in the first place!

So you are like saying the only use case of thin is a growth scenario 
that can be met.

> So don't do it - and don't plan to use it - it's really that simple.

What I was saying was that it would be possible to maintain the contract 
that any individual volume at any one time would be able to grow to max 
size as long as other volumes don't start acting aberrant. If you manage 
all those volumes of course you would be able to choose this.

The purpose of the thin system is to maintain the situation that all 
volumes can reach their full potential without (auto)extending, in that 
sense.

If you did actually make a 1TB volume for a single client with a 10TB 
V-size, you would be a very bad contractor. Who says it is not going to 
happen overnight? How will you be able to respond.

The situation where you have a 10TB volume and you have 20 clients with 
1TB each, is very different.

I feel the contract should be that the available real space should 
always be equal to or greater than the available on any one filesystem 
(volume).

So: R >= max(A(1), A(2), A(3), ..., A(n))

Of course it is pleasant not having to resize the filesystem but would 
you really do that for yourself? Make a 10TB filesystem on a 1TB disk as 
you expect to buy more disks in the future?

I mean you could. But in this sense resizing the filesystem (growing it) 
is not a very expensive operation, usually.

I would only want to do that if I could limit the actual usage of the 
filesystem in a real way.

Any runaway process causing my volume to drop...... NOT a good thing.

> Actually it's the core principle!
> It lies (or better say uses admin's promises) that there is going to
> be a disk space. And it's admin responsibility to fulfill it.

The admin never comes into it. What the admin does or doesn't do, what 
the admin thinks or doesn't think. These are all interpretations of 
intents.

Thinp should function regardless of what the admin is thinking or not. 
Regardless of what his political views are.

You are bringing morality into the technical system.

You are saying /thinp should work/ because /the admin should be a good 
person/.

When the admin creates the system, no "promise" is ever communicated to 
the hardware layer, OR the software layer. You are turning the correct 
operation of the machine into a human problem in the way of saying 
"/Linux is a great system and everyone can use it, but some people are 
just too stupid to spend a few hours reading a manual on a daily basis, 
and we can't help that/".

These promises are not there in the system. Someone might be using the 
system for reasons you have not envisioned. But the system is there and 
it can be used for it. Now if things go wrong you say "You you had the 
wrong use case" but a use case is just a use case, it has no morality to 
it.

If you build a waterway system that only functions as long as it doesn't 
rain (overflowing the channels) then you can say "Well my system is 
perfect, it is just God who is a bitch and messes things up".

No you have to take account of real life human beings, not those ideal 
pictures of admins that you have.

Stop the idealism you know. Admins are humans and they can be expected 
to be humans.

It is you who have wrong expectations of people.

If people mess up they mess up but it is part of the human agenda and 
you design for that.


> If you know in front you will need quickly all the disk space - then
> using thinp and expecting miracle is not going to work.

Nobody ever said anything of that kind.
