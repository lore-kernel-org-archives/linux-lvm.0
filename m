Message-Id: <199906250851.AA10655@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] lvm-0.6, Linux 2.2.9
Date: Fri, 25 Jun 1999 10:48:51 METDST
In-Reply-To: <199906250609.AAA09300@webber.adilger.net>; from "Andreas Dilger" at Jun 25, 99 12:09 (midnight)
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adilger@enel.ucalgary.ca
Cc: linux-lvm@msede.com, mge@u9ete.ez-darmstadt.telekom.de

> 
> Rolf writes:
> > thanks for the link. Maybe we should bring the code to the author of
> > ext2resize. A combination of both approaches may be what we are (or at
> > least I am) looking for.
> 
> I had a closer look at the ext2-volume code today.  There are two parts -
> 1) a program (e2extend) to take a newly mke2fs'd device and increment the
>    inode block numbers and the group descriptor block counts in the new
>    device by the number of blocks in the original fs.
> 2) a kernel patch to ext2 code which will handle the fact that we need to
>    look at multiple devices when accessing different parts of the fs.  One
>    interesting thing is that it never modifies the original fs data, only
>    the in-kernel representation by totalling the blocks, groups, inodes
>    as each extension filesystem is mounted...  It may do something in
>    addition to this but I couldn't see it.
> 
> What I don't understand (since I haven't really looked at ext2 internals
> before), is what is different about the above scheme compared to running
> "mke2fs -S" on the LVM-enlarged LV?  According to Theodore, the "mke2fs -S"
> method will corrupt the fs if it is enlarged past a 250MB? boundary because
> an ext2 sturcture (superblock?, bitmap?, anyone know?) will grow and
> overwrite other data on the filesystem.

It's the block group descriptor table (GDT).

A block group descriptor is a structure 32 bytes in size to describe
the location of block bitmap, inode bitmaps, inode tables and so on
(see /usr/src/linux/include/linux/ext2_fs.h;
 definition of struct ext2_group_desc)

If you have a regular block size of 1k, 32 of these fit into one block.
Groups have a size of 8m --> 8M times 32 = 256M.
IOW: "ext2fs size in megabyte module 256m + 1" equals the amount of
     block group descriptor blocks at mke2fs time.

So...

If you want to resize an ext2fs which is smaller than 256M to a size > 256M
you have to play around remapping the structures which follow the group
descriptor block like inodes etc.
Same remapping stuff takes place with n * 256M (n=1 to verybig 8*) )
resizing start sizes.

> 
> I haven't yet looked at ext2resize to see what it does to overcome this
> issue,

AFAI saw it does remapping.

> and I don't know enough about ext2 to know what it is myself.
> Otherwise, 90% of the ext2-volume patch to the kernel can be discarded
> because LVM makes the enlarged LV appear to be a single device to the
> kernel, and "all" we need to do is have mke2fs create only the ext2
> structures on the newly extended part of the LV, and then go back to
> the ext2 superblock(s) to update the data there.  According to
> ext_update_summary() in the ext2-multi-device.diff we would need to update:
> blocks_count, free_blocks_count, r_blocks_count, free_inodes_count,
> inodes_count, groups_count
> in the superblock, and then remount the filesystem.  There are no doubt
> issues about flushing in-kernel fs metadata to disk before we update the
> on-disk structures.  It may be better to update the in-kernel metadata
> like the ext2-volume patch does, and then when the filesystem is unmounted
> (or remounted?) it will update the data on disk, or we could force a flush
> to disk somehow.
> 

Good ideas.

More people out there to dig into this?


Regards,
Heinz

--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
