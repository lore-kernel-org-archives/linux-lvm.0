Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43D3fY0015349
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 May 2016 09:03:41 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0950546267
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 13:03:40 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 364D17FC6B
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 15:03:37 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 03 May 2016 15:03:37 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <CALm7yL2T1Hg3A8nPz41eS1yOs7Ge6LHr1F7zAXQuXPea+OWWuQ@mail.gmail.com>
References: <75be777705b8abc643a67ca9b90d7b1b@dds.nl>
	<1009262601.20160429104420@marki-online.net>
	<5723322A.3060702@assyoma.it>
	<ba7cee20dbf40157dcff5746cbef9158@dds.nl>
	<c7c656a28e0598e1632641ade569f692@dds.nl>
	<CALm7yL2T1Hg3A8nPz41eS1yOs7Ge6LHr1F7zAXQuXPea+OWWuQ@mail.gmail.com>
Message-ID: <10c7fd44df46954d3f555b87a553ba5f@dds.nl>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Mark Mielke schreef op 30-04-2016 6:46:

> Lots of interesting ideas in this thread.

Thank you for your sane response.

> There was some discussion about how data is presented to the higher
> layers. I didn't follow the suggestion exactly (communicating layout
> information?), but I did have these thoughts:
> 
> 	* When the storage runs out, it clearly communicates layout
> information to the caller in the form of a boolean "does it work or
> not?"
> 	* There are other ways that information does get communicated, such
> as if a device becomes read only. For example, an iSCSI LUN.
> 
> I didn't follow communication of specific layout information as this
> didn't really make sense to me when it comes to dynamic allocation.
> But, if the intent is to provide early warning of the likelihood of
> failure, compared to waiting to the very last minute where it has
> already failed, it seems like early warning would be useful. I did
> have a question about the performance of this type of communication,
> however, as I wouldn't want the host to be constantly polling the
> storage to recalculate the up-to-date storage space available.

Zdenec alluded to the idea and fact that this continuous polling would 
either be required or deeply ungrateful to the hardware. In the sense of 
being hugely expensive. Of course I do not know everything about a 
system before I start thinking. If I have an idea it is usually possible 
to implement it but I only find out later down the road if this is 
actually so and if it needs amending. I could not progress with life if 
every idea needed to be 100% sure before I could commence with it, 
because in that sense the commencing and the learning would never 
happen.

I didn't know thin (or LVM) doesn't maintain maps of used blocks.

Of course for regular LVM it makes no sense if the usage of the blocks 
you have allocated to a system is none of your concern at all.

The recent DISCARD improvements apparently just signal some special case 
(?) but SSDs DO maintain maps or it wouldn't even work (?).

I don't know, it would seem that having a map of used extents in a thin 
pool is in some way deeply important in being able to allocate unused 
ones?

I would have to dig into it of course but I am sure I would be able to 
find some information (and not lies ;-))).

I guess continuous polling would be deeply disrespectful of the hardware 
and software resources.

In the theoretical system I proposed it would be a constant 
communication between systems bogging down resources. But we must agree 
we are typically talking about 4MB blocks here (and mutations to them). 
In a sense you could easily increase that to 16MB, or 32MB, or whatever.

You could even update a filesystem when mutations of a thousand 
gigabytes have happened.

We are talking about a map of regions and these regions can be as large 
as you want.

It would say to a filesystem: these regions are currently unavailable.

You would even get more flags:

- this region is entirely unavailable
- this region is now more expensive to allocate to
- this region is the preferred place

When you allocate memory in the kernel (like with kmalloc) you specify 
what kind of requirements you have.

This is more of the same kind, I guess.

Typically a thin system is a system of extent allocation, the way we 
have it.

It is the thin volume that allocates this space, but the filesystem that 
causes it.

The thin volume would be able to say "don't use these parts".

Or "all parts are equal, but don't use more than X currently".

Actually the latter is a false statement, you need real information.

I know in ext filesystems the inodes are scattered everywhere (and the 
tables) so the blocks are already getting used, in that sense. And if 
you had very large blocks that you would want to make totally 
unavailable, you would get weird issues. "That's funny, I'm already 
using it".

So in order to make sense they would have to be contiguous regions (in 
the virtual space) that are really not used yet.

I don't know, it seems fun to make something like that. Maybe I'll do it 
some day.
