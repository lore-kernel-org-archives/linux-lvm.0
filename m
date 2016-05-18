Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4IEKq0u019348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 10:20:52 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C77993B75C
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 14:20:48 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 09E9B7F8D9
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 16:20:46 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 18 May 2016 16:20:46 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <1872684910.4114972.1463547443287.JavaMail.yahoo@mail.yahoo.com>
References: <1872684910.4114972.1463547443287.JavaMail.yahoo.ref@mail.yahoo.com>
	<1872684910.4114972.1463547443287.JavaMail.yahoo@mail.yahoo.com>
Message-ID: <6505e6b65f10d80c168ec4c06c6597c1@dds.nl>
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

matthew patton schreef op 18-05-2016 6:57:


Just want to say your belligerent emails are ending up in the trash can. 
Not automatically, but after scanning, mostly.

At the same time perhaps it is worth noting that although all other 
emails from this list end up in my main email box just fine, except that 
yours (and yours alone) trigger the inbred spamfilter of my email 
provider, even though I have never trained it to spam your emails.

Basically, each and every time I will find your messages in my spam box. 
Makes you think, eh? But then, just for good measure, let me just 
concisely respond to this one:


> For the FS to "know" which of it's blocks can be scribbled
> on and which can't means it has to constantly poll the block layer
> (the next layer down may NOT necessarily be LVM) on every write.
> Goodbye performance.

Simply false and I explained already that given that the filesystem is 
already getting optimized for alignment with (possible) "thin" blocks 
(Zdenek has mentioned this) in order to more efficiently allocate (cause 
allocation) on the underlying layer, if it already has knowledge about 
this alignment, and it has knowledge about its own block usage, meaning 
that it can easily discover which of the "alignment" blocks it has 
already written to itself, then it has all the data and all the 
knowledge to know which blocks (extents) are completely "free". 
Supposing you had a 4KB blockmap (bitmap).

Now supposing you have 4MB extents.

Then every 10 bits in the blockmap corresponds to one bit in the extent 
map. You know this.

To condense the free blockmap into a free extent map:

(bit "0" is free, bit "1" is in use):

For every extent:

blockmap_segment = blockmap & (1023 << (extent number * 1024);
is_an_empty_extent = blockmap_segment > 0;

So it knows clearly which extents are empty.

Then it can simply be told not to write to those extents anymore.

If the filesystem is already using discards (mount option) then in 
practice those extents will also be unallocated by thin LVM.

So the filesystem knows which blocks (extents) will cause allocation, if 
it knows it is sitting on a thin device like that.

> <quote>
>  However, it does mean the filesystem must know the 'hidden geometry'
>  beneath its own blocks, so that it can know about stuff that won't 
> work
>  anymore.
> </quote>
> 
> I'm pretty sure this was explained to you a couple weeks ago: it's
> called "integration".

You dumb faced idiot. You know full well this information is already 
there. What are you trying to do here? Send me into the woods again?

For a long time harddisks have shed their geometry data onto us.

And filesystems can be created with geometry information (of a certain 
kind) in mind. Yes, these are creation flags.

But extent alignment is also a creation flag. The extent alignment, or 
block size, does not change over time all of a sudden. Not that it 
should matter that much principially. But this information can simply be 
had. It is no different that knowing the size of the block device to 
begin with.

If the creation tools would be LVM-aware (they don't have to be) the 
administrator could easily SET these parameters without any interaction 
with the block layer itself. They can already do this for flags such as:

stride=stride-size
     Configure the filesystem for a RAID array with stride-size
     filesystem blocks. This is the number of blocks read or written
     to disk before moving to next disk.  This mostly affects placement
     of filesystem metadata like bitmaps at mke2fs(2) time to avoid
     placing them on a single disk, which can hurt the performance.
     It may also be used by block allocator.

stripe_width=stripe-width
     Configure the filesystem for a RAID array with stripe-width
     filesystem blocks per stripe. This is typically be stride-size * N,
     where N is the number of data disks in the RAID (e.g. RAID 5 N+1,
     RAID 6 N+2).  This allows the block allocator to prevent
     read-modify-write of the parity in a RAID stripe if possible when
     the data is written.

And LVM extent size is not going to be any different. Zdenek explained 
earlier:

> However what is being implemented is better 'allocation' logic for pool 
> chunk provisioning (for XFS ATM)  - as rather 'dated' methods for 
> deciding where to store incoming data do not apply with provisioned 
> chunks efficiently.

> i.e.  it's inefficient to  provision  1M thin-pool chunks and then 
> filesystem
> uses just 1/2 of this provisioned chunk and allocates next one.
> The smaller the chunk is the better space efficiency gets (and need 
> with snapshot), but may need lots of metadata and may cause 
> fragmentation troubles.

Geometry data has always been part of block device drivers and I am 
sorry I cannot do better at this point (finding the required information 
on code interfaces is hard):

struct hd_geometry {
     unsigned char heads;
     unsigned char sectors;
     unsigned short cylinders;
     unsigned long start;
};

Block devices also register block size, probably for buffers and write 
queues:

> static int bs = 512;
> module_param(bs, int, S_IRUGO);
> MODULE_PARM_DESC(bs, "Block size (in bytes)");

You know more about the system than I do, and yet you say these stupid 
things.

> For Read/Write alignment still the physical geometry is the limiting 
> factor.

Extent alignment can be another parameter, and I think Zdenek explains 
that the ext and XFS guys are already working on improving efficiency 
based on that.


These are parameters supplied by the administrator (or his/her tools). 
They are not dynamic communications from the block layer, but can be set 
at creation time.

However, the "partial read-only" mode I proposed is not even a 
filesystem parameter, but something that would be communicated by a 
kernel module to the required filesystem. (Driver!). NOT through its 
block interface, but from the outside.

No different from a remount ro. Not even much different from a umount.

And I am saying these things now, I guess, because there was no support 
for a more detailed, more fully functioning solution.


> For 50 years filesystems were DELIBERATELY
> written to be agnostic if not outright ignorant of the underlying
> block device's peculiarities. That's how modular software is written.
> Sure, some optimizations have been made by peaking into attributes
> exposed by the block layer but those attributes don't change over
> time. They are probed at newfs() time and never consulted again.

LVM extent size for a LV is also not going to change over time.

The only other thing that was mentioned was for a filesystem-aware 
kernel module to send a message to a filesystem (driver) to change its 
mode of operation. Not directly through the inter-layer communication. 
But from the outside. Much like perhaps tune2fs could, or something 
similar. But this time with a function call.


> Chafing at the inherent tradeoffs caused by "lack of knowledge" was
> why BTRFS and ZFS were written. It is  ignorant to keep pounding the
> "but I want XFS/EXT+LVM to be feature parity with BTRFS". It's not
> supposed to, it was never intended and it will never happen. So go use
> the tool as it's designed or go use something else that tickles your
> fancy.

What is going to happen or not is not for you to decide. You have no say 
in the matter whatsoever, if all you do is bitch about what other people 
do, but you don't do anything yourself.

Also you have no business ordering people around here, I believe, unless 
you are some super powerful or important person, which I really doubt 
you are.

People in general in Linux have this tendency to boss basically everyone 
else around.

Mostly that bossing around is exactly the form you use here "do this, or 
don't do that". As if they have any say in the lives of other people.


> <quote>
>  Will mention that I still haven't tested --errorwhenfull yet.
> </quote>
> 
> But you conveniently overlook the fact that the FS is NOT remotely
> full using any of the standard tools - all of a sudden the FS got
> signaled that the block layer was denying write BIO calls. Maybe
> there's a helpful kern.err in syslog that you wrote support for?

Oh, how cynical we are again. You are so very lovely, I instantly want 
to marry you.

You know full well I am still in the "designing" stages. And you are 
trying to cut short design by saying or implying that only 
implementation matters, thereby trying to destroy the design phase that 
is happening now, ensuring that no implementation will ever arise.

So you are not sincere at all and your incessant remarks about needing 
implementation and code are just vile attacks trying to prevent 
implementation and code from ever arising in full.

And this you do constantly here. So why do you do it? Do you believe 
that you cannot trust the maintainers of this product to make sane 
choices in the face of something stupid? Or are you really afraid of 
sane things because you know that if they get expressed, they might make 
it to the program which you don't like?

I think it is either of both, but both look bad on you.

Either you have no confidence in the maintainers making the choices that 
are right for them, or you are afraid of choices that would actually 
improve things (but perhaps to your detriment, I don't know).

So what are you trying to fight here? Your own insanity? :P.

You conveniently overlook the fact that in current conditions, what you 
say just above is ALREADY TRUE. THE FILE SYSTEM IS NOT FULL GIVEN 
STANDARD TOOLS AND THE SYSTEM FREEZES DEAD. THAT DOES NOT CHANGE HERE 
except the freezing part.

I mean, what gives. You are now criticising a solution that allows us to 
live beyond death, when otherwise death would occur. But, it is not 
perfect enough for you, so you prefer a hard reboot over a system that 
keeps functioning in the face of some numbers no longer adding up?????? 
Or maybe I read you wrong here and you would like a solution, but you 
don't think this is it.

I have heard very few solutions from your side though, in those weeks 
past.

The only thing you have ever mentioned back then was some shell 
scripting stuff, If I remember any sanity here.


> <quote>
>  In principle if you had the means to acquire such a
> flag/state/condition, and the
>  filesystem would be able to block new  allocation wherever whenever,
> you would already
>  have a working system.  So what is then non-trivial?
> ...
>  It seems completely obvious that to me at this point, if anything from
>  LVM (or e.g. dmeventd) could signal every filesystem on every affected
>  thin volume, to enter a do-not-allocate state, and filesystems would 
> be
>  able to fail writes based on that, you would already have a solution
> </quote>
> 
> And so therefore in order to acquire this "signal" every write has to
> be done in synchronous fashion and making sure strict data integrity
> is maintained vis-a-vis filesystem data and metadata. Tweaking kernel
> dirty block size and flush intervals are knobs that you can be turned
> to "signal" user-land that write errors are happening. There's no such
> thing as "immediate" unless you use synchronous function calls from
> userland.

I'm sorry, you know a lot but you mentioned such "hints" before; 
tweaking existing functionality for stuff they were not meant for.

Why are you trying to seek solutions within the bounds of the existing? 
They can never work. You are basically trying to create that 
"integration" you so despise without actively saying you are doing so, 
instead, you seek hidden agenda's, devious schemes, to communicate the 
same thing without changing those interfaces. You are tying to the same 
thing, but you are just not owning up to it.

No, the signal would be something calling an existing (or new) system 
function in the filesystem driver from the (presiding) (LVM) module (or 
kernel part). In fact, you would not directly call the filesystem 
driver, probably you would call the VFS which would call the filesystem 
driver.

Just a function call.

I am talking about this thing:

struct super_operations {
         void (*write_super_lockfs) (struct super_block *);
         void (*unlockfs) (struct super_block *);
         int (*remount_fs) (struct super_block *, int *, char *);
         void (*umount_begin) (struct super_block *);
};

Something could be done something around there. I'm sorry I haven't 
found the relative parts yet. My foot is hurting and I put some cream on 
it, but it kinda disrupts my concentration here.

I have an infected and swollen foot, every day now.

No bacterial infection. A failed operation.

Sowwy.


> If you want to write your application to handle "mis-behaved" block
> layers, then use O-DIRECT+SYNC.

You are trying to do the complete opposite of what I'm trying to do, 
aren't you.
