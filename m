Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3RLSbgC009527
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 17:28:37 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33DC0C049D52
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 21:28:34 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id CE4937F48F
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 23:28:31 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 27 Apr 2016 21:28:31 +0000
From: Xen <list@xenhideout.nl>
In-Reply-To: <518072682.2617983.1461760017772.JavaMail.yahoo@mail.yahoo.com>
References: <518072682.2617983.1461760017772.JavaMail.yahoo.ref@mail.yahoo.com>
	<518072682.2617983.1461760017772.JavaMail.yahoo@mail.yahoo.com>
Message-ID: <00055903b32b7728a6f681ead15b39ca@dds.nl>
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

matthew patton schreef op 27-04-2016 12:26:
> It is not the OS' responsibility to coddle stupid sysadmins. If you're
> not watching for high-water marks in FS growth vis a vis the
> underlying, you're not doing your job. If there was anything more than
> the remotest chance that the FS would grow to full size it should not
> have been thin in the first place.

Who says the only ones who would ever use or consider using thin would 
be sysadmins.?

Monitoring Linux is troublesome enough for most people and it really is 
a "job".

You seem to be intent on making the job harder rather than easy so you 
can be a type of person that has this expert knowledge while others 
don't?

I remember a reason to crack down on sysadmins was that they didn't know 
how to use "vi" - if you can't use fucking vi, you're not a sysadmin. 
This actually is a bloated version of what a system administrator is or 
could at all times be expected to do, because you are ensuring that 
problems are going to surface one way or another when this sysadmin is 
suddenly no longer capable of being this perfect guy at 100% of times.

You are basically ensuring disaster by having that attitude.

That guy that can battle against all odds and still prevail ;-).

More to the point.

No one is getting cuddled because Linux is hard enough and it is usually 
the users who are getting cuddled; strangely enough the attitude exists 
that the average desktop user never needs to look under the hood. If 
something is ugly, who cares, the "average user" doesn't go there.

The average user is oblivious to all system internals.

The system administrator knows everything and can launch a space rocket 
with nothing more than matches and some gallons of rocket fuel.

;-).


The autoextend mechanism is designed to prevent calamity when the 
filesystem(s) grow to full size. By your reasoning , it should not exist 
because it cuddles admins.

A real admin would extend manually.

A real admin would specify the right size in advance.

A real admin would use thin pools of thin pools that expand beyond your 
wildest dreams :p.

But on a more serious note, if there is no chance a file system will 
grow to full size, then it doesn't need to be that big.

But there are more use cases for thin than hosting VMs for clients.

Also I believe thin pools have a use for desktop systems as well, when 
you see that the only alternative really is btrfs and some distros are 
going with it full-time. Btrfs also has thin provisioning in a sense but 
on a different layer, which is why I don't like it.

Thin pools from my perspective are the only valid snapshotting mechanism 
if you don't use btrfs or zfs or something of the kind.

Even a simple desktop monitor, some applet with configured thin pool 
data, would of course alleviate a lot of the problems for a "casual 
desktop user". If you remotely administer your system with VNC or the 
like, that's the same. So I am saying there is no single use case for 
thin, and.

Your response mr. patton falls along the lines of "I only want this to 
be used by my kind of people".

"Don't turn it into something everyone or anyone can use".

"Please let it be something special and nichie".

You can read coddle in place of cuddle.



It seems to me pretty clear to me that a system that *requires* manual 
intervention and monitoring at all times is not a good system, 
particularly if the feedback on its current state cannot be retrieved 
from, or is usable by, other existing systems that guard against more or 
less the same type of things.

Besides, if your arguments here were valid, then 
https://bugzilla.redhat.com/show_bug.cgi?id=1189215 would never have 
existed.



> The FS already has a notion of 'reserved'. man(1) tune2fs -r

Alright thanks. But those blocks are manually reserved for a specific 
user.

That's what they are for. It is for -u. These blocks are still available 
to the filesystem.

You could call it calamity prevention as well. There will always be a 
certain amount of space for say the root user.

and by the same measure you can also say the tmpfs overflow mechanism 
for /tmp is not required either because a real admin would not see his 
rootfs go out of diskspace.

Stuff happens. You ensure you are prepared when it does. Not stick your 
head in the sand and claim that real gurus never encounter those 
situations.

The real question you should be asking is if it increases the monitoring 
aspect (enhances it) if thin pool data is seen through the lens of the 
filesystems as well.

Or whether that is going to be a detriment.

Regards.



Erratum:

https://utcc.utoronto.ca/~cks/space/blog/tech/SocialProblemsMatter

There is a widespread attitude among computer people that it is a great 
pity that their beautiful solutions to difficult technical challenges 
are being prevented from working merely by some pesky social issues 
[read: human flaws], and that the problem is solved once the technical 
work is done. This attitude misses the point, especially in system 
administration: broadly speaking, the technical challenges are the easy 
problems.

No technical system is good if people can't use it or if it makes 
people's lives harder (my words). One good example of course is Git. The 
typical attitude you get is that a real programmer has all the skills of 
a git guru. Yet git is a git. Git is an asshole system.

Beside the point here perhaps. But. Let's drop the "real sysadmin" 
ideology. We are humans. We like things to work for us. "Too easy" is 
not a valid criticism for not having something.
