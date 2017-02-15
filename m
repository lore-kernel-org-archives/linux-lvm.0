Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1F9Ptas001179
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 15 Feb 2017 04:25:55 -0500
Received: from smtp1.dds.nl (smtp1.dds.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C613C089A76
	for <linux-lvm@redhat.com>; Wed, 15 Feb 2017 09:25:52 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id A55905B373
	for <linux-lvm@redhat.com>; Wed, 15 Feb 2017 10:25:49 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 15 Feb 2017 10:25:49 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <3008DC9C-0686-4582-9A58-0BD1B5F7ACC2@jabberwocky.com>
References: <3008DC9C-0686-4582-9A58-0BD1B5F7ACC2@jabberwocky.com>
Message-ID: <d68a645053cce37de967e4c1652fa404@dds.nl>
Subject: Re: [linux-lvm] LVM thin pool advice
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

David Shaw schreef op 15-02-2017 1:33:

> Is there some way to cap the amount of data that the snapshot can
> allocate from the pool?  Also, is there some way to allocate enough
> metadata space that it can't run out?  By way of analogy, using the
> old snapshot system, if the COW is sufficiently large (larger than the
> volume being snapshotted), it cannot overflow because even if every
> block of the original volume is dirtied, the COW can handle all of it.
>  Is there some similar way to size the metadata space of a thin pool
> such that overflow is "impossible"?

Personally I do not know the current state of affairs but the response 
I've often got here is that there is no such mechanic and it is up to 
the administrator to find out.

Maybe this is a bit ghastly to say it like this, my apologies.

I would very much like to be called wrong here.

The problem is although the LVM monitor (I think) does respond, or can 
be configured to respond to a "thin pool fillup" it does so as a kind of 
daemon, a watch-dog, but it is not an in-system guard.

Typically what I've found in the past is that a fill-up will just hang 
your system.

So I am probably very wrong about some things so I would rather let the 
developers answer.

But as you've found it, the snapshot for a thin volume is always 
allocated with the same size as the origin volume. That means unless you 
have double the space available, your system can crash.

I have personally once ventured -- but I am just some by-stander right 
-- that a proper solution would have to involve inter-layer 
communication between filesystems and block devices, but that is even 
outside of the problem here. The problem as far as I can see it is that 
there is very unexpected behaviour when the thin pool fills up.

Zdenek once pointed out that the allocator does not have a full map of 
what is available. For efficiency reasons, it goes "in search" of the 
next block to allocate. (Next extent).

It does so in response to a filesystem read or write (a write, 
supposedly). The filesystem knows of no limits in the thin pool and 
expects sufficient behaviour. The block layer (in this case LVM) can 
respond with failure or success but I do not know how it is handled or 
what results it produces when the thin pool is full and no new blocks 
can be allocated.

However I expect your system to freeze when the snapshot allocates more 
space than is available. I think the designated behaviour is for the 
snapshot to be dropped but I doubt this happens?

After all the snapsnot might be mounted, etc?...

It seems to me the first thing to do is to create safety margins, but 
then... I do not develop this thing right now :p.

I think what is required is advance-allocation where each (individual) 
volume allocates a pre-defined number of blocks in advance. Then, any 
out of space message from the thin volume manager would implicate the 
pre-allocation and not the actual allocation for the filesystem.

You create a bit of a buffer. In time. Once the individual pool 
allocator knows the thin pool is having problems, but it still has 
extents available to itself that it pre-allocated, it can already start 
informing the filesystem -- ideally -- that there is mayhem to be 
coming.

But also it means that a snapshot could recognise problems ahead of time 
and be told that it needs to start failing if a certain minimum of free 
space is not to be found.

But also, all of this requires that the central thin volume manager 
knows ahead of time, or in any case, at any single moment, how many 
extents are available. If this is concurrently done and there are many 
such allocators operating, all of them would need to operate on 
synchronized numbers of available space. Particularly when space is 
running out I feel there should be some sort of emergency mode where 
restrictions start to apply.

It is just unacceptable to me that the system will crash when space runs 
out. In case of a depleted thin pool, any snapshot should really be 
discarded by default I feel. Otherwise the entire thin pool should be 
readily frozen. But why the system should crash on this is beyond me.

My apologies for this perhaps petulant message. I just think it should 
not be understated how important it is that a system does not crash,

and I just was indicating that in the past the message has often been 
that it is _your_ job to create safety.

But this is slightly impossible. This would indicate... well whatever.

The failure case of a filled-up thin pool should not be relegated to the 
shadows.

I hope to be made wrong here and good luck with your endeavour.  I would 
suggest that a thin pool is very sexy ;-). But thus far there are no 
safeguards.


Please be advised that I do not know if such limits currently exist that 
you ask of. I have just been told here that the thin snapshot is of 
equal size to origin volume and there is nothing you can do about it?

Regards.
