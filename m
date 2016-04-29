Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3TBr8au017674
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 07:53:08 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDDF4C000408
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 11:53:05 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id E9FED7F8FE
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 13:53:00 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 29 Apr 2016 13:53:00 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <1009262601.20160429104420@marki-online.net>
References: <75be777705b8abc643a67ca9b90d7b1b@dds.nl>
	<1009262601.20160429104420@marki-online.net>
Message-ID: <2817e1e83905496c9d3c6803a8962128@dds.nl>
Subject: Re: [linux-lvm] about the lying nature of thin
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
To: Linux lvm <linux-lvm@redhat.com>

Marek Podmaka schreef op 29-04-2016 10:44:

> I would say that thin provisioning is designed to lie about the
> available space. This is what it was invented for. As long as the used
> space (not virtual space) is not greater then real space, everything
> is ok. Your analogy with customers still applies and whole IT business
> is based on it (over-provisioning home internet connection speed,
> "guaranteed" webhosting disk space). It seems to me that disk space
> was the last thing to get over- (or thin-) provisioned :)

But you see if my landlord tells me I can use the entire container room, 
except that I have to share it with others, does he lie?

I *can* use the entire container room. I just have to ensure it is empty 
again by the end of the day (or even sooner).

Those ISPs do not say "Every client can use the full bandwidth all at 
the same time." They don't say that. They say "Fair use policies apply". 
That's what they say. And they mean that no, you can't do that stuff 
24/7/365.

So let's talk then about two things you can lie about:
* available space
* the thought that all of the space is available to everyone at all 
times.

In a normal use case, only the latter would be a lie. But that's not 
what companies tell their clients. Maybe implicitly, at times. But not 
explicitly at all (hence fair use policy).

The former is not a lie. If you have a 1000 customers, and each has 50GB 
available total, and the average use at this point is 25GB, and you have 
provisioned for ~35GB each, meaning 35000 GB is available and 25000 is 
in use, then it is not a lie to say to any individual customer: you can 
use 50GB if you want.

The guarantee that everyone can do it all at the same time, just doesn't 
hold, but that is never communicated.

As a customer you are not aware of how many other clients there are, or 
how many other thin volumes (ordinarily) or what the max capacity is 
across all the volumes. So you are not being lied to.

For it to be a lie, you would have to be concerned about the total 
picture. You would have to have an awareness of other clients and then 
you would need to make the assumption that all of these clients at the 
same time can use all of that bandwidth/data/space.

But your personal scenario doesn't extend that far.

Just as a funny example. Nearby there was a supermarket that advertized 
with that (to my mind) stupid thought "if there are more than 4 
customers in line, and you are the 5th, you get your groceries for 
free".

What did a local student's house do? They went to the supermarket with 
about 20 people and got a lot of stuff free.

I mean in statistics you have queue calculations too but it gets 
defeated if people start doing that stuff (thwarting the mechanism on 
purpose). For example, the traditional statistics example is that of 
customers at a hairsalon. Based on a certain distribution and an average 
number of new arrivals, a conclusion is reached and certain data is 
found.

But this data is thwarted the moment customers on purpose start to pile 
up just to thwart this data, you get what I mean?

Any /intentional/ purpose to thwart the average, means it is no longer 
the average.

Normal people wanting a haircut do not show up at a salon to thwart the 
salons calculations. Ordinary use cases do not apply to this.

If you can expect a command normal amount of use, then there is no 
"intent" with those clients to be doing anything out of the ordinary.

Just like that "hairsalon" can normally depend on those "calculations" 
(you could, you know) and provision for that (number of employees 
present) so too can a thin provisioning setup depend on expected 
averages (in a distribution, the "expected" value of a stochast is the 
expected average) (as a prediction in that sense).

There's no lying in that. If this hairsalon now says "You can get cut 
within 10 minutes without an appointment" then yes people could thwart 
that by suddenly all showing up at the same time.

Doesn't work like that in reality when people do not have such 
intentions.

We call that "innocence" ;-) not doing something on purpose.

That hairsalon is not lying if it guarantees 10 minute wait time in 
general. It just cannot guarantee it if people start to bugger.

Statistics is all about averages and large numbers.

"A "law of large numbers" is one of several theorems expressing the idea 
that as the number of trials of a random process increases, the 
percentage difference between the expected and actual values goes to 
zero."

That means that if you have enough numbers (enough thin volumes) the 
likelihood in actuality between what you promise and what you can 
deliver, the difference goes to zero and in effect you are always 
speaking the truth.

Remember: you are speaking the truth given normal expected reality.
You are no longer speaking the truth if people start to mess with you on 
purpose.

If you have 10.000 clients and 5.000 of them are one person intending to 
bug you out, just like in the supermarket example, well, then you've 
lost. But, that is an intentional devious thing to do just in order to 
make use of some monetary loophole in the system, so to speak.

And in general your terms of use could guard against that (and many 
companies do, I'm sure).


> Now I'm not sure what your use-case for thin pools is.

Presently maximizing space efficiency across a small number of volumes, 
as well as access to superior snapshotting ability.

> I don't see it much useful if the presented space is smaller than
> available physical space. In that case I can just use plain LVM with
> PV/VG/LV. For snaphosts you don't care much as if the snapshot
> overfills, it just becomes invalid, but won't influence the original
> LV.

You mean there'd not be any use for thin, right. I agree. The whole idea 
is to be more efficient with space.

If the presented space is smaller than you HAVE room for those 
snapshots. But with thin, you don't need to care.

Space is always there.


> But their use case is to simplify the complexity of adding storage.
> Traditionally you need to add new physical disks to the storage /
> server, add it to LVM as new PV, add this PV to VG, extend LV and
> finally extend filesystem. Usually the storage part and server (LVM)
> part is done by different people / teams. By using thinp, you create
> big enough VG, LV and filesystem. Then as it is needed you just add
> physical disks and you're done.

True but let's call it "sharing" resources.

Sharing resources is the whole idea of any advanced society.

Our western mindset doesn't work in the sense of everyone needing to be 
able to possess everything.

The example was given that everyone owns a car, that they may not use 
every day, a washing machine, that they may use 5 hours a week, a vacuum 
cleaner, that they may use 1 hour a week, and so on and so on. The 
example was given that a commercial airliner could *never* do something 
like that.

Commercial airplanes are in operation pretty much 24/7. Disuse is way 
too costly. They cannot afford to not use their machines 24/7.

Our society cannot either, but the way we live and operate with each 
other currently ensures vasts amounts of wasted materials, energy and so 
on.

Resource sharing is an advanced concept in that sense. Let's just call 
thin pools an advanced concept :p.

And let's not call it a lie just like that :) :P.

> Another benefit is disk space saving. Traditionally you need to have
> some reserve as free space in each filesystem for growth. With many
> filesystems you just wasted a lot of space. With thinp, this free
> space is "shared".

My reason exactly.

> And regarding your other mail about presenting parts / chunks of
> blocks from block layer... This is what device mapper (and LVM built
> on top of it) does - it takes many parts of many block devices and
> creates new linear block device out of them (whether it is stripped
> LV, mirrored LV, dm-crypt or just concatenation of 2 disks).

I know. But that is the reverse thing.

DM/LVM takes dispersed stuff and presents a whole.

In this case we were talking about presenting holes.

That's because in this case .....

If you are that barber/haircutter and suddenly you get an influx of 
clients you cannot handle.

Are you going to put up a sign saying "sorry, too busy" or are you going 
to try to keep your "promise" to each and every one of them? I hope you 
didn't offer financial compensation in that sense ;-).

Personally I think that as a client you making use of such "financial 
promises" is very intolerant and unforgiving and greedy and even 
avaricious ;-).

So what if your thin pool does fill up and you have no measure in place 
to handle it?

Are you going to be honest?

This question is not whether thin is currently lying. This is about 
whether you will continue to choose for it to lie.

It is not about the present. It is about the choice you are going to 
make.

Do you choose to lie or not?

Traditionally companies have always tried to keep up the pretense until 
all hell broke loose so badly that it spilled out like a tidal wave.

You can find any number of examples in the history of our world. I am 
currently thinking of the Exxon Valdez, and Enron. I don't know if that 
is applicable. Also thinking of that platform in recent times, of BP. 
Deepwater Horizon, which was said to have been deeply undermaintained.

I mean you can keep pretending everything is going just perfect, or you 
can own up a little sooner. That is a choice to make for each individual 
I guess.
