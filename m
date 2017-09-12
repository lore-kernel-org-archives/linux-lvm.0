Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5D3A6FB92
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 16:44:15 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA1BD4E33D
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 16:44:11 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id CAEF140BCD2E
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 18:44:09 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Sep 2017 18:44:10 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <87a619a2-cefc-3b4e-a709-0906053503e9@redhat.com>
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
	<87a619a2-cefc-3b4e-a709-0906053503e9@redhat.com>
Message-ID: <c5f771c278988ea433ad6880afafed3a@xenhideout.nl>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

Zdenek Kabelac schreef op 12-09-2017 16:37:

> On block layer - there are many things  black & white....
>=20
> If you don't know which process 'create' written page, nor if you write
> i.e. filesystem data or metadata or any other sort of 'metadata'=20
> information,
> you can hardly do any 'smartness' logic on thin block level side.

You can give any example to say that something is black and white=20
somewhere, but I made a general point there, nothing specific.

> The philosophy with DM device is - you can replace then online with
> something else - i.e. you could have a linear LV  which is turned to
> 'RAID" and than it could be turned to   'Cache RAID'  and then even to
> thinLV -  all in one raw
> on life running system.

I know.

> So what filesystem should be doing in this case ?

I believe in most of these systems you cite the default extent size is=20
still 4MB, or am I mistaken?

> Should be doing complex question of block-layer underneath - checking
> current device properties - and waiting till the IO operation is
> processed  - before next IO comes in the process - and repeat the
> some  in very synchronous
> slow logic ??    Can you imagine how slow this would become ?

You mean a synchronous way of checking available space in thin volume by=20
thin pool manager?

> We are targeting 'generic' usage not a specialized case - which fits 1
> user out of 1000000 - and every other user needs something 'slightly'
> different....

That is completely exaggerative.

I think you will find this issue comes up often enough to think that it=20
is not one out of 1000000 and besides unless performance considerations=20
are at the heart of your ...reluctance ;-) no one stands to lose=20
anything.

So only question is design limitations or architectural considerations=20
(performance), not whether it is a wanted feature or not (it is).


> I don't think there is anything related...
> Thin chunk-size ranges from 64KiB to 1GiB....

Thin allocation is not by default in extent-sizes?

> The only inter-operation is the main filesystem (like extX & XFS) are
> getting fixed for better reactions for ENOSPC...
> and WAY better behavior when there are 'write-errors' - surprisingly
> there were numerous faulty logic and expectation encoded in them...

Well that's good right. But I did read here earlier about work between=20
ExtFS team and LVM team to improve allocation characteristics to better=20
align with underlying block boundaries.

> If zpools - are 'equally' fast as thins  - and gives you better=20
> protection,
> and more sane logic the why is still anyone using thins???

I don't know. I don't like ZFS. Precisely because it is a 'monolith'=20
system that aims to be everything. Makes it more complex and harder to=20
understand, harder to get into, etc.

> Of course if you slow down speed of thin-pool and add way more
> synchronization points and consume 10x more memory :) you can get
> better behavior in those exceptional cases which are only hit by
> unexperienced users who tends to intentionally use thin-pools in
> incorrect way.....

I'm glad you like us ;-).

>> Yes apologies here, I responded to this thing earlier (perhaps a year=20
>> ago) and the systems I was testing on was 4.4 kernel. So I cannot=20
>> currently confirm and probably is already solved (could be right).
>>=20
>> Back then the crash was kernel messages on TTY and then after some=20
>> 20-30
>=20
> there is by default 60sec freeze, before unresized thin-pool start to=20
> reject
> all write to unprovisioned space as 'error' and switches to
> out-of-space state.  There is though a difference if you are
> out-of-space in data
> or metadata -  the later one is more complex...

I can't say whether it was that or not. I am pretty sure the entire=20
system froze for longer than 60 seconds.

> In page cache there are no thing logically separated - you have 'dirty'=20
> pages
> you need to write somewhere - and if you writes leads to errors,
> and system reads errors back instead of real-data - and your execution
> code start to run on completely unpredictable data-set - well 'clean'
> reboot is still very nice outcome IMHO....

Well even if that means some dirty pages are lost before the application=20
discovers it, any read or write errors should at some point lead to the=20
application to shut down right.

I think for most applications the most sane behaviour would simply be to=20
shut down.

Unless there is more sophisticated error handling.

I am not sure what we are arguing about at this point.

Application needs to go anyway.


>> If I had a system crashing because I wrote to some USB device that was=20
>> malfunctioning, that would not be a good thing either.
>=20
> Well try to BOOT from USB :) and detach and then compare...
> Mounting user data and running user-space tools out of USB is=20
> uncomparable...

Systems would also grind to a halt from user-data and not system files.

I know booting from USB can be 1000x slower than user data.

But shared page cache for all devices is bad design, period.

> AFAIK - this is still not resolved issue...

That's a shame.

>>> You can have different pools and you can use rootfs=C2=A0 with thins to
>>> easily test i.e. system upgrades....
>>=20
>> Sure but in the past GRUB2 would not work well with thin, I was basing=20
>> myself on that...
>=20
> /boot   cannot be on thin
>=20
> /rootfs  is not a problem - there will be even some great enhancement=20
> for Grub
> to support this more easily and switching between various snapshots...

That's great, like with BTRFS I guess that this is possible?

But /rootfs was a problem. Grub-probe reported that it could not find=20
the rootfs.

When I ran with custom grub config it worked fine. It was only=20
grub-probe that failed, nothing else (Kubuntu 16.04).

>> EVERYONE would benefit.
>=20
> Fortunately most users NEVER need it ;)

You're wrong. The assurance of a system not crashing (for instance) or=20
some sane behaviour in case of fill-up, will put many minds at ease.

> Since they properly operate thin-pool and understand it's weak=20
> points....

Yes they are all superhumans right.

I am sorry for being so inferior ;-).


>> Not necessarily that the system continues in full operation,=20
>> applications are allowed to crash or whatever. Just that system does=20
>> not lock up.
>=20
> When you get bad data from your block device - your system's reaction
> is unpredictable -  if your /rootfs cannot store its metadata - the
> most sane behavior is to stop - all other solutions are so complex and
> complicated, that spending resources to avoid hitting this state are
> way better spent effort...

About rootfs, I agree.

But the nominal distinction was between thin-as-system and thin-as-data.

If you say that thin-as-data is specific use case that cannot be=20
tailored for, that is a bit odd. It is still 90% of use.

> Once again -  USE different pool - solve problems at proper level....
> Do not over-provision critical volumes...

Again what we want is a valid use case and a valid request.

If the system is designed so badly (or designed in such a way) that it=20
cannot be achieved, that does not immediately make it a bad wish.

For example if a problem is caused by the page-cache of the kernel being=20
for all block devices at once, then anyone wanting something that is=20
impossible because of that system...

...does not make that person bad for wanting it.

It makes the kernel bad for not achieving it.


I am sure your programmers are good enough to achieve asynchronous=20
state-updating for a thin-pool that does not interfere with allocation=20
to the extent that it will lazily update stats and which point=20
allocation constraints might be basing themselves on older data (maybe=20
seconds old) but that still doesn't mean it is useless.

It doesn't have to be perfect.

If my "critical volume" wants 1000 free extents, but it only has 988,=20
that is not so great a problem.

Of course, I know, I hear you say "Use a different pool".

The whole idea for thin is resource efficiency.

There is no real reason that this "space reservation" can't happen.

Even if due to current design limitations, that might be there for a=20
good reason, you are the arbiter on that.

It cannot be perfect or has to happen asynchronously.

It is better if non-critical volume starts failing than critical volume.

Failure is imminent, but we can choose which fails first.




I mean your argument is no different from.

"We need better man pages."

"REAL system administrators can use current man pages just fine."

"But any improvement would also benefit them, no need for them to do=20
hard stuff when it can be easier."

"Since REAL system administrators can do their job as it is, our=20
priorities lie elsewhere."

It's a stupid argument.

Any investment in user friendliness pays off for everyone.

Linux is often so impossible to use because no one makes that=20
investment, even though it would have immeasurable benefits for=20
everyone.

And then when someone does make the effort (e.g. makefile that displays=20
help screen when run with no arguments) someone complains that it breaks=20
the contract that "make" should start compiling instantly, thus using=20
"status quo" as a way to never improve anything.

In this case, make "help screen" can save people litterally hours of=20
time, multiplied by a 1000 people at least.


>> I.e. filesystem may guess about thin layout underneath and just write=20
>> 1 byte to each block it wants to allocate.
>=20
> :) so how do you resolve error paths -  i.e. how do you restore space
> you have not actually used....
> There are so many problems with this you can't even imagine...
> Yeah - we've spent quite some time in past analyzing those paths....

In this case it seems that if this is possible for regular files (and=20
directories in that sense) it should also be possible for "magic" files=20
and directories that only exist to allocate some space somewhere. In any=20
case it is FS issue, not LVM.

Besides, you only strengthen my argument that it isn't FS that should be=20
doing it.


> Please finally stop thinking about  some 'reserved' storage for
> critical volume. It leads to nowhere....

It leads to you trying to convince me it isn't possible.

But no matter how much you try to dissuade, it is still an acceptable=20
use case and desire.



> Do the right action at right place.
>=20
> For critical volume  use  non-overprovisiong pools - there is nothing
> better you can do - seriously!

For Gionatan's use case the problem was poor performance of=20
non-overprovisioning system.



> Maybe start to understand how kernel works in practice ;)

Or how it doesn't work ;-).

Like,

I will give stupid example.

Suppose using a pen is illegal.

Now lots of people want to use pen, but they end up in jail.

Now you say "Wanting to use pen is bad desire, because of consequences".

But it's pretty clear the desire won't go away.

And the real solution needs to be had at changing the law.


In this case, people really want something and for good reasons. If=20
there are structural reasons that it cannot be achieved, that is just=20
that.

That doesn't mean the desires are bad.



You can forever keep saying "Do this instead" but that still doesn't=20
ever make the prime desires bad.

"Don't use a pen, use a pencil. Problem solved."

Doesn't make wanting to use a pen a bad desire, nor does it make wanting=20
some safe space in provisioning a bad desire ;-).


> Otherwise you spend you live boring developers with ideas which simply
> cannot work...

Or maybe changing their mind, who knows ;-).


> So use 2 different POOLS, problem solved....

Was not possible for Gionatan's use case.

Myself I do not use critical volume, but I can imagine still wanting=20
some space efficiency even when "criticalness" from one volume to the=20
next differs.




It is proper desire Zdenek. Even if LVM can't do it.


> Well it's always about checking 'upstream' first and then bothering
> your upstream maintainer...

If you knew about the pre-existing problems, you could have informed me.

In fact it has happened that you said something cannot be done, and then=20
someone else said "Yes, this has been a problem, we have been working on=20
it and problems should be resolved now in this version".



You spend most of your time denying that something is wrong.

And then someone else says "Yes, this has been an issue, it is resolved=20
now".

If you communicate more clearly then you also have less people bugging=20
you.

> We really cannot be solving problems of every possible deployed
> combination of software.

The issue is more that at some point this was the main released version.

Main released kernel and main released LVM, in a certain sense.


Some of your colleagues are a little more forthcoming with=20
acknowledgements that something has been failing.

This would considerably cut down the amount of time you spend being=20
"bored" because you try to fight people who are trying to tell you=20
something.

If you say "Oh yes, I think you mean this and that, yes that's a problem=20
and we are working on it" or "Yes, that was the case before, this=20
version fixes that" then


these long discussions also do not need to happen.

But you almost never say "Yes it's a problem", Zdenek.

That's why we always have these debates ;-).
