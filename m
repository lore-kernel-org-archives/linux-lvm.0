From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199906250609.AAA09300@webber.adilger.net>
Subject: Re: [linux-lvm] lvm-0.6, Linux 2.2.9
Date: Fri, 25 Jun 1999 00:09:49 -0600 (MDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

Rolf writes:
> thanks for the link. Maybe we should bring the code to the author of
> ext2resize. A combination of both approaches may be what we are (or at
> least I am) looking for.

I had a closer look at the ext2-volume code today.  There are two parts -
1) a program (e2extend) to take a newly mke2fs'd device and increment the
   inode block numbers and the group descriptor block counts in the new
   device by the number of blocks in the original fs.
2) a kernel patch to ext2 code which will handle the fact that we need to
   look at multiple devices when accessing different parts of the fs.  One
   interesting thing is that it never modifies the original fs data, only
   the in-kernel representation by totalling the blocks, groups, inodes
   as each extension filesystem is mounted...  It may do something in
   addition to this but I couldn't see it.

What I don't understand (since I haven't really looked at ext2 internals
before), is what is different about the above scheme compared to running
"mke2fs -S" on the LVM-enlarged LV?  According to Theodore, the "mke2fs -S"
method will corrupt the fs if it is enlarged past a 250MB? boundary because
an ext2 sturcture (superblock?, bitmap?, anyone know?) will grow and
overwrite other data on the filesystem.

I haven't yet looked at ext2resize to see what it does to overcome this
issue, and I don't know enough about ext2 to know what it is myself.
Otherwise, 90% of the ext2-volume patch to the kernel can be discarded
because LVM makes the enlarged LV appear to be a single device to the
kernel, and "all" we need to do is have mke2fs create only the ext2
structures on the newly extended part of the LV, and then go back to
the ext2 superblock(s) to update the data there.  According to
ext_update_summary() in the ext2-multi-device.diff we would need to update:
blocks_count, free_blocks_count, r_blocks_count, free_inodes_count,
inodes_count, groups_count

in the superblock, and then remount the filesystem.  There are no doubt
issues about flushing in-kernel fs metadata to disk before we update the
on-disk structures.  It may be better to update the in-kernel metadata
like the ext2-volume patch does, and then when the filesystem is unmounted
(or remounted?) it will update the data on disk, or we could force a flush
to disk somehow.

Cheers, Andreas
-- 
Andreas Dilger  University of Calgary \ "If a man ate a pound of pasta and
                Micronet Research Group \ a pound of antipasto, would they
Dept of Electrical & Computer Engineering \  cancel out, leaving him still
http://www-mddsp.enel.ucalgary.ca/People/adilger/      hungry?" -- Dogbert
