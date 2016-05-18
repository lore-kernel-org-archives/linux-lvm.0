Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4I1Z6ws017181
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 17 May 2016 21:35:07 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC5D261A0C
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 01:35:02 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id D9EB57F8D9
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 03:34:59 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 18 May 2016 03:34:59 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <11d1b01f-f4cc-fcb7-8e47-4f819abc3341@redhat.com>
References: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
	<5739B848.3060505@redhat.com> <119b520d472b019ced48357eff9fb389@dds.nl>
	<5739D494.2040103@redhat.com> <88ecf232d113c573e524088e67204c4f@dds.nl>
	<573AE7BD.3000008@redhat.com> <5751b613e8123d1c61ef8d08a5c01ea3@dds.nl>
	<57318838-1c71-f4e6-9869-a3f19df56a8b@redhat.com>
	<e3a1d746d1fc7279a7a9cd719cc3b4b4@dds.nl>
	<11d1b01f-f4cc-fcb7-8e47-4f819abc3341@redhat.com>
Message-ID: <394af6755186063c4dee35cdbfe39289@dds.nl>
Subject: Re: [linux-lvm] Unexptected filesytem unmount with thin provision
 and autoextend disabled - lvmetad crashed?
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

Zdenek Kabelac schreef op 18-05-2016 0:26:
> On 17.5.2016 22:43, Xen wrote:
>> Zdenek Kabelac schreef op 17-05-2016 21:18:
>> 
>> I don't know much about Grub, but I do know its lvm.c by heart now 
>> almost :p.
> 
> lvm.c by grub is mostly useless...

Then I feel we should take it out and not have grub capable of booting 
LVM volumes anymore at all, right.

>> One of the things I don't think people would disagree with would be 
>> having one
>> of either of:
>> 
>> - autoextend and waiting with writes so nothing fails
>> - no autoextend and making stuff read-only.
> 
> ATM user needs to write his own monitoring plugin tool to switch to
> read-only volumes - it's really as easy as running bash script in 
> loop.....

So you are saying every user of thin LVM must individually, that means 
if there are a 10.000 users, you now have 10.000 people needing to write 
the same thing, while first having to acquire the knowledge of how to do 
it.

I take it by that loop you mean a sleep loop. It might also be that 
logtail thing and then check for the dmeventd error messages in syslog. 
Right? And then when you find this message, you remount ro. You have to 
test a bit to make sure it works and then you are up and running. But 
this does imply that this thing is only available to die-hard users. You 
first have to be aware of what is going to happen. I tell you, there is 
really not a lot of good documentation on LVM okay. I know there is that 
LVM book. Let me get it....

First hit is CentOS. Second link is reddit. Third link is Redhat. Okay 
it should be "lvm guide" not "lvm book". Hasn't been updated since 2006 
and no advanced information other than how to compile and install....

I mean: http://tldp.org/HOWTO/LVM-HOWTO/. So what people are really 
going to know this stuff except the ones that are on this list?

Unless you experiment, you won't know what will happen to begin with. 
For instance, different topic, but it was impossible to find any real 
information on LVM cache.

So now you want every single admin to have the knowledge (that you 
obviously do have, but you are its writers and mainters, its gods and 
cohorts) to create a manual script, no matter how simple, that will 
check the syslog, that you can only really know about by checking the 
fucking source or running tests and then see what happens (and be smart 
enough to check syslog) -- and then of course to write either a service 
file for this script or put it in some form of rc.local.

Well that latter is easy enough even on my system (I was not even sure 
whether that existed here :p).

But knowing about this stuff doesn't come by itself. You know. This 
doesn't just fall from the sky.

I would probably be more than happy to write documentation at some point 
(because I guess I did go through all of that to learn, and maybe others 
shouldn't or won't have to?) but without this documentation, or this 
person leading the way, this is not easy stuff.

Also "info" still sucks on Linux, the only really available resource 
that is easy to use are man pages. It took me quite some time to learn 
about all the available lvm commands to begin with (without reading a 
encompassing manual) and imagine my horror when I was used to 
Debian/Ubuntu systems automatically activating the vg upon opening a 
LUKS container, but then the OpenSUSE rescue environment not doing that.

How to find out about vgchange -ay without having internet 
access.........

It was impossible.

So for me it has been a hard road to begin with and I am still learning.

In fact I *had* read about vgchange -ay but that was months prior and I 
had forgotten. Yes, bad sysadmin.

Every piece of effort a user can take on his own, is a piece of effort 
that can be prevented by a developer or even possibly a (documentation) 
writer if such a thing could exist. And I know I can't do it yet, if 
that is what you are asking or thinking.


> We call them 'Request For Enhancements' BZ....

You mean you have a non-special non-category that only distinguishes 
itself by having a [RFE] tag in the bug name, and that is your special 
feature? (laughs a bit).

I mean I'm not saying it has to be anything special and if you have a 
small system maybe that is enough.

But Bugzilla is just not an agreeable space to really inspire or invite 
positive feedback like that.... I mean I too have been using bugzillas 
for maybe a decade or longer. Not as a developer mostly, as a user. And 
the thing is just a cynical place. I mean, LOOK at Jira:

https://issues.apache.org/jira/browse/log4j2/?selectedTab=com.atlassian.jira.jira-projects-plugin:issues-panel

Just an example. A "bug" is just one out of many categories. They have 
issue types for Improvements, Brainstorming, New Feature, Question, 
Story, and Wish. It is so entirely inviting to do whatever you want to 
do. In BugZilla, a feature request is still just a bug. And in your 
RedHat system, you just have added some field called "doc type" that 
you've set to "enhancement" but that's it.

And a bug is a failure, it is a fault. The system is not meant for 
positive feedback, only negative feedback in that sense. The user 
experience of it is just vastly detrimental compared to that other 
thing....

Well I didn't really want to go into this, but since you invited it 
:pp....

But it is also meant for the coming thing. And I apologize.




>> First what I proposed would be for every thin volume to have a spare 
>> chunk.
>> But maybe that's irrelevant here.
> 
> Well the question was not asking for your 'technical' proposal, as you
> have no real idea how it works and your visions/estimations/guesses
> have no use at all (trust me - far deeper thinking was considered so
> don't even waste your time to write those sentences...)

Well you can drop the attitude you know. If you were doing so great, you 
would not be having a total lack of all useful documentation to begin 
with. You would not have a system that can freeze the entire system by 
default, because "policy" is apparently not well done.

You would not be having to debate how to make the system even a little 
bit safer, and excuse yourself every three lines by saying that it's the 
admin's job to monitor his system, not your job to make sure he doesn't 
need to do all that much, or your job to make sure the system is 
fail-safe to begin with.

I mean I understand that it is a work in progress. But then don't act 
like it is finished, or that it is perfect provided the administrator is 
perfect too.

If I'm trying to do anything here, it is to point out that the system is 
quite lacking by default. You say "policy, policy, policy" as though you 
are very tired. And maybe I'm a bit less so, I don't know. And I know it 
can be tiresome to have to make these... call them fine-tunements to 
make sure they work well by default on every system. Especially, I don't 
know. If it is a work in progress and not meant to be used by people not 
willing to invest as much as you have (so to speak).

And I'm not saying you are doing a bad job in developing this. I think 
LVM is one of the more sane systems existing in the Linux world today. I 
mean, I wouldn't be here if I didn't like it, or if I wasn't grateful 
for your work.

I think the commands themselves and their way of being used, is 
outstanding, they are intuitive, they are much better than many other 
systems out there (think mdadm). It takes hardly no pain to remember how 
to use e.g. lvcreate, or vgcreate, or whatever. It is intuitive, it is 
nice, sometimes you need a little lookup, and that is fast too. It is a 
bliss to use compared to other systems certainly. Many of the 
rudimentary things are possible, and the system is so nicely modular and 
layered that it is always obvious what you need to do at whatever point.


> Also forget you write a new FS - thinLV is block device so there is no
> such think like 'fs allocates' space on device - this space is meant
> to be there....

In this case, provided indeed none of that would happen (that we talked 
about earlier) the filesystem doesn't NEED to allocate anything, but it 
DOES know which part of the block space it already has in use and which 
parts it doesn't, and if it is aware of this, and if it is aware of the 
"real block size" of the underlying device provided it did do a form of 
allocation (as does LVM thin) then suddenly it doesn't NEED to know 
about this allocation other than to know that it is happening, and it 
only needs to know the alignment of the real blocks.

Of course that means some knowledge of the underlying the device, but as 
has been said earlier (by that other guy that supported it) this 
knowledge is already there at some level and it would not be that weird.

Yes it is that "integration" you so despise.

You are *already* integrating e.g. extfs to more closely honour the 
extent boundaries so that it is more efficient. What I am saying is not 
at all out of the ordinary with that. You could not optimize if the 
filesystem did not know about alignment, and if it could not "direct" 
'allocation' into those aligned areas. So the filesystem already knows 
what is going to happen down beneath, and it has the knowledge to choose 
not to write to new areas unless it has to. You *told* me so.

That means it can also choose not to write to any NEW "aligned" blocks.

So you are just being principial here. You attack the idea based on the 
fact that "there is no real allocation taking place of the block device 
by the filesystem". But if you drop the word, there is no reason to 
disagree with what I said.

The filesystem KNOWS allocation is getting done (or it could know) and 
if it knows about the block alignment of those extents, then it does not 
NEED to have intimate knowledge of the ACTUAL allocation getting done by 
the thin volume in the thin pool.

So what are you really disagreeing with here? You are just being 
pedantic right? You could tell the filesystem to enter 
no-allocation-mode or no-write-to-new-areas-mode (same thing here) or 
"no-cause-allocation-mode" (same thing here).

And it would work.

Even if you disagree with the term, it would still work. At least, as 
far as we go here.

You never said it wouldn't work. You just disagreed with my use of 
wording.



> Rather think in terms:
> 
> You have 2 thinLVs.
> 
> Origin + snapshot.
> 
> You write to origin - and you miss to write a block.
> 
> Such block may be located in  'fs' journal, it might be a 'data' block,
> or fs metadata block.
> 
> Each case may have different consequences.

But that is for the filesystem to decide. The thin volume will not know 
about the filesystem. In that sense. Layers, remember?


> When you fail to write an ordinary (non-thin) block device  - this
> block is then usually 'unreadable/error' - but in thinLV case - upon
> read you get previous 100% valid' content - so you may start to
> imagine where it's all heading.

So you mean that "unreadable/error" signifies some form of "bad sector" 
error. But if you fail to write to thinLV, doesn't that mean (in our 
case there) that the block was not allocated by thinLV? That means you 
cannot read from it either. Maybe bad example, I don't know.


> Basically solving these troubles when pool is 'full' is 'too late'.
> If user wants something 'reliable'  - he needs to use different 
> thresholds -
> i.e. stopping at 90%....

Well I will try to look into it more when I have time. But I don't 
believe you. I don't see a reason from the outset why it should or would 
need to be so. There should be no reason a write fails unless an 
allocate fails. So how could you ever read from it (unless you read 
random or white data). And, provided the filesystem does try to read 
from it; why would it do so if its write failed before that?

Maybe that is what you alluded to before, but a filesystem should be 
able to solve that on its own without knowing those details I think. I 
believe quite usually inodes are written in advance? They are not 
growth-scenarios. So this metadata cannot fail to write due to a failed 
block level allocate. But even that should be irrelevant for thin LVM 
itself.....


> But other users might be 'happy' with missing block (failing write
> area) and rather continue to use 'fs'....

But now you are talking about human users. You are now talking about an 
individual that tries to write to a thin LV, it doesn't work because the 
thing is full, and he/she wants to continue to use the 'fs'. But that is 
what I proposed right. If you have a fail-safe system, if you have a 
system that keeps functioning even though it blocks growth writes, then 
you have the best of both worlds. You have both.

It is not either/or. What I was talking about is both. You have 
reliability and you can keep using the filesystem. The filesystem just 
needs to be able to cope with the condition that it cannot use any new 
blocks from the existing pool that it knows about. That is not extremely 
very different from having exhausted its block pool to begin with. It is 
really the same condition, except right now it is rather artificial.

You artificially tell the FS: you are out of space. Or, you may not use 
new (alignment) blocks. It is no different from having no free blocks at 
all. The FS could deal with it in the same way.


> 
> You have many things to consider - but if you make policies too 
> complex,
> users will not be able to use it.
> 
> Users are already confused with 'simple' lvm.conf options like
> 'issue_discards'....

I understand. But that is why you create reasonable defaults that work 
well together. I mean, I am not telling you you can't, or have done a 
bad job in the past, or are doing a bad job now.

But I'm talking mostly about defaults. And right now I was really only 
proposing this idea of a filesystem state that says "Me, the filesystem, 
will not allocate any new blocks for data that are in alignment with the 
underlying block device. I will not use any new (extents) from my block 
device even though normally they would be available to me. I have just 
been told there might be an issue, and even though I don't know why, I 
will just accept that and try not to write there anymore".

It is really the simplest idea there can be here. If you didn't have 
thin, and the filesystem was full, you'd have the same condition.

It is just a "stop expanding" flag.


> Personally, I feel the condition of a filesystem getting into a "cannot
>> allocate" state, is superior.
> 
> As said - there is no thin-volume filesystem.

Can you just cut that, you know. I know the filesystem does not 
allocate. But it does know, or can know, allocation will happen. It 
might be aware of the "thin" nature, and even if it didn't, it could 
still honour such a flag even if it wouldn't make sense for it.


>> However in this case it needs no other information. It is just a 
>> state. It
>> knows: my block devices has 4M blocks (for instance), I cannot get new 
>> ones
> 
> Your thinking is from 'msdos' era - single process, single user.
> 
> You have multiple thin volumes active, with multiple different users
> all running their jobs in parallel and you do not want to stop every
> user when you are recomputing space in pool.
> 
> There is really no much point in explaining further details unless you 
> are
> willing to spend your time understanding deeply surrounding details.

You are using details to escape the necessity that the overlying or 
encompassing framework dictates that things do currently not work.

That is like using the trees to say that there is no forest.

Or not seeing the forest for the trees. That is exactly what it means. I 
know I am a child here. But do not ignore the wisdom of a child. The 
child knows more than you do. Even if it has much less data than you do.

The whole reason a child *can* know more is because it has less data. 
Because of that, it can still see the outline, while you may no longer 
be able to, because you are deep within the forest.

That's exactly what that saying means.

If you see planet earth from space and you see that it is turning or 
maybe you can see its ice caps are melting. And then someone on earth 
says "No that is not happening because such and such is so". Who is 
right? The one with the overview, or the one with the details?

An outsider can often perceive directly what is the nature of something. 
Only at the outside, of course. But he/she can clearly see whether it is 
left or right, big or small, cold or hot. It may not know why it is 
being hot or cold, but it does know that it is being cold or hot. And 
the outsider may see there should be no reason why something cannot be 
so.

If details are in the way, change the details.

By the above, with "user" you seem to mean a real human user. But a 
filesystem queues requests, it does not have multiple users. It needs to 
schedule whatever it is doing, but it all has to go through the same 
channel, ending up on the same disk. So from this perspective, the only 
relevant users are the various filesystems. This must be so, because if 
two operating systems mount the same block device twice, you get mayhem. 
So the filesystem driver is the channel. Whether it is one multitasking 
process or multiple users doing the same thing, is irrelevant. Jobs, in 
this sense, are also irrelevant. What is relevant is writes to different 
parts, or reads from different parts.

But supposing those multiple users are multiple filesystems using the 
same thin pool. Okay you have a point, perhaps. And indeed I do not know 
about any delays in space calculations. I am just approaching this from 
the perspective of a designer. I would not design it such that the data 
on the amount of free extents, would at any one time be unavailable. It 
should be available to all at any one time. It is just a number. It does 
not or should not need recomputation. I am sorry if that is incorrect 
here. If it does need recomputation, then of course what you say makes 
sense (even to me) and that you need a time window to prepare for 
disaster; to anticipate.

I don't see why a value like the number of free extents in a pool would 
need recomputation though, but that is just me. Even if you had 
concurrent writes (allocations/expansions) you should be able to deal 
with that, people do that all the time.

The number of free extents is simply a given at any one time right? 
Unless freeing them is a more involved operation. I'm just trying to 
show you that there shouldn't need to be any problems here with this 
idea.

Allocations should be atomic and even if they are concurrent, the 
updating of this information shouldn't be concurrent. It is a single 
number, only one person can change it at a time. It's a single number, 
even if you wrote 10 million blocks concurrently, your system should be 
able to change/increment that number 10 million times in the same time.

Right? I know you will say wrong. But this seems out of the ordinarily 
strange to me.

I mean I am still wholly unaware of how concurrency works in the kernel 
(except that I know the terms) (because I've been reading some code) 
(such as RCU, refcount, spinlock, mutex, what else) but I doubt this 
would be a real issue if you did it right, but that's just me.

If you can concurrently traverse data structures and keep everything 
working in pristine order, you know, why shouldn't you be able to 
'concurrently' update a number.

Maybe that's stupid of me, but it just doesn't make sense to me.





>> That seems pretty trivial. The mechanic for it may not. It is 
>> preferable in my
>> view if the filesystem was notified about it and would not even *try* 
>> to write
> 
> There is no 'try' operation.

You have seen Star Wars too much. That statement is misunderstood, Yoda 
tells a falsehood there.

There is a write operation that can fail or not fail.


> It would probably O^2 complicate everything - and the performance would
> drop by major factor - as you would need to handle cancellation....

Can you only think in troubles and worries? :P. I see you mean (I think) 
that some writes would succeed and some would fail and that that would 
complicate things? Other than that there is not much difference with a 
read-only filesystem right?

A filesystem that cannot even write to any new blocks is dead anyway. 
Why worry about performance in any case. It's a form of read-only mode 
or space-full mode that is not very different from existing modes. It's 
a single flag. Some writes succeed, some writes fail. System is almost 
dead to begin with, space is gone. Applications start to crash left and 
right. But at least the system survives.

Not sure what cancellation you are talking about or if you understood 
what I said before.....

> For simplicity here - just think about failing 'thin' write as a disk
> with 'write' errors, however upon read you get last written
> content....

So? And I still cannot see how that would happen. If the filesystem had 
not actually written to a certain area, it would also not try to read, 
right? Otherwise, the whole idea of "lazy allocation" of extents is 
impossible. I don't actually know what happens if you "read" the entire 
thin LV, and you could, but blocks that have never been allocated (by 
thin LV) should just return zero. I don't think anything else would 
happen?

I mean, there we go again: And of course the file contains nothing but 
zeroes, duh. Reading from a "nonwritten" extent just returns zero space. 
Obvious.

There is no reason why a thin write should fail if it has succeeded 
before to the same area. I mean, what's the issue here, you don't really 
explain. Anyway I am grateful for your time explaining this, but it just 
does not make much sense.

Then you can say "Oh I give up", but still, it does not make much sense.


> 'extX' will switch to  'ro'  upon write failure (when configured this 
> way).

Ah, you mean errors=remount-ro. Let me see what my default is :p. (The 
man page does not mention the default, very nice....).

Oh, it is continue by default. Obvious....

In any case that means if it did have a 3rd mount option type (like rw, 
ro, .....rp for "read/partial" ;-)).

It could also remount rp on errors ;-).

Thanks for the pointers all.

> 'XFS' in 'most' cases now will shutdown itself as well (being improved)
> 
> extX is better since user may still continue to use it at least in
> read-only mode...

Thanks. That is very welcome. But I need to be a complete expert to be 
able to use this thing. I will write a manual later :p. (If I'm still 
alive).


>> It seems completely obvious that to me at this point, if anything from 
>> LVM (or
>> e.g. dmeventd) could signal every filesystem on every affected thin 
>> volume, to
>> enter a do-not-allocate state, and filesystems would be able to fail 
>> writes
>> based on that, you would already have a solution right?
> 
> 'bash' loop...

I guess your --errorwhenfull y, combined with tunefs -e remount-ro, 
would also do the trick, but that works on ALL filesystem errors.

Like I said, I haven't tested it yet. Maybe we are covering nonsensical 
ground here.

But a bash loop is no solution for a real system.....

Yes thanks for pointing it out to me. But this email is getting way too 
long for me.

Anyway, we are also converging on the solution I'd like, so thank you 
for your time here regardless.

> Remember - not writing  'new' fs....

Never said I was. New state for existing fs.


> You are preparing for lost battle.
> Full pool is simply not a full fs.
> And thin-pool may get out-of-data  or out-of-metadata....

Does not have to be any different when the filesystem thinks and says it 
is full.

You are not going from full pool to full filesystem. The filesystem is 
not even full.

You are going from full pool, to a message to filesystems to enter 
no-expand-mode (no-allocate-mode), which will then simply cease growing 
into new "aligned" blocks.

What does it even MEAN to say that the two are not identical? I never 
talked about the two being identical. It is just an expansion freeze.


>> That would normally mean that filesystem operations such as DELETE 
>> would still
> 
> You really need to sit and think for a while what the snapshot and COW
> does really mean, and what is all written into a filesystem  (included
> with journal) when you delete a file.

Too tired now. I don't think deleting files requires growth of 
filesystem. I can delete files on a full fs just fine.

You mean a deletion on origin can cause allocation on snapshot.

Still that is not a filesystem thing, that is a thin-pool thing.

That is something for LVM to handle. I don't think this delete would 
fail, would it? If the snapshot is a block thing, it could write the 
changed inodes of the file and its directory.... it would only overwrite 
the actual data if that block was overwritten on origin.

So you run the risk of extent allocation for inodes.

But you have this problem today as well. It means clearing space could 
possibly need or would possibly need a work buffer. Some workspace.

You would need to pre-allocate space for the snapshot, as a practical 
measure. But that's not really a real solution.

The real solution is to buffer it in memory. If the deletes free space, 
you get free extents that you can use to write the memory buffered data 
(metadata). That's the only way to deal with that. You are just talking 
inodes (and possibly journal).

(But then how is the snapshot going to know these are deletes. In any 
case, you'd have the same problems with regular writes to origin. So I 
guess with snapshots you run into more troubles?

I guess with snapshots you either drops the snapshots or freeze the 
entire filesystem/volume? Then how will you delete anything?

You would either have to drop a snapshot, drop a thin volume, or copy 
the data first and then do that.

Right?

Too tired.

> But on of our 'polices' visions are to also use 'fstrim' when some
> threshold is reached or before thin snapshot is taken...


A discard filesystem (mounted discard) will automatically do that right, 
with a slight delay, so to speak.

I guess it would be good to do that, or warn the user to mount with 
"discard" option.
