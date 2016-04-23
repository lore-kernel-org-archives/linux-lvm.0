Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3NHr8k4032528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2016 13:53:08 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4AAF2627DD
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2016 17:53:06 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 289497F07B
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2016 19:53:03 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 23 Apr 2016 17:53:03 +0000
From: Xen <list@xenhideout.nl>
Message-ID: <aa73a4aa76ae5f2c67a14f8e00fc3792@dds.nl>
Subject: [linux-lvm] thin handling of available space
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
To: Linux lvm <linux-lvm@redhat.com>

Hi,

So here is my question. I was talking about it with someone, who also 
didn't know.



There seems to be a reason against creating a combined V-size that 
exceeds the total L-size of the thin-pool. I mean that's amazing if you 
want extra space to create more volumes at will, but at the same time 
having a larger sum V-size is also an important use case.

Is there any way that user tools could ever be allowed to know about the 
real effective free space on these volumes?

My thinking goes like this:

- if LVM knows about allocated blocks then it should also be aware of 
blocks that have been freed.
- so it needs to receive some communication from the filesystem
- that means the filesystem really maintains a "claim" on used blocks, 
or at least notifies the underlying layer of its mutations.

- in that case a reverse communication could also exist where the block 
device communicates to the file system about the availability of 
individual blocks (such as might happen with bad sectors) or even the 
total amount of free blocks. That means the disk/volume manager (driver) 
could or would maintain a mapping or table of its own blocks. Something 
that needs to be persistent.

That means the question becomes this:

- is it either possible (theoretically) that LVM communicates to the 
filesystem about the real number of free blocks that could be used by 
the filesystem to make "educated decisions" about the real availability 
of data/space?

- or, is it possible (theoretically) that LVM communicates a "crafted" 
map of available blocks in which a certain (algorithmically determined) 
group of blocks would be considered "unavailable" due to actual real 
space restrictions in the thin pool? This would seem very suboptimal but 
would have the same effect.

See if the filesystem thinks it has 6GB available but really there is 
only 3GB because data is filling up, does it currently get notified of 
this?

What happens if it does fill up?

Funny that we are using GB in this example. I remembered today using 
Stacker on MS-DOS disk where I had 20MB available and was able to 
increase it to 30MB ;-).

Someone else might use terabytes, but anyway.

If the filesystem normally has a fixed size and this size doesn't change 
after creation (without modifying the filesystem) then it is going to 
calculate its free space based on its knowledge of available blocks.

So there are three figures:

- total available space
- real available space
- data taken up by files.

total - data is not always real, because there may still be handles on 
deleted files, etc., open. Visible, countable files and its "du" + 
blocks still in use + available blocks should be ~ total blocks.

So we are only talking about blocks here, nothing else.

And if LVM can communicate about availability of blocks, a fourth figure 
comes into play:

total = used blocks + unused blocks + unavailable blocks.

If LVM were able to dynamically adjust this last figure, we might have a 
filesystem that truthfully reports actual available space. In a thin 
setting.

I do not even know whether this is not already the case, but I read 
something that indicated an importance of "monitoring available space" 
which would make the whole situation unusable for an ordinary user.

Then you would need GUI applets that said "The space on your thin volume 
is running out (but the filesystem might not report it)".

So question is:

* is this currently 'provisioned' for?
* is this theoretically possible, if not?

If you take it to a tool such as "df"

There are only three figures and they add up.

They are:

total = used + available

but we want

total = used + available + unavailable

either that or the total must be dynamically be adjusted, but I think 
this is not a good solution.


So another question:

*SHOULDN'T THIS simply be a feature of any filesystem?*

The provision of being able to know about the *real* number of blocks in 
case an underlying block device might not be "fixed, stable, and 
unchanging"?

The way it is you can "tell" Linux filesystems with fsck which blocks 
are bad blocks and thus unavailable, probably reducing the number of 
"total" blocks.

 From a user interface perspective, perhaps this would be an ideal 
solution, if you needed any solution at all. Personally I would probably 
prefer either the total space to be "hard limited" by the underlying 
(LVM) system, or for df to show a different output, but df output is 
often parsed by scripts.

In the former case supposing a volume was filling up.

udev             1974288       0   1974288   0% /dev
tmpfs             404384   41920    362464  11% /run
/dev/sr2         1485120 1485120         0 100% /cdrom

(Just taking 3 random filesystems)

One filesystem would see "used" space go up. The other two would see 
"total" size going down, in addition to the other one, also seeing that 
figure go down. That would be counterintuitive and you cannot really do 
this.

It's impossible to give this information to the user in a way that the 
numbers still add up.

Supposing:

real size 2000

1000  500  500
1000  500  500
1000  500  500

combined virtual size 3000. Total usage 1500. Real free 500. Now the 
first volume uses another 250.

1000  750  250
1000  500  250
1000  500  250

The numbers no longer add up for the 2nd and 3rd system.

You *can* adjust total in a way that it still makes sense (a bit)

1000  750  250
  750  500  250
  750  500  250

You can also just ignore the discrepancy, or add another figure:

total used unav avail
1000  750    0  250
1000  500  250  250
1000  500  250  250

Whatever you do, you would have to simply calculate this adjusted number 
from the real number of available blocks.

Now the third volume takes another 100

First style:

1000  750  150
1000  500  150
1000  600  150

Second style:

1000  750  150
  650  500  150
  750  600  150

Third style:

total used unav avail
1000  750  100  150
1000  500  350  150
1000  600  250  150

There's nothing technically inconsistent about it, it is just rather 
difficult to grasp at first glance.

df uses filesystem data, but we are really talking about 
block-layer-level-data now.

You would either need to communicate the number of available blocks (but 
which ones?) and let the filesystem calculate unavailable --- or 
communicate the number of unavailable blocks at which point you just do 
this calculation yourself. For each volume you reach a different number 
of "blocks" you need to withhold.

If you needed to make those blocks unavailable, you would now randomly 
(or at the end of the volume, or any other method) need to "unavail" 
those to the filesystem layer beneath (or above).

Every write that filled up more blocks would be communicated to you, 
(since you receive the write or the allocation) and would result in an 
immediate return of "spurious" mutations or an updated number of 
unavailable blocks -- and you can also communicate both.

On every new allocation, the filesystem would be returned blocks that 
you have "fakely" marked as unavailable. All of this only happens if 
available real space becomes less than that of the individual volumes 
(virtual size). The virtual "available" minus the "real available" is 
the number of blocks (extents) you are going to communicate as being 
"not there".

At every mutation from the filesystem, you respond with a like mutation: 
not to the filesystem that did the mutation, but to every other 
filesystem on every other volume.

Space being freed (deallocated) then means a reverse communication to 
all those other filesystems/volumes.

But it would work, if this was possible. This is the entire algorithm.


I'm sorry if this sounds like a lot of "talk" and very little "doing" 
and I am annoyed by that as well. Sorry about that. I wish I could 
actually be active with any of these things.

I am reminded of my father. He was in school for being a car mechanic 
but he had a scooter accident days before having to do his exam. They 
did the exam with him in a (hospital) bed. He only needed to give 
directions on what needed to be done and someone else did it for him :p.

That's how he passed his exam. It feels the same way for me.

Regards.
