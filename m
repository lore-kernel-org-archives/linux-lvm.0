From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199907052049.OAA23677@munet-d.enel.ucalgary.ca>
Subject: [linux-lvm] Re: ext2resize
Date: Mon, 5 Jul 1999 14:49:01 -0600 (MDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM on Linux <linux-lvm@msede.com>, Linux FS development list <linux-fsdevel@vger.rutgers.edu>

Lennert Buytenhek writes:
>I tried to make a 8194-block filesystem with mke2fs once, and it told
>me it was going to make the fs 8193 blocks. Can you give me a recipe
>for making an fs which has a last group w/o sb/gdt?

I think this was a mistake on my part.  In alloc_tables.c it looked
like it was possible to have the last group without sb/gdt, but it
turns out that this is only setting the range where blocks are allocated.
In initialize.c it shows where "overhead" is calculated that if the
last group has less than 50 free data blocks it will be discarded.

>>Have the "reserved" blocks blocks be the first few data blocks in each
>>group, rather than all in a single group.  This way the blocks can be
>>used by root when the FS is very full, or they can be used for expanding
>>the filesystem.  The one problem is that you may not have your extra
>>blocks when you need them (ie when the FS is full) if it is root that
>>is filling the FS.  The plus is that you don't keep more spare blocks
>>that normally nobody uses in the FS.

>How do you tell the kernel that it should use those 'reserved' blocks
>only when free space is low? compat/rocompat/incompat feature?

Actually, ext2 (like most Unix FS) already reserves space for root (or
other specified users).  The default is 5% of the FS, but can be set at
FS creation time or via tune2fs (-m parameter).  If we have mke2fs
allocate the 5% reserved blocks spread across all groups using the blocks
right after the current GDT, then we could use these data blocks later
on instead of moving user blocks out of the way.  However, these blocks
are not guaranteed to be anywhere in particular (currently they all get
allocated in one group), so doing "tune2fs -m 0; tune2fs -m 5" will
probably move all of these blocks around.

For this reason it is probably safer to use a different inode to make
sure the spare GDT blocks are where we want them to be and aren't in use.
However, if we have a good offline block moving utility, this may be
enough to be able to online resize "most" filesystems, especially those that
the admin hasn't been messing with.  If they are desparate, they can
unmount and shuffle blocks, or online expand to fill the rest of the last
GDT block (average growth limit 128MB for 1kB blocks, 8GB for 4kB blocks)
even without adding ANY blocks to GDT.

>Why don't we say: "every ext2 fs must have 32 gdt blocks per block group"
>then? Same idea.

Being able to tune it makes people happy.  If the max is actually 512
blocks we definitely don't want that.  Also, people may want to have a
few GB expansion room in each FS, but not 2TB worth...  Since at 1kB
blocks we get 256MB growth/block, and at 4kB blocks it is 16GB per block,
we probably don't need to reserve more than 4 GDT blocks over what people
already allocate in order to give them the normal expansion needs.  If
they need more expansion at a later date, they can unmount the FS and
do block shuffling offline.

Cheers, Andreas
-- 
Andreas Dilger   University of Calgary  \"If a man ate a pound of pasta and
                 Micronet Research Group \ a pound of antipasto, would they
Dept of Electrical & Computer Engineering \   cancel out, leaving him still
http://www-mddsp.enel.ucalgary.ca/People/adilger/       hungry?" -- Dogbert
