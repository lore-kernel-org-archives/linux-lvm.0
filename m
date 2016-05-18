Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4ICFO3d023099
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 08:15:25 -0400
References: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
	<5739B848.3060505@redhat.com> <119b520d472b019ced48357eff9fb389@dds.nl>
	<5739D494.2040103@redhat.com> <88ecf232d113c573e524088e67204c4f@dds.nl>
	<573AE7BD.3000008@redhat.com> <5751b613e8123d1c61ef8d08a5c01ea3@dds.nl>
	<57318838-1c71-f4e6-9869-a3f19df56a8b@redhat.com>
	<e3a1d746d1fc7279a7a9cd719cc3b4b4@dds.nl>
	<11d1b01f-f4cc-fcb7-8e47-4f819abc3341@redhat.com>
	<394af6755186063c4dee35cdbfe39289@dds.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <758e2d97-3c1e-45ab-0e4c-cfdc623a3e7f@redhat.com>
Date: Wed, 18 May 2016 14:15:24 +0200
MIME-Version: 1.0
In-Reply-To: <394af6755186063c4dee35cdbfe39289@dds.nl>
Content-Transfer-Encoding: 7bit
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

On 18.5.2016 03:34, Xen wrote:
> Zdenek Kabelac schreef op 18-05-2016 0:26:
>> On 17.5.2016 22:43, Xen wrote:
>>> Zdenek Kabelac schreef op 17-05-2016 21:18:
>>>
>>> I don't know much about Grub, but I do know its lvm.c by heart now almost :p.
>>
>> lvm.c by grub is mostly useless...
>
> Then I feel we should take it out and not have grub capable of booting LVM
> volumes anymore at all, right.

It's not properly parsing and building lvm2 metadata - it's a 'reverse 
engineered' code to handle couple 'most common' metadata layouts.

But it happens most users are happy with it.

So for now using 'boot' partition is advised until proper lvm2 metadata
parser becomes integral part of Grub.


>> ATM user needs to write his own monitoring plugin tool to switch to
>> read-only volumes - it's really as easy as running bash script in loop.....
>
> So you are saying every user of thin LVM must individually, that means if
> there are a 10.000 users, you now have 10.000 people needing to write the same

Only very few of them will write something - and they may propose their 
scripts for upstream inclusion...

> I take it by that loop you mean a sleep loop. It might also be that logtail
> thing and then check for the dmeventd error messages in syslog. Right? And

dmeventd is also 'sleep loop' in this sense (although smarter...)


> First hit is CentOS. Second link is reddit. Third link is Redhat. Okay it
> should be "lvm guide" not "lvm book". Hasn't been updated since 2006 and no
> advanced information other than how to compile and install....

Dammed Google, he knows about you, that you like Centos and reddit :)
I do get quite different set of links :)

> I mean: http://tldp.org/HOWTO/LVM-HOWTO/. So what people are really going to
> know this stuff except the ones that are on this list?

We do maintain man pages - not feeling responsible for any HOWTO/blogs around 
the world.

And of course you can learn a lot here as well:
https://access.redhat.com/documentation/en/red-hat-enterprise-linux/

>
> How to find out about vgchange -ay without having internet access.........

Now just imagine you would need to configure your network from command line 
with broken NetworkManager package....

> maybe a decade or longer. Not as a developer mostly, as a user. And the thing
> is just a cynical place. I mean, LOOK at Jira:
>
> https://issues.apache.org/jira/browse/log4j2/?selectedTab=com.atlassian.jira.jira-projects-plugin:issues-panel
>

Being cynical myself - unsure what's better in  URL name issues.apache.org 
compared bugzilla.redhat.com...  Obviously we do have all sorts of flags in RHBZ.

>> Well the question was not asking for your 'technical' proposal, as you
>> have no real idea how it works and your visions/estimations/guesses
>> have no use at all (trust me - far deeper thinking was considered so
>> don't even waste your time to write those sentences...)
>
> Well you can drop the attitude you know. If you were doing so great, you would
> not be having a total lack of all useful documentation to begin with. You
> would not have a system that can freeze the entire system by default, because
> "policy" is apparently not well done.

Yep - and you probably think you help us a lot to realize this...

But you may a bit 'calm down' - we really know all the troubles and even far 
more then you can even think of - and surprise  - we actively work on them.


> I think the commands themselves and their way of being used, is outstanding,
> they are intuitive, they are much better than many other systems out there
> (think mdadm). It takes hardly no pain to remember how to use e.g. lvcreate,

Design simply takes time - and many things are tried...

Of course Red Hat could have been cooking something for 10 years secretly 
before going public - but the philosophy is - upstream first, release often 
and only released code does matter.

So yeah - some people are writing novels on lists and some others are writing 
a useful code....


> You are *already* integrating e.g. extfs to more closely honour the extent
> boundaries so that it is more efficient. What I am saying is not at all out of

There is a fundamental  difference to 'read' geometry once during 'mkfs' time,
and do it every time we each write through the whole device stack ;)


>> When you fail to write an ordinary (non-thin) block device  - this
>> block is then usually 'unreadable/error' - but in thinLV case - upon
>> read you get previous 100% valid' content - so you may start to
>> imagine where it's all heading.
>
> So you mean that "unreadable/error" signifies some form of "bad sector" error.
> But if you fail to write to thinLV, doesn't that mean (in our case there) that
> the block was not allocated by thinLV? That means you cannot read from it
> either. Maybe bad example, I don't know.

I think we are heading to big 'reveal' how thinp  works.

You have  thin volume  T  and its snapshot S.

You write to block 10 of device T.

As there is snapshot S -  your write to device T needs to go to a newly 
provisioned thin-pool chunk.

You get 'write-error' back  (no more free chunks)

On read of block 10  you get perfectly valid existing content of block 10.
(and this applies to both  volumes  T & S).


And then you realize - that this 'write of block 10'  means - you were just 
updating some 'existing' file in filesystem or even filesystem journal..
There was no 'new' block allocation at filesystem level - filesystem was 
writing to the 'space' it's believed it's been already assigned to him.

So I assume maybe now some 'spark' in you head may finally appear....


> It is not either/or. What I was talking about is both. You have reliability
> and you can keep using the filesystem. The filesystem just needs to be able to
> cope with the condition that it cannot use any new blocks from the existing
> pool that it knows about. That is not extremely very different from having
> exhausted its block pool to begin with. It is really the same condition,
> except right now it is rather artificial.

Wondering how long will it take before you realize - this is exactly what
the 'threshold'  is about.

e.g. you know you are 90% full - so stop using fs - unmount it, remount it, 
shutdown it,  add new space - whatever -  but it needs to be admin to decide...

....
deleted large piece of nonsense text here
....

>
> I mean I am still wholly unaware of how concurrency works in the kernel
> (except that I know the terms) (because I've been reading some code) (such as
> RCU, refcount, spinlock, mutex, what else) but I doubt this would be a real
> issue if you did it right, but that's just me.

You need to read some books how does modern OS works  (instead of creating 
hour lengthy emails) and learn what really means there is a 'parallel work' in 
progress on a single machine with e.g. 128 CPU cores...

> If you can concurrently traverse data structures and keep everything working
> in pristine order, you know, why shouldn't you be able to 'concurrently'
> update a number.

What you effectively say here  you have 'invented' excellent bug fix, you just 
need to serialize and synchronize all writes first in your OS.

To give it 'a real world' example - you would need to degrade your linux 
kernel to  not use  page cache and use all writes in a way like:

dd if=XXX of=/my/thin/volume  bs=512 oflag=direct,sync

> Maybe that's stupid of me, but it just doesn't make sense to me.

see above...

But as said - this way it has worked in 'msdos' 198X era...

> Then you can say "Oh I give up", but still, it does not make much sense.

My only goal here is to give you enough info to stop writing
emails with no real value in it  and rather writing more useful code or doc 
instead...

>> 'extX' will switch to  'ro'  upon write failure (when configured this way).
>
> Ah, you mean errors=remount-ro. Let me see what my default is :p. (The man
> page does not mention the default, very nice....).
>
> Oh, it is continue by default. Obvious....

Common issue here is -  one user prefers  A other prefers B - that's
why we have options and users should read doc - as tools themselves
are not smart enough to figure out which fits better....

If you would ask me -   'remount,ro' is the only sane variant,
And I've learned this 'hard way' with my first failing HDD in ~199X,
where I've destroyed 50% of my data first....
(I do believe in Fedora you get remount,ro in fstab)


> But a bash loop is no solution for a real system.....

Sure if you write this loop in JBoss  it sounds way more cool :)
Whatever fits...


>>> That would normally mean that filesystem operations such as DELETE would still
>>
>> You really need to sit and think for a while what the snapshot and COW
>> does really mean, and what is all written into a filesystem  (included
>> with journal) when you delete a file.
>
> Too tired now. I don't think deleting files requires growth of filesystem. I
> can delete files on a full fs just fine.
>
> You mean a deletion on origin can cause allocation on snapshot.

It's not a 'snapshot' that allocates, it's always the thin-volume you write to 
it...

You must not 'rewrite' chunk referenced by multiple thin volumes.

It's the 'key' difference between old snapshot & thin-provisioning.

With old snapshot - blocks were first copied into many 'snapshots' (crippling 
write performance in major way) and then you have updated your origin.

With thins - referenced block is kept in place and new chunk is allocated.

So this should quickly lead you to a conclusion - ANY write in 'fs'
may cause allocation...

Anyway - I've tried hard to 'explain' and if I've still failed - I'm not good 
'teacher' and there is no reason to continue this debate.

Regards

Zdenek
