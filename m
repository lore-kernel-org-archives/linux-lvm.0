Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43Ech8e013378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 May 2016 10:38:43 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ADC3B6266F
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 14:38:40 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 92B397FB88
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 16:38:38 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 03 May 2016 16:38:38 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <1870050920.5354287.1462276845385.JavaMail.yahoo@mail.yahoo.com>
References: <1870050920.5354287.1462276845385.JavaMail.yahoo.ref@mail.yahoo.com>
	<1870050920.5354287.1462276845385.JavaMail.yahoo@mail.yahoo.com>
Message-ID: <1a9c3f304d38f06860554183511b8780@dds.nl>
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

Just want to respond to this just to make things clear.

matthew patton schreef op 03-05-2016 14:00:

> why all of a sudden does each and every FS have to have this added
> code to second guess the block layer? The quickest solution is to
> mount the FS in sync mode. Go ahead and pay the performance piper.
> It's still not likely to be bullet proof but it's a sure step closer.

Why would anyone do what you don't want to do. Don't suggest solutions 
you don't even want yourself. That goes for all of you (Zdenek mostly).

And it is not second guessing. It is second guessing what it is doing 
currently. If you have actual information from the block layer, you 
don't NEED to second guess.

Isn't that obvious?

> What you're saying is that when mounting a block device the layer
> needs to expose a "thin-mode" attribute (or the sysdmin sets such a
> flag via tune2fs). Something analogous to mke2fs can "detect" LVM raid
> mode geometry (does that actually work reliably?).

Not necessarily. It could be transparent if these were actual available 
features as part of a feature set. The features would individually be 
able to be turned on and off, not necessarily calling it "thin".

> Then there has to be code in every FS block de-stage path:
> IF thin {
>   tickle block layer to allocate the block (aka write zeros to it? -
> what about pre-existing data, is there a "fake write" BIO call that
> does everything but actually write data to a block but would otherwise
> trigger LVM thin's extent allocation logic?)
>    IF success, destage dirty block to block layer ELSE
>    inform userland of ENOSPC
> }

What Mark suggested is not actually so bad. Preallocating means you have 
to communicate in some way to the user that space is going to run out. 
My suggestion would have been and still is in that sense to simply do 
this by having the filesystem update the amount of free space.

> This at least should maintain FS integrity albeit you may end up in a
> situation where the journal can never get properly de-staged, so
> you're stuck on any further writes and need to force RO.

I'm glad you think of solutions.


> IMO if the system admin made a conscious decision to use thin AND
> overprovision (thin by itself is not dangerous)

Again, that is just nonsense. There is not a person alive who wants to 
use thin for something that is not overprovisioning, whether it be 
snapshots or client sharing.

You are trying to get away with "hey, you chose it! now sucks if we 
don't actually listen to you! hahaha."

SUCKER!!!!.

No, the primary use case for thin is overprovisioning.

> , it's up to HIM to
> actively manage his block layer.


Block layer doesn't come into play with it.

You are separating "main admin task" and "local admin task".

What I mean is that there are different roles. Even if they are the same 
person, they are different tasks.

Someone writing software, his task is to ensure his software keeps 
working given failure conditions.

This software writer, even if it is the same person, cannot be expected 
to at that point be thinking of LVM block allocation. These are 
different things.

You communicate with the layers you communicate with. You don't go 
around that.

When you write a system that is supposed to be portable, for instance, 
you do not start depending on other features, tools or layers that are 
out of reach the moment your system or software is deployed somewhere 
else.

Filesystem communication is available to all applications. So any 
application designed for a generic purpose of installment is going to be 
wanting to depend on filesystem tools, not block layer tools.

You people apparently don't understand layering very well OR you would 
never recommend avoiding an intermediate layer (the filesystem) to go 
directly to the lower level (the block layer) for ITS admin tools.

I mean are you insane. You (Zdenek mostly) is so much about not mixing 
layers but then it is alright to go around them?

A software tool that is meant to be redeployable and should be able to 
depend on a minimalist set of existing features in the direct layer it 
is interfacing with, but still wants to use whatever is available given 
circumstances that dictate that it wouldn't harm its redeployability, 
would never choose the acquire and use the more remote and more 
uncertain set (such as LVM) when it could also be using directly 
available measures (such as free disk space, as a crude measure) that 
are available on ANY system provided that yes indeed, there is some 
level of sanity to it.

If you ARE deployed on thin and the filesystem cannot know about actual 
space then you are left in the dark, you are left blind, and there is 
nothing you can do as a systems programmer.

> Even on million dollar SANs the
> expectation is that the engineer will do his job and not drop the mic
> and walk away.

You constantly focus on the admin.

With all of this hotshot and idealist behaviour about layers you are 
espousing, you actually advocate going around them completely and using 
whatever deepest-layer or most-impact solution that is available (LVM) 
in order to troubleshoot issues that should be handled by interfacing 
with the actual layer you always have access to.

It is not just about admins. You make this about admins as if they are 
solely responsible for the entire system.

> Maybe the "easiest" implementation would be a MD layer job that the
> admin can tailor to fail all allocation requests once
> extent count drops below a number and thus forcing all FS mounted on
> the thinpool to go into RO mode.

A real software engineer doesn't go for the easiest solution or 
implementation. I am not approaching this from the perspective of an 
admin exclusively. I am also and most and more importantly a software 
programmer that wants to use systems that are going to work regardless 
of the pecularities of an implementation or system I have to work on , 
and I don't leave it to the admin of said system to do all my tasks.

As a programmer I cannot decide that the admin is going to be a perfect 
human being like so you well try to believe in, because that's what you 
think you are: you are that amazing admin that never fails taking 
account of available disk space.

But that's a moron position.

If I am to write my software, I cannot depend on bigger-scale or 
outer-level solutions to always be in place. I cannot offload my 
responsibilities to the admin.

You are insisting here that layers (administration layers and tasks) are 
mixed and completely destroyed, all in the sense of not doing that to 
the software itself?

Really?

Most importantly if I write any system that cannot depend on LVM being 
present, then NO THOSE TOOLS ARE NOT AVAILABLE TO ME.

"Why don't you just use LVM?" well fuck off.

I am not that admin. I write his system. I don't do his work.

Yet I still have the responsibility that MY component is going to work 
and not give HIM headaches. That's real life for you.

Even if in actually I might be imprisoned with broken feet and arms. I 
still care about this and I still do this work in a certain sense.

And yes I utterly care about modularity in software design. I understand 
layers much better than you do if you are able or even capable of 
suggestion such solutions.

Communication between layers does not necessarily integrate the layers 
if those interfaces are well defined and allow for modular "changing" of 
the chose solution.

I recognise full well that there is integration and that you do get a 
working together. But that is the entire purpose of it. To get the two 
things to work together more. But that is the whole gist of having 
interfaces and APIs in the first place.

It is for allowing stuff to work together to achieve a higher goal than 
they could achieve if they were just on their own.

While recognising where each responbility lies.

BLOCK LAYER <----> BLOCK LAYER ADMIN
FILESYSTEM LAYER <----> FILESYSTEM LAYER ADMIN
APPLICATION LAYER <---> APPLICATON WRITER.

Me, the application writer, cannot be expected to deal with number one, 
the block layer.

At the same time I need tools to do my work. I also cannot go to any 
random block layer admin my system might get deployed on (who's to say I 
will be there?) and beg for him to spend ample amount of time designing 
his systems from scratch so that even if my software fails, it won't 
hurt anyone.

But without information on available space I might not be able to do 
anything.

Then what happens is that I have to design for this uncertainty.

Then what happens is that I (with capital IIIII) start allocating space 
in advance as a software developer making applications for systems that 
might I don't know, run on banks or whatever. Just saying something.

Yes now this task is left to the software designer making the 
application.

Now I have to start allocating buffers to ensure graceful shutdown or 
termination, for instance.

I might for instance allocate a block file, and if writes to the 
filesystem start to fail or the filesystem becomes read-only, I might 
still be in trouble not being able to write to it ;-). So I might start 
thinking about kernel modules that I can redeploy with my system that 
ensure graceful shutdown or even continued operation. I might decide 
that files mounted as loopback are going to stay writable even if the 
filesystem they reside on is now readonly. I am going to ensure these 
are not sparse blocks and that the entire file is written to and grown 
in advance, so that my writes start to look like real block device 
writes. Then I'm just going to just patch the filesystem or the VFS to 
allow writes to these files even if it comes with a performance hit of 
additional checks.

And that hopefully not the entire volume gets frozen by LVM.

But that the kernel or security scripts just remount it ro.

That is then the best way solution for my needs in that circumstance. 
Just saying you know.

It's not all exclusively about admins working with LVM directly.


> But in any event it won't prevent irate users from demanding why the
> space they appear to have isn't actually there.

If that is your life I feel sorry for you.

I just do.
