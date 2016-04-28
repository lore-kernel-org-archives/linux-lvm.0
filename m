Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3SIKLvl018829
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 14:20:21 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3FBE864D05
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 18:20:18 +0000 (UTC)
Received: from shell1.dds.nl (unknown [80.84.226.197])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp1.dds.nl (Postfix) with ESMTPS id 630487FC5E
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 20:20:15 +0200 (CEST)
Date: Thu, 28 Apr 2016 20:20:15 +0200 (CEST)
From: Xen <list@xenhideout.nl>
In-Reply-To: <929635034.3140318.1461840230292.JavaMail.yahoo@mail.yahoo.com>
Message-ID: <alpine.DEB.2.11.1604281817170.6585@shell1.dds.nl>
References: <929635034.3140318.1461840230292.JavaMail.yahoo.ref@mail.yahoo.com>
	<929635034.3140318.1461840230292.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Let me just write down some thoughts here.

First of all you say that fundamental OS design is about higher layers 
trusting lower layers and that certain types of communications should then 
always be one way.

In this case it is about block layer vs. file system layer.

But you make certain assumptions about the nature of a block device to 
begin with.

A block device is defined by its acess method (ie. data organized in 
blocks) rather than its contigiousness or having an unchanging, "single 
block" address or access space. I know this goes pretty far but it is the 
truth.

In theory there is nothing against a hypothetical block device offering 
ranges of blocks to a higher level (that might never change) or to be 
dynamically notified of changes to that address pool.

To a process virtual memory is a space that is transparent to it whether 
that space is constructed of paged memory (swap file) or not. At the same 
time it is not impossible to imagine that an IO scheduler for swap would 
take heed of values given by applications, such as using nice or ionice 
values. That would be one way communication though.

In general a higher level should be oblivious to what kind of lower level 
layer it is running on, you are right. Yet if all lower levels exhibit the 
same kind of features, this point becomes moot, because at that point the 
higher level will not be able to know, once more, precisely what kind of 
layer it is running on, although it would have more information.

So just theoretically speaking the only thing that is required to be 
consistent is the API or whatever interface you design for it.

I think there are many cases where some software can run on some libraries 
but not on others because those other libraries do not offer the full 
feature set of whatever standard is being defined there. An example is 
DLNA/UPNP, these are not layers but the standard is ill-defined and the 
device you are communicating with might not support the full set.

Perhaps these are detrimental issues but there are plenty of cases where 
one type of "lower level" will suffice but another won't, think maybe of 
graphics drivers. Across the layer boundary, communication is two-way 
anyway. The block device *does* supply endless streams of data to the 
higher layer. The only thing that would change is that you would no longer 
have this "always one contigious block of blocks" but something that is 
slightly more volatile.

When you "mkfs" the tool reads the size of the block device. Perhaps 
subsequently the filessytem is unaware and depends on fixed values.

The feature I described (use case) would allow the set of blocks that is 
available, to dynamically change. You are right that this would apparently 
be a big departure from the current model.

So I'm not saying it is easy, perfect, or well understood. I'm just saying 
I like the idea.

I don't know what other applications it might have but it depends entirely 
on correct "discard" behaviour from the filesystem.

The filesystem should be unaware of its underlying device but discard is 
never required for rotating disks as far as I can tell. This is an option 
that assumes knowledge of the underlying device. From discard we can 
basically infer that either we are dealing with a flash device or 
something that has some smartness about what blocks it retains and what 
not (think cache).

So in general this is already a change that reflects changing conditions 
of block devices in general or its availability. And its characteristic 
behaviour or demands from filesystems.

These are block devices that want more information to operate (well).

Coincidentally, discard also favours or enhances (possibly) lvmcache.

So it's not about doing something wildly strange here, it's about offering 
a feature set that a filesystem may or may not use, or a block device may 
or may not offer.

Contrary to what you say, there is nothing inherently bad about the idea. 
The OS design principle violation you speak of is principle, not practical 
reality. It's not that it can't be done. It's that you don't want it to 
happen because it violates your principles. It's not that it wouldn't 
work. It's that you don't like it to work because it violates your 
principles.

At the same time I object to the notion of the system administrator being 
this theoretical vastly differing role/person than the user/client.

We have no in-betweens on Linux. For fun you should do a search of your 
filesystem with find -xdev based on the contents of /etc/passwd or 
/etc/group. You will find that 99% of files are owned by root and the only 
ones that aren't are usually user files in the home directory or specific 
services in /var/lib.

Here is a script that would do it for groups:

cat /etc/group | cut -d: -f1 | while read g; do printf "%-15s %6d" $g 
`find / -xdev -type f -group $g | wc -l`; done

Probably. I can't run it here it might crash my system (live dvd).

Of about 170k files on an OpenSUSE system, 15 were group writable, mostly 
due to my own interference probably. Of 170197 files (no xdev) 168161 were 
owned by root.

Excluding man and my user, 69 files did not have "root" as the group. Part 
of that was again due to my own changes.

At the same time in some debates your are presented with the ludicrous 
notion that there is some ideal desktop user who doesn't need to ever see 
anything of the internal system. She never opens a shell and certainly 
does not come across ethernet device names (for example). The "desktop 
user" does not care about the naming of devices from /dev/eth0 to 
/sys/class/net/enp3s0.

The desktop user never uses anything other than DHCP, etc. etc. etc.

The desktop user never can configure anything without the help of the 
admin, if it is slightly more advanced.

It's that user vs. admin dichotomy that is never true on any desktop 
system and I will venture it is not even true on the systems I am a client 
of, because you often need to debate stuff with the vendor or ask for 
features, offer solutions, etc.

In a store you are a client. There are employees and clients, nothing 
else. At the same time I treat these girls as my neighbours because they 
work in the block I live in.

You get the idea. Roles can be shifty. A person can use multiple roles at 
the same time. He/she can be admin and user simulaneously.

Perhaps you are correct to state that the roles themselves should not be 
watered down, that clear delimitations are required.

In your other email you allude to me not ever having done an OS design 
course.

Offlist a friendly member suggested strongly I not use personal attacks in 
my communications here. But of course this is precisely what you are doing 
here, because as a matter of fact I did follow such a course.

I don't remember the book we used because apparently between my house mate 
and me we only had one exemplar and he ended up getting it because I was 
usually the one borrowing stuff from him.

At the same time university is way beyond my current reach (in living 
conditions) so it is just an unwarranted allusion that does not have 
anything to do with anything really.

Yes I think it was the dinosaur book:

Operating System Concepts by Silberschatz, Galvin and Gagne

Anyway, irrelevant here.

> Another way (haven't tested) to 'signal' the FS as to the true state of 
> the underlying storage is to have a sparse file that gets shrunk over 
> time.

You do realize you are trying to find ways around the limitation you just 
imposed on yourself right?

> The system admin decided it was a bright idea to use thin pools in the 
> first place so he necessarily signed up to be liable for the hazards and 
> risks that choice entails. It is not the job of the FS to bail his ass 
> out.

I don't think thin pools are that risky or should be that risky. They do 
incur a management overhead compared to static filesystems because of 
adding that second layer you need to monitor. At the same time the burden 
of that can be lessened with tools.

As it stands I consider thin LVM the only reasonably way to snapshot a 
running system without dedicating specific space to it in advance. I could 
expect snaphotting to require stuff to be in the same volume group. 
Without LVM thin, snapshotting requires making at least some prior 
investment in having a snapshot device ready for you in the same VG, 
right?

Do not think btrfs and ZFS are without costs. You wrote:

> Then you want an integrated block+fs implementation. See BTRFS and ZFS.
WAFL and friends.

But btrfs is not without complexity. It uses subvolumes that differ from 
distribution to distribution as each makes its own choice. It requires 
knowledge of more complicated tools and mechanics to do the simplest (or 
most meaningful) of tasks. Working with LVM is easier. I'm not saying LVM 
is perfect and....

Using snapshotting as a backup measure is something that seems risky to me 
at the first place because it is a "partition table" operation which 
really you shouldn't be doing on a consistent basis. So in other to 
effectively use it in the first place you require tools that handle the 
safeguards for you. Tools that make sure you are not making some command 
line mistake. Tools that simply guard against misuse.

Regular users are not fit for being btrfs admins either.

It is going to confuse the hell out of people seeing as that what their 
systems run on and if they are introduced to some of the complexity of it.

You say swallow your pride. It has not much to do with pride.

It has to do with ending up in a situation I don't like. That is then 
going to "hurt" me for the remainder of my days until I switch back or get 
rid of it.

I have seen NOTHING NOTHING NOTHING inspiring about btrfs.

Not having partition tables and sending volumes across space and time to 
other systems, is not really my cup of tea.

It is a vendor lock-in system and would result in other technologies being 
lesser developed.

I am not alone in this opinion either.

Btrfs feels like a form of illness to me. It is living in a forest with 
all deformed trees, instead of something lush and inspiring. If you've 
ever played World of Warcraft, the only thing that comes a bit close is 
the Felwood area ;-).

But I don't consider it beyond Plaguelands either.

Anyway.

I have felt like btrfs in my life. They have not been the happiest moments 
of my life ;-).

I will respond more in another mail, this is getting too long.
