Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1131961342
	for <linux-lvm@redhat.com>; Sat, 16 Sep 2017 22:33:31 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1129C04D28B
	for <linux-lvm@redhat.com>; Sat, 16 Sep 2017 22:33:25 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp1.signet.nl (Postfix) with ESMTP id 2CD3610820
	for <linux-lvm@redhat.com>; Sun, 17 Sep 2017 00:33:24 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sun, 17 Sep 2017 00:33:23 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <58f99204-d978-3f6a-9db8-b7122b30575e@redhat.com>
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
	<2d1025d7784ab44cbc03cfe7f6778599@xenhideout.nl>
	<58f99204-d978-3f6a-9db8-b7122b30575e@redhat.com>
Message-ID: <458d105938796d90f4e426bc458e8cc4@xenhideout.nl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Zdenek Kabelac schreef op 15-09-2017 11:22:

> lvm2 makes them look the same - but underneath it's very different
> (and it's not just by age - but also for targeting different purpose).
> 
> - old-snaps are good for short-time small snapshots - when there is
> estimation for having low number of changes and it's not a big issue
> if snapshot is 'lost'.
> 
> - thin-snaps are ideal for long-time living objects with possibility
> to take snaps of snaps of snaps and you are guaranteed the snapshot
> will not 'just dissapear' while you modify your origin volume...
> 
> Both have very different resources requirements and performance...

Point being that short-time small snapshots are also perfectly served by 
thin...

So I don't really think there are many instances where "old" trumps 
"thin".

Except, of course, if the added constraint is a plus (knowing in advance 
how much it is going to cost).

But that's the only thing: predictability.

I use my regular and thin snapshots for the same purpose. Of course you 
can do more with Thin.

> That are cases where it's quite valid option to take  old-snap of
> thinLV and it will payoff...
> 
> Even exactly in the case you use thin and you want to make sure your
> temporary snapshot will not 'eat' all your thin-pool space and you
> want to let snapshot die.

Right.

That sounds pretty sweet actually. But it will be a lot slower right.

I currently just make new snapshots each day. They live for an entire 
day. If the system wants to make a backup of the snapshot it has to do 
it within the day ;-).

My root volume is not on thin and thus has an "old-snap" snapshot. If 
the snapshot is dropped it is because of lots of upgrades but this is no 
biggy; next week the backup will succeed. Normally the root volume 
barely changes.

So it would be possible to reserve regular LVM space for thin volumes as 
well right, for snapshots, as you say below. But will this not slow down 
all writes considerably more than a thin snapshot?

So while my snapshots are short-lived, they are always there.

The current snapshot is always of 0:00.

> Thin-pool still does not support shrinking - so if the thin-pool
> auto-grows to big size - there is not a way for lvm2 to reduce the
> thin-pool size...

Ah ;-). A detriment of auto-extend :p.

>> That's just the sort of thing that in the past I have been keeping 
>> track of continuously (in unrelated stuff) such that every mutation 
>> also updated the metadata without having to recalculate it...
> 
> Would you prefer to spend all you RAM to keep all the mapping
> information for all the volumes and put very complex code into kernel
> to parse the information which is technically already out-of-data in
> the moment you get the result ??

No if you only kept some statistics that would not amount to all the 
mapping data but only to a summary of it.

Say if you write a bot that plays a board game. While searching for 
moves the bot has to constantly perform moves on the board. It can 
either create new board instances out of every move, or just mutate the 
existing board and be a lot faster.

In mutating the board it will each time want the same information as 
before: how many pieces does the white player have, how many pieces the 
black player, and so on.

A lot of this information is easier to update than to recalculate, that 
is, the moves themselves can modify this summary information, rather 
than derive it again from the board positions.

This is what I mean by "updating the metadata without having to 
recalculate it".

You wouldn't have to keep the mapping information in RAM, just the 
amount of blocks attributed and so on. A single number. A few single 
numbers for each volume and each pool.

No more than maybe 32 bytes, I don't know.

It would probably need to be concurrently updated, but that's what it 
is.

You just maintain summary information that you do not recalculate, but 
just modify each time an action is performed.

>> But the purpose of what you're saying is that the number of uniquely 
>> owned blocks by any snapshot is not known at any one point in time.
> 
> As long as 'thinLV' (i.e. your snapshot thinLV) is NOT active - there
> is nothing in kernel maintaining its dataset.  You can have lots of
> thinLV active and lots of other inactive.

But if it's not active, can it still 'trace' another volume? Ie. it has 
to get updated if it is really a snapshot of something right.

If it doesn't get updated (and not written to) then it also does not 
allocate new extents.

So then it never needs to play a role in any mechanism needed to prevent 
allocation.

However volumes that see new allocation happening for them, would then 
always reside in kernel memory right.

You said somewhere else that overall data (for pool) IS available. But 
not for volumes themselves?

Ie. you don't have a figure on uniquely owned vs. shared blocks.

I get that it is not unambiguous to interpret these numbers.

Regardless with one volume as "master" I think a non-ambiguous 
interpretation arises?

So is or is not the number of uniquely owned/shared blocks known for 
each volume at any one point in time?

>> Well pardon me for digging this deeply. It just seemed so alien that 
>> this thing wouldn't be possible.
> 
> I'd say it's very smart ;)

You mean not keeping everything in memory.

> You can use only very small subset of 'metadata' information for
> individual volumes.

But I'm still talking about only summary information...


>> It becomes a rather big enterprise to install thinp for anyone!!!
> 
> It's enterprise level software ;)

Well I get that you WANT that ;-).

However with the appropriate amount of user friendliness what was first 
only for experts can be simply for more ordinary people ;-).

I mean, kuch kuch, if I want some SSD caching in Microsoft Windows, kuch 
kuch, I right click on a volume in Windows Explorer, select properties, 
select ReadyBoost tab, click "Reserve complete volume for ReadyBoost", 
click okay, and I'm done.

It literally takes some 10 seconds to configure SSD caching on such a 
machine.

Would probably take me some 2 hours in Linux not just to enter the 
commands but also to think about how to do it.

Provided I don't end up with the SSD kernel issues with IO queue 
bottlenecking I had before...

Which, I can tell you, took a multitude of those 2 hours with the 
conclusion that the small mSata SSD I had was just not suitable, much 
like some USB device.


For example, OpenVPN clients on Linux are by default not configured to 
automatically reconnect when there is some authentication issue (which 
could be anything, including a dead link I guess) and will thus simply 
quit at the smallest issue. It then needs the "auth-retry nointeract" 
directive to keep automatically reconnecting.

But on any Linux machine the command line version of OpenVPN is going to 
be probably used as an unattended client.

So it made no sense to have to "figure this out" on your own. An 
enterprise will be able to do so yes.

But why not make it easier...

And even if I were an enterprise, I would still want:

- ease of mind
- sane defaults
- if I make a mistake the earth doesn't explode
- If I forget to configure something it will have a good default
- System is self-contained and doesn't need N amount of monitoring 
systems before it starts working

> In most common scenarios - user knows when he runs out-of-space - it
> will not be 'pleasant' experience - but users data should be safe.

Yes again, apologies, but I was basing myself on Kernel 4.4 in Debian 8 
with LVM 2.02.111 which, by now, is three years old hahaha.

Hehe, this is my self-made reporting tool:

Subject: Snapshot linux/root-snap has been umounted

Snapshot linux/root-snap has been unmounted from /srv/root because it 
filled up to a 100%.

Log message:

Sep 16 22:37:58 debian lvm[16194]: Unmounting invalid snapshot 
linux-root--snap from /srv/root.

Earlier messages:

Sep 16 22:37:52 debian lvm[16194]: Snapshot linux-root--snap is now 97% 
full.
Sep 16 22:37:42 debian lvm[16194]: Snapshot linux-root--snap is now 93% 
full.
Sep 16 22:37:32 debian lvm[16194]: Snapshot linux-root--snap is now 86% 
full.
Sep 16 22:37:22 debian lvm[16194]: Snapshot linux-root--snap is now 82% 
full.

Now do we or do we not upgrade to Debian Stretch lol.

> And then it depends how much energy/time/money user wants to put into
> monitoring effort to minimize downtime.

Well yes but this is exacerbated by say this example of OpenVPN having 
bad defaults. If you can't figure out why your connection is not 
maintained now you need monitoring script to automatically restart it.

If something is hard to recover from, now you need monitoring script to 
warn you plenty ahead of time so you can prevent it, etc.

If the monitoring script can fail, now you need a monitoring script to 
monitor the monitoring script ;-).

System admins keep busy ;-).

> As has been said - disk-space is quite cheap.
> So if you monitor and insert your new disk-space in-time
> (enterprise...)  you have less set of problems - then if you try to
> fight constantly with 100% full thin-pool...

In that case it's more of a safety measure. But a bit pointless if you 
don't intend to keep growing your data collection.

Ie. you could keep an extra disk in your system for this purpose, but 
then you can't shrink the thing as you said once it gets used ;-).

That makes it rather pointless to have it as a safety net for a system 
that is not meant to expand ;-).


> You can always use normal device - it's really about the choice and 
> purpose...

Well the point is that I never liked BTRFS.

BTRFS has its own set of complexities and people running around and 
tumbling over each other in figuring out how to use the darn thing. 
Particularly with regards to the how-to of using subvolumes, of which 
there seem to be many different strategies.

And then Red Hat officially deprecates it for the next release. Hmmmmm.

So ZFS has very linux-unlike command set.

Its own universe.

LVM in general is reasonably customer-friendly or user-friendly. 
Configuring cache volumes etc. is not that easy but also not that 
complicated. Configuring RAID is not very hard compared to mdadm 
although it remains a bit annoying to have to remember pretty explicit 
commands to manage it.

But rebuilding e.g. RAID 1 sets is pretty easy and automatic.

Sometimes there is annoying stuff like not being able to change a volume 
group (name) when a PV is missing, but if you remove the PV how do you 
put it back in? And maybe you don't want to... well whatever.

I guess certain things are difficult enough that you would really want a 
book about it, and having to figure it out is fun the first time but 
after that a chore.

So I am interested in developing "the future" of computing you could 
call it.

I believe that using multiple volumes is "more natural" than a single 
big partition.

But traditionally the "single big partition" is the only way to get a 
flexible arrangement of free space.

So when you move towards multiple (logical) volumes, you lose that 
flexibility that you had before.

The only way to solve that is by making those volumes somewhat virtual.

And to have them draw space from the same big pool.

So you end up with thin provisioning. That's all there is to it.

>> While personally I also like the bigger versus smaller idea because 
>> you don't have to configure it.
> 
> I'm still proposing to use different pools for different purposes...

You mean use a different pool for that one critical volume that can't 
run out of space.


This goes against the idea of thin in the first place. Now you have to 
give up the flexibility that you seek or sought in order to get some 
safety because you cannot define any constraints within the existing 
system without separating physically.

> Sometimes spreading the solution across existing logic is way easier,
> then trying to achieve some super-inteligent universal one...

I get that... building a wall between two houses is easier than having 
to learn to live together.

But in the end the walls may also kill you ;-).

Now you can't share washing machine, you can't share vacuum cleaner, you 
have to have your own copy of everything, including bath rooms, toilet, 
etc.

Even though 90% of the time these things go unused.

So resource sharing is severely limited by walls.

Total cost of services goes up.


>> But didn't you just say you needed to process up to 16GiB to know this 
>> information?
> 
> Of course thin-pool has to be aware how much free space it has.
> And this you can somehow imagine as 'hidden' volume with FREE space...
> 
> So to give you this 'info' about  free blocks in pool - you maintain
> very small metadata subset - you don't need to know about all other
> volumes...

Right, just a list of blocks that are free.

> If other volume is releasing or allocation chunks - your 'FREE space'
> gets updated....

That's what I meant by mutating the data (summary).

> It's complex underneath and locking is very performance sensitive -
> but for easy understanding you can possibly get the picture out of
> this...

I understand, but does this mean that the NUMBER of free blocks is also 
always known?

So isn't the NUMBER of used/shared blocks in each DATA volume also 
known?

>> You may not know the size and attribution of each device but you do 
>> know the overall size and availability?
> 
> Kernel support 1 setting for threshold - where the user-space
> (dmeventd) is waked-up when usage has passed it.
> 
> The mapping of value is lvm.conf autoextend threshold.
> 
> As a 'secondary' source - dmeventd checks every 10 second pool
> fullness with single ioctl() call and compares how the fullness has
> changed and provides you with callbacks for those  50,55...  jumps
> (as can be found in  'man dmeventd')
> 
> So for autoextend theshold passing you get instant call.
> For all others there is up-to 10 second delay for discovery.

But that's about the 'free space'.

What about the 'used space'. Could you, potentially, theoretically, set 
a threshold for that? Or poll for that?

I mean the used space of each volume.

>> But you could make them unequal ;-).
> 
> I cannot ;)  - I'm lvm2 coder -   dm thin-pool is Joe's/Mike's toy :)
> 
> In general - you can come with many different kernel modules which
> take different approach to the problem.
> 
> Worth to note -  RH has now Permabit  in its porfolio - so there can
> more then one type of thin-provisioning supported in lvm2...
> 
> Permabit solution has deduplication, compression, 4K blocks - but no
> snapshots....

Hmm, sounds too 'enterprise' for me ;-).

In principle it comes down to the same thing... one big pool of storage 
and many views onto it.

Deduplication is natural part of that...

Also for backup purposes mostly.

You can have 100 TB worth of backups only using 5 TB.

Without having to primitively hardlink everything.

And maintaining complete trees of every backup open on your 
filesystem.... no usage of archive formats...

If the system can hardlink blocks instead of files, that is very 
interesting.

Of course snapshots (thin) are also views onto the dataset.

That's the point of sharing.

But sometimes you live in the same house and you want a little room for 
yourself ;-).

But in any case...

Of course if you can only change lvm2, maybe nothing of what I said was 
ever possible.

But I thought you also spoke of possibilities including the possibility 
of changing the device mapper, saying it is impossible what I want :p.

IF you could change the device mapper, THEN could it be possible to 
reserve allocation space for a single volume???

All you have to do is lie to the other volumes when they want to know 
how much space is available ;-).

Or something of the kind.

Logically there are only two conditions:

- virtual free space for critical volume is smaller than its reserved 
space
- virtual free space for critical volume is bigger than its reserved 
space

If bigger, then all the reserved space is necessary to stay free
If smaller, then we don't need as much.

But it probably also doesn't hurt.

So 40GB virtual volume has 5GB free but reserved space is 10GB.

Now real reserved space also becomes 5GB.

So for this system to work you need only very limited data points:

- unallocated extents of virtual 'critical' volumes (1 number for each 
'critical' volume)
- total amount of free extents in pool

And you're done.

+ the reserved space for each 'critical volume'.

So say you have 2 critical volumes:

virtual size      reserved space
     10GB                500MB
     40GB                 10GB

Total reserved space is 10.5GB

If second one has allocated 35GB, only could possibly need 5GB more, so 
figure changes to

   5.5GB reserved space

Now other volumes can't touch that space, when the available free space 
in entire pool becomes <= 5.5GB, allocation fails for non-critical 
volumes.

It really requires very limited information.

- free extents for all critical volumes (unallocated as per the virtual 
size)
- total amount free extents in pool
- max space reservation for each critical volume

And you're done. You now have a working system. This is the only 
information the allocator needs to employ this strategy.

No full maps required.

If you have 2 critical volumes, this is a total of 5 numbers.

This is 40 bytes of data@most.


>> The goal was more to protect the other volumes, supposing that log 
>> writing happened on another one, for that other log volume not to 
>> impact the other main volumes.
> 
> IMHO best protection is different pool for different thins...
> You can more easily decide which pool can 'grow-up'
> and which one should rather be taken offline.

Yeah yeah.

But that is like avoiding the problem, so there doesn't need to be a 
solution.

> Motto: keep it simple ;)

The entire idea of thin provisioning is to not keep it simple ;-).

Same goes for LVM.

Otherwise we'd be still using physical partitions.


>> So you have thin global reservation of say 10GB.
>> 
>> Your log volume is overprovisioned and starts eating up the 20GB you 
>> have available and then runs into the condition that only 10GB 
>> remains.
>> 
>> The 10GB is a reservation maybe for your root volume. The system 
>> (scripts) (or whatever) recognises that less than 10GB remains, that 
>> you have claimed it for the root volume, and that the log volume is 
>> intruding upon that.
>> 
>> It then decides to freeze the log volume.
> 
> Of course you can play with 'fsfreeze' and other things - but all
> these things are very special to individual users with their
> individual preferences.
> 
> Effectively if you freeze your 'data' LV - as a reaction you may
> paralyze the rest of your system - unless you know the 'extra'
> information about the user use-pattern.

Many things only work if the user follows a certain model of behaviour.

The whole idea of having a "critical" versus a "non-critical" volume is 
that you are going to separate the dependencies such that a failure of 
the "non-critical" volume will not be "critical" ;-).

So the words themselves predict that anyone employing this strategy will 
ensure that the non-critical volumes are not critically depended upon 
;-).

> But do not take this as something to discourage you to try it - you
> may come with perfect solution for your particular system  - and some
> other user may find it useful in some similar pattern...
> 
> It's just something that lvm2 can't give support globally.

I think the model is clean enough that you can provide at least a 
skeleton script for it...

But that was already suggested you know, so...


If people want different intervention than "fsfreeze" that is perfectly 
fine.

Most of the work goes into not deciding the intervention (that is 
usually simple) but in writing the logic.

(Where to store the values, etc.).

(Do you use LVM tags, how to use that, do we read some config file 
somewhere else, etc.).

Only reason to provide skeleton script with LVM is to lessen the burden 
on all those that would like to follow that separation of critical vs. 
non-critical.

The big vs. small idea is extension of that.

Of course you don't have to support it in that sense personally.

But logical separation of more critical vs. less critical of course 
would require you to also organize your services that way.

If you have e.g. three levels of critical services (A B C) and three 
levels of critical volumes (X Y Z) then:

A (most critical)   B (intermediate)   C (least critical)
         |               ___/|     _______/  ___/|
         |           ___/   _|____/      ___/    |
         |       ___/  ____/ |       ___/        |
         |   ___/_____/      |   ___/            |
         |  /                |  /                |
X (most critical)   Y (intermediate)   Z (least critical)

Service A can only use volume X
Service B can use both X and Y
Service C can use X Y and Z.

This is the logical separation you must make if "critical" is going to 
have any value.

> But lvm2 will give you enough bricks for writing 'smart' scripts...

I hope so.

It is just convenient if certain models are more mainstream or more easy 
to implement.

Instead of each person having to reinvent the wheel...

But anyway.

I am just saying that the simple thing Sir Jonathan offered would 
basically implement the above.

It's not very difficult, just a bit of level-based separation of orders 
of importance.

Of course the user (admin) is responsible for ensuring that programs 
actually agree with it.

>> So I don't think the problems of freezing are bigger than the problems 
>> of rebooting.
> 
> With 'reboot' you know where you are -  it's IMHO fair condition for 
> this.
> 
> With frozen FS and paralyzed system and your 'fsfreeze' operation of
> unimportant volumes actually has even eaten the space from thin-pool
> which may possibly been used better to store data for important
> volumes....

Fsfreeze would not eat more space than was already eaten.

A reboot doesn't change anything about that either.

If you don't freeze it (and neither reboot) the whole idea is that more 
space would be eaten than was already.

So not doing anything is not a solution (and without any measures in 
place like this, the pool would be full).

So we know why we want reserved space; it was already rapidly being 
depleted.

> and there is even big danger you will 'freeze' yourself already during
> call of fsfreeze  (unless you of course put BIG margins around)

Well I didn't say fsfreeze was the best high level solution anyone could 
ever think of.

But I think freezing a less important volume should ... according to the 
design principles laid out above... not undermine the rest of the 
'critical' system.

That's the whole idea right.

Again not suggesting everyone has to follow that paradigm.

But if you're gonna talk about critical vs. non-critical, the admin has 
to pursue that idea throughout the entire system.

If I freeze a volume only used by a webserver... I will only freeze the 
webserver... not anything else?


>> "System is still running but some applications may have crashed. You 
>> will need to unfreeze and restart in order to solve it, or reboot if 
>> necessary. But you can still log into SSH, so maybe you can do it 
>> remotely without a console ;-)".
> 
> Compare with  email:
> 
> Your system has run out-of-space, all actions to gain some more space
> has failed  - going to reboot into some 'recovery' mode

Actions to gain more space in this case only amounts to dropping 
snapshots, otherwise we are talking much more aggressive policy.

So now your system has rebooted and is in a recovery mode. Your system 
ran 3 different services. SSH/shell/email/domain etc, webserver and 
providing NFS mounts.

Very simple example right.

Your webserver had dedicated 'less critical' volume.

Some web application overflowed, user submitted lots of data, etc.

Web application volume is frozen.

(Or web server has been shut down, same thing here).

- Now you can still SSH, system still receives and sends email
- You can still access filesystems using NFS

Compare to recovery console:

- SSH doesn't work, you need Console
- email isn't received nor sent
- NFS is unavailable
- pings to domain don't work
- other containers go offline too
- entire system is basically offline.

Now for whatever reason you don't have time to solve the problem.

System is offline for a week. Emails are thrown away, not received, you 
can't ssh and do other tasks, you may be able to clean the mess but you 
can't put the server online (webserver) in case it happens again.

You need time to deal with it but in the meantime entire system was 
offline. You have to manually reboot and shut down web application.

But in our proposed solution, the script already did that for you.

So same outcome. Less intervention from you required.

Better to keep the system running partially than not at all?

SSH access is absolute premium in many cases.

>> So there is no issue with snapshots behaving differently. It's all the 
>> same and all committed data will be safe prior to the fillup and not 
>> change afterward.
> 
> Yes - snapshot is 'user-land' language  -  in kernel - all thins  maps 
> chunks...
> 
> If you can't map new chunk - things is going to stop - and start to
> error things out shortly...

I get it.

We're going to prevent them from mapping new chunks ;-).

Well.

:p.
