Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j23NAYK14329
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 18:10:34 -0500
Received: from mail.clunker.utsl.gen.nz (210-54-92-184.ipnets.xtra.co.nz
	[210.54.92.184])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j23NAQ4c010493
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 18:10:26 -0500
Message-ID: <42279953.8030108@vilain.net>
Date: Fri, 04 Mar 2005 12:10:11 +1300
From: Sam Vilain <sam@vilain.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Building up a RAID5 LVM home server (long)
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAiKro/zVEU02Xw5blW4RJy8KAAAAQAAAAfEOWBfOtF0efRP286+fnTQEAAAAA@echohome.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAiKro/zVEU02Xw5blW4RJy8KAAAAQAAAAfEOWBfOtF0efRP286+fnTQEAAAAA@echohome.org>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Erik@echohome.org, LVM general discussion and development <linux-lvm@redhat.com>

OK kid.  You've played quiet, done your homework and asked nicely, so
here's a recommended configuration for free.  Don't ask me how much I've
charged for this sort of thing distant times ago.

You've got yourself plenty of space.  So don't worry about RAID 5.  If you
ever find yourself thinking, "maybe I could make a little more space...",
forget it.  It's for certain niches that IMHO you don't fit into.
Especially with disks all different sizes like yours.  RAID 5 arrays with
hot spares are screaming madness, I tell you.

Look at it this way: with RAID 1, just about all access to the filesystem
is at worst the same speed as before (sans a little extra load on the
system sending the data to the IDE controller twice), or twice as fast
(for reads).  For any application with heavy random access patterns this
makes a considerable difference.  Also, it means streaming applications
don't kill access times.  All this, for one more disk than a 5 disk RAID5
with hot spare array.

You've got 2x40GB.  Those will be good as base disks for a system.

Normally it's best for performance to pair up identical disks throughout
a system for mirrors, do I'd be inclined to go for something like this:

   40GB - /dev/hda
    /dev/hda1 -  1GB - root (/dev/md0)
    /dev/hda2 -  1GB - swap (/dev/md1)
    /dev/hda3 - 38GB - LVM space (PV: /dev/md2)

   80GB - /dev/hdb
     whole disk - LVM space (PV: /dev/md3)

   40GB - /dev/hdc
   mirror pair of /dev/hda
    /dev/hdc1 -  1GB - root (/dev/md0)
    /dev/hdc2 -  1GB - swap (/dev/md1)
    /dev/hdc3 - 38GB - LVM space (PV: /dev/md2)

   80GB - /dev/hdd
   mirror pair of /dev/hdb
     whole disk - LVM space (PV: /dev/md3)

  200GB - /dev/hde
    /dev/hde1 - 60GB - LVM space (PV: /dev/md4)
    /dev/hde2 - 140GB - LVM space (PV: /dev/md5)

   60GB - /dev/hdg
   mirror pair of first partition on /dev/hde
     whole disk - LVM space (PV: /dev/md4)

In this setup, you end up with:

   - two mirrored "raw" partitions, that you can use for a root filesystem,
     and swap.  Or turn swap off while you install a different distribution
     into one of them for testing.  You'll at some point want to move your
     /usr to an LVM partition, which means that you'll want to keep an LVM
     `cheat sheet' on hand in case your LVM doesn't come up and you need to
     use the admin utilities.  Either that, or only put /usr/local on LVM,
     keeping /usr minimal.  Or just make a bigger / :).
   - total 38GB + 60GB + 80GB = 180GB *fast* mirrored LVM space
   - total 140GB *fast* unmirrored space

the unmirrored space would be great for keeping large caches of stuff
you already have on media.  everything else, the OS and things that you
want random access to be as fast as possible.

You could also then use `pvmove' to move stuff from mirrored to unmirrored
space on the LVM.

Even though your unmirrored space has no pair currently, notice how it's
still got a mirror device in the above plan - /dev/md5.  This will be set
up as a "degenerate" (one-way) mirror, using an /etc/raidtab entry like:

  raiddev /dev/md5
    raid-level       1
    nr-raid-disks    2
    nr-spare-disks   0
    persistent-superblock 1
    chunk-size        4
    device   /dev/hde2
    raid-disk 0
    device   /dev/hdg2
    raid-disk 1
    failed-disk 1

This will allow you to attach a mirror pair to that partition later
without much effort at all.

In fact, in practice setting a whole system up like this in the first
place is a great way to prototype a layout without losing the ability to
back-out (sans inconveniently timed disasters).  Then you can set up the
partition tables when you're happy, `raidhotadd' to attach the other half
of the mirrors, and `cat /proc/mdstat' to kill time while it syncs.

...

Alternatives exist, which break the "mirror identical disks across
controllers" best mirroring practice, but maximise mirrored space:

   40GB - /dev/hda
    /dev/hda1 -  1GB - root (/dev/md0)
    /dev/hda2 -  1GB - swap (/dev/md1)
    /dev/hda3 - 38GB - LVM space (PV: /dev/md2)

   40GB - /dev/hdc
   mirror pair of /dev/hda
    /dev/hdc1 -  1GB - root (/dev/md0)
    /dev/hdc2 -  1GB - swap (/dev/md1)
    /dev/hdc3 - 38GB - LVM space (PV: /dev/md2)

   60GB - /dev/hdd
   mirror pair of last /dev/hde partition
    /dev/hdd1 - 40GB - LVM space (PV: /dev/md5)
    /dev/hdd2 - 20GB - unmirrored LVM space (PV: /dev/md6)

  200GB - /dev/hde
    /dev/hde1 - 80GB - LVM space (PV: /dev/md3)
    /dev/hde2 - 80GB - LVM space (PV: /dev/md4)
    /dev/hde3 - 40GB - LVM space (PV: /dev/md5)

   80GB - /dev/hdg
     whole disk - LVM space (PV: /dev/md3)

   80GB - /dev/hdh
   mirror pair of /dev/hdb
     whole disk - LVM space (PV: /dev/md4)

This gives you:

   - total 38GB + 80GB + 80GB + 40GB = 238GB *fast* mirrored LVM space
   - total 20GB unmirrored space

...

Hopefully that should give you enough of a hint about how best to go
about arranging these sorts of things :)

The underlying principle, is keeping the MD layer as simple as possible,
so that you've got nice little resilient building blocks for your Volume
Group.  Never use concatenation, striping or RAID5 at the MD layer if
you've got LVM, it's simply in the wrong place!

You'll need to do a little work to get GRUB to be able to boot off the
mirrored root.  But it's well worth it.  "kernel RAID device
autodetection" is a highly recommended kernel option.

HTH,
Sam.



Erik Ohrnberger wrote:
> Dear Peeps of the LVM discussion list,
> 
>     In the past you've come to my rescue a number of times, and I wish to
> thank you all for this assistance.
> 
>     I fear that my desires have once again out stripped my hands on
> practical knowledge.  So I pose to you this discussion.  Mind you that if
> there is a web page that covers the topic, please don't hesitate to point
> into that direction.  This has been a self study project all along.
> 
> Some History: (skip if you want - see The Questions below) =============
>     I've had a LVM up and running for some time for large file storage.  As
> the storage needs grew, it was easy to add another hard disk, add it to the
> volume group, and grow the file system.  This worked fairly seamlessly and
> easily, and I figured it all out from the howtos and other information
> resources.  The same held true for when the need for storage decreased and I
> squeezed hard drives out of the file system and then the volume group.
> Cool!  Up until one of the active hard disks with data died, and I lost
> nearly all my data.  Oh well.  That's the way that it goes.  Thank the
> computer gods that there was nothing of the data really all that terribly
> irreplaceable, but still....
> 
>     After this I just went and got a 200 GB drive and left it at that (I was
> going to school and had limited time for my computer addiction).  But now
> that I'm done with that, I'm thinking of building a MythTV system, and I'm
> certain that I will want to have a large amount of robust storage available
> on the network.  So the question is what's the best way to build it?
> 
> The Questions:
> ==============
>     It seems to me that RAID5 with at least one hot spare hard disk is one
> of the safest ways to go for this type of storage.  The only concern that I
> have is specific to the wide variety of hard disk sizes that I have
> available (2 40GB, 1 60GB, 2 80GB, and I'll probably add the 200GB drive
> once I've migrated that data off it to the array).  My limited understanding
> of RAID5 is that it's best if all the hard drives are exactly the same.  Is
> this true?  What are the downsides of using such a mix of hard disk sizes?
> 
>     Being able to resize the storage is a key, as is having a robust and
> reliable storage pool.  As storage demands rise and fall, it's great to have
> the flexibility to add and drop hard disks from the storage pool and use
> them for other things, resizing the file system and the volume group as you
> go along, of course.  If the storage pool is RAID5, and I add a larger hard
> disk to the pool as a hot spare, and then use the software tools to fault
> out the drive that I want, forcing a reconstruction, couldn't I pull the
> faulted drive out, and use it for something else?  What sort of shape or
> state will the RAID5 array be in at this point?  Will it use all of the
> space on the newly added hot spare?
> 
>     Again, if there is a discussion thread that I've not found that covers
> these questions and this topic, I will not be offended by a mere pointer to
> the web page, I wish to educate myself about the trade offs to arrive at the
> best possible compromise for my needs.
> 
>     Thanks as always and in advance.
>         Erik.
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 


-- 
Sam Vilain, sam /\T vilain |><>T net, PGP key ID: 0x05B52F13
(include my PGP key ID in personal replies to avoid spam filtering)
