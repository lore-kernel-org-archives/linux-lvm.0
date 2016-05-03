Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43Hg8dE005962
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 May 2016 13:42:09 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ABD1037E64
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 17:42:05 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id C64447F6AE
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 19:42:03 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 03 May 2016 19:42:03 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <1093625508.5537728.1462283037119.JavaMail.yahoo@mail.yahoo.com>
References: <1093625508.5537728.1462283037119.JavaMail.yahoo.ref@mail.yahoo.com>
	<1093625508.5537728.1462283037119.JavaMail.yahoo@mail.yahoo.com>
Message-ID: <f15cb308d82a5ae05413aaa2968cd1ae@dds.nl>
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

matthew patton schreef op 03-05-2016 15:43:

> Xen wrote:
> 
>> I didn't know thin (or LVM) doesn't maintain maps of used blocks.
> 
> Right, so you're ignorant of basics like how the various subsystems
> work. Like I said, go find a text on OS and filesystem design. Hell,
> read the EXT and LVM code or even just the design docs.

Why don't you do it for me and then report back? I could use a slave 
like you are trying to make me.

>> The recent DISCARD improvements apparently just signal some special 
>> case
>> (?) but SSDs DO maintain maps or it wouldn't even work (?).
> 
> Again, read up on the inner workings of SSDs. To over-simplify, SSDs
> have their own "LVM". No different really than a hardware RAID
> controller does - admittedly most raid controllers don't do anything
> particularly advanced.

It almost seems like you want me to succeed.

> clearly you are in need of much more studying. LVM knows exactly out
> of all of it's defined extents which ones are free and which ones have
> been assigned to an LV - aka written to. What individual blocks (aka
> range of bytes) inside those extents have FS-managed data in them it
> knows not nor does it care.

Then what is the issue here? That means my assumptions were all entirely 
correct and that Zdenek has said must have been false.

But what you are saying now is extent assignments to LVs, do you imply 
this is also true of assignment to thin volumes?

Yes, when you say "written to" you clearly mean thin pools.

I never alluded that it needed to know or care about the actual usage of 
its blocks (extents).

If a filesystem DISCARDs blocks, then with enough blocks it could 
discard an extent.

I don't even know what will happen if a filesystem stops using the data 
that's on it, but I will test that now. And of course it should just 
free those blocks. It didn't work with mkswap just now, but creating a 
new filesystem causes lvs to report a lower thin pool usage.

Of course, common and commonsensical. So these extents are being 
librated right? And it knows exactly how many are in use?

Then what was this about:

> Thin pool is not constructing  'free-maps'  for each LV all the time - 
> that's why tools like 'thin_ls'  are meant to be used from the 
> user-space.
> It IS very EXPENSIVE operation.

It is saying that e.g. lvs creates this free-map.

But LVM needs to know at every moment in time what extents are 
available. It also needs to runtime liberate them.

So it needs to be able to at least search for free ones and if none is 
found, to report that or do something with it. Of course that is 
different from having a map.

But in-the-moment update operations to filesystems would not require a 
map. They would require mutations being communicated. Mutations that LVM 
already knows about.

So it is nothing special. You don't need those "maps". You need to 
communicate (to other thin volumes) which extents have become 
unavailable. And which have become available once more.

Then the thin volume translates this (possibly) to whatever block system 
the underlying filesystem uses.

Logical blocks, physical blocks.

The main organisation principle is the extent. It is not the LVM that 
needs to maintain a map. It is the filesystem.

It needs to know about its potential for further allocation of the block 
space.




>> I guess continuous polling would be deeply disrespectful of the 
>> hardware
>> and software resources.
> 
> Not to mention instantaneously invalid. So you poll LVM, "what is your
> allocation map and do you have any free extents?" You get the results.
> Then the FS having been assured there is free space issues writes. But
> oh no, in the round-trip some other LV has grabbed the extent you had
> intended to use! IO=FAIL.

You know those contentions issues are everywhere and in the kernel also 
and they are always taken care of.

Don't confront me with a situation that has already been solved by 
numerous other people.

You forget, for once, that real software systems running on the 
filesystem would be aware of the lack of space to begin with. You are 
now approaching a corner case where the last free extent is being 
contended for. I am sure there would be an elegant solution to that.

This corner case is not what it's all about. What it's about is that the 
filesystem has the means to predict what is going to happen, or at least 
the software running on it.

If the situation you are describing is really an issue, you could simply 
reserve a last block (extent) for this scenario that is only written to 
if all other blocks are taken, and each filesystem (volume) has this 
free block of its own.

PROBLEM SOLVED.

You sound like Einstein when he tried to disprove Bohr's theory at that 
convention. In the end Bohr refuted everything and he (Einstein) had to 
accept he was right.

A filesystem will simply reserve the equivalent of an extent. More 
importantly, the thin volume (logical volume) will. The thin LV will 
reserve one last extent in advance from the thin pool that is only 
really given to the filesystem under conditions that the entire thin 
pool is already taken now and the filesystem is still issueing a write 
to a new block because of a race condition that prevented it from 
knowing about the space issue.

These are not difficult engineering problems.


> The ONLY way for a FS to "reserve" a set of blocks (aka extent) to
> itself is to write to it - but mind the FS has NO IDEA if needs to do
> an reservation in the first place nor if this IO just so happens to
> fit inside the allocated range but the next IO at offset +1 will
> require a new extent to be allocated from the THINP.

If you write to a full extent, you are guaranteed to get a new one. It's 
not more difficult than that. Don't make everything so difficult.

I have not talked about reservations myself (prior to this). As we just 
said, if it is only about the very last block of the entire thin pool? 
Reserve it in advance and don't let the FS do it?

If the race condition is such that larger amounts are needed for safety, 
do it? Reserve 200MB in advance if you need it?

You could configure a thin pool / volume to reserve a certain amount of 
free space that is only going to be used if the thin pool is 100% filled 
and it wasn't possible to inform the file systems fast enough.

Proportional to the size of the volume (LV). Who cares if you reserve 1% 
in each volume for this. Or less. A 2TB volume with 1GB of reserved 
space is not so bad, is it?

That's just 0.05% give or take.

If then free space is reported to the filesystem, it can:

1) simply inform programs by way of its normal operation
2) stop writing when the space known to it is gone
3) not have to worry about anything else because race conditions are 
taken care of.

In the event that a filesystem starts randomly writing a single byte to 
every possible block in order to defeat this system.

The filesystem can redirect these writes to other blocks when the LVM 
starts reporting no block for you and the filesystem still has space in 
the blocks it has.

It will just have to invalidate some of its own blocks (extents). IT 
needs to maintain a map, not LVM.

It can deduce its own free space from its own map.

It would be like allocating a thin (sparse) file but then writing to 
every possible address of it along the range. Yes the system is going to 
bug but you can take care of it. Some writes will just fail when out of 
blocks, but the filesystem can redirect it, or in the end just fail 
writing / allocating.

Any block being invalidated would instantly update its free space 
calculations.

You don't need to communicate full maps unless you were creating a new 
filesystem or trying to recover from corruption. You would query "is 
this block available" for instance. That would require a new command. It 
would take a while but that way the filesystem could reconstruct the 
blockmap.

Or it could query about ranges of blocks.

This querying is the first thing you'd introduce. Blocks N to M, are 
they available? Yes or not. Or a list of the ones that are and the ones 
that aren't (a bitmap).

To query 2000 extents you only need 2000 bits. That's 250 bytes, not a 
whole lot. A 2 TB volume would have a free map of 64k bytes.
Do you imagine how small this is?

How would maintaining free maps be an expensive operation, really?

You need a fucking 64k field with a xor operation. That fits inside a 
16-bit 8086 segment.

I mean don't bullshit me here. There is no way it could be hard to 
maintain free maps.

I'm a programmer too, you know. And I have been doing it since 1989 too.

I have programmed in pascal and assembler and I have studied Java's 
BitMap class for instance. It can be done very elegantly.

Any free map the thin LV would conjure up would be a lie in that sense, 
a choice. Because you would arbitrarily invalidate blocks at the end of 
the space.

At the end of the virtual space.

The pool communicates to the volume the acquisition and release of new 
and old extents.

The volume at that point doesn't care which they are. It only needs to 
know the number.

With every mutation it randomly invalidates a single block if it needs 
to (or enables it again).

It sets a bit flag in a 64k field. So let's assume we have a 1PB volume. 
A petabyte. That's 2^50 / 2^20 / 4 number of extents, is 2^28 bits is 
2^25 bytes. Is 2^5 megabytes is 32MB worth of data.

For a volume with 1125899906842624 bytes. Just needs 33554432 bytes to 
maintain a map, if done in 4MB extents.

If done in 4KB blocks the extent communication remains the same but it 
could amount to 1024x that number of bytes needed, is 32GB for a PB 
volume.

Is still 1/32678 of its available address space, so to speak.

But the filesystem could maintain maps of extents and not individual 
'blocks'.

Maybe 32GB is hard to communicate, but 32MB is not. And there are 
systems that have a terabyte of ram.



> I haven't checked, but it's perfectly possible for LVM THINP to
> respond to FS issued DISCARD notices and thus build an allocation map
> of an extent. And should an extent be fully empty to return the extent
> to the thin pool.

I don't know how it is done currently, because clearly the system knows, 
right?

As you say this is perfeclty possible.


> Only to have to allocate a new extent if any IO hits
> the same block range in the future. This kind of extent churn is
> probably not very useful unless your workload is in the habit of
> writing tons of data, freeing it and waiting a reasonable amount of
> time and potentially doing it again. SSDs resort to it because they
> must - it's the nature of the silicon device itself.

Unused blocks need to be made available anyway. A filesystem on which 
80% of data is deleted, and still using all those blocks in the thin 
pool? Please tell me this isn't reality (I know it isn't).


So I make this test right I am just curious what will happen:

1. Create thin pool on other hard disk 400M
2. Create 3 thin volumes totalling 600M
3. Create filesystems (ext3) and mount them.
4. Copy 90MB file to them. After 4 files 360MB of pool is used.
5. Copy 5th file. Nothing happens. No errors, nothing.
6. Copy 6th file. Nothing happens. No errors, nothing.

7. I check volumes. Nothing seems the matter. Lvdisplay no unusual.

df works and appears as though everything is normal. All volumes now 97% 
filled and pool 100% filled.

Can't last right. I see kernel block device page errors come by.

I go to one of the files that should have been successfully written (the 
4th file). I try to copy it to my main disk.

cp hangs. Terminal (tty) switching still works. Vim (I had vim open in 2 
ttys or 3) stops responding. Alt-7 (should open KDE) nothing happens. 
Cannot switch back, ie. cannot switch TTYs anymore. System hangs 
completely.

Mind you this was on a harddisk with no used volumes. No other volumes 
were mounted other than those 3 although of course they were loaded in 
LVM.

There are no dropped volumes. There are no frozen volumes. The system 
just crashes. Very graceful I must say.

I mean if this is the best you can do?

No wonder you are suggesting every admin needs to hire a drill 
instructor to get him through the day.







>> It would say to a filesystem: these regions are currently unavailable.
>> 
>> You would even get more flags:
>> 
>> - this region is entirely unavailable
>> - this region is now more expensive to allocate to
>> - this region is the preferred place
> 
> All of this "inside knowledge" and "coordination" you so desperately
> seem to want is called integration. And again spelled BTRFS and ZFS.
> et. al.

BTRFS is spelled "monopoly" and "wants to be all" and "I'm friends with 
SystemD" ;-).

ZFS I don't know, I haven't cared about it. All I see on IRC is people 
talking about it like some new toy they desperately can't live without 
even though it doesn't serve them any real purpose.

A bit like a toy drone worth 4k dollars.

The only thing that changes is that filesystems maintain bitmaps of 
available sectors/blocks or of extents, and are capable of intelligently 
allocating to the ones they have and that are available.

That's it!

You can still choose what filesystem to use. You could even choose what 
volume manager to use.

We have seen how little data it costs if the extent size is at least 
4MB.
We have seen how easy it would be to query again with the underlying 
layer in case you're not sure.

If you want a block to have more bits, easy too! If you have only 4 
possible states, you can put it in 2 bits.

That would probably be enough for any probably use case. A 2TB volume 
costs 128k bytes for this bitmap with 4 states. That's something you can 
achieve on a 286 if you are crazy enough.



> yeah, have fun with that theoretical system.

Why won't you?


> Xen, dude seriously. Go do a LOT more reading.

I am being called by name :O! I think she likes me.
