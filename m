Message-ID: <010e01bec6c3$06ebed80$0102010a@adminstation.sgymsdam.nl>
From: "Lennert Buytenhek" <buytenh@dsv.nl>
Subject: [linux-lvm] Re: ext2resize
Date: Mon, 5 Jul 1999 10:47:33 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

>Lennert Buytenhek writes:
>> I replied: "Depending on who you talk to of course. :-) The max. number
>> of groups for ext2 is 1024 I believe. One extra gd block per block gives
>> you room for 32*8=256mb expansion (assuming 1kb blocks). This
>> will cost you at most 1 meg of reserved gd blocks. Seems like a fair
>> price. The max. number of gd blocks is 32. So doing this when making
>> an fs will cost you at most 32*1024 blocks, which is 32mb with 1k
>> blocks. On modern drives, you'll probably not even notice a 32mb
>> loss. Unless you have a lot of partitions, of course...."
>Are you sure that the max number of GDT blocks is 32?  For a 1kB block

Yes, for a 1kb block size. One of my ext2 linux kernel headers #defines
the max number of groups to be 1024. Times 32 bytes per group
descriptor is 32kb, which is 32 blocks on 1kb. Unless the header is
wrong, of course.

>size, this would give a limit of 32 GDT blocks * 32 GD/GDT block * 8k
>blocks/GD = 8GB max FS size.  With 4kB blocks we grow 4x for larger data
>blocks, 4x for more GD/GDT block, and 4x for more blocks/GD, so 512 GB
>max, not the expected 4TB limit.  If we wanted to reach 4TB with 1kB
>blocks (possible since block numbers are 32-bit unsigned), then we would
>need 512*32 GDT blocks, or 200% !!!  of all FS space, while with 4kB
>blocks we need 256 GDT blocks, or 1/32 of FS space.

Yes, well, I didn't invent this. Most of the people will use larger block
sizes then, anyway.

>> >Mike had also suggested that when we are doing a major FS (offline)
>> >reorg, we could start removing blocks from the inode table instead of
>> >data blocks as there are usually free inodes in each group, but not
>> >always data blocks...
>> I think it's not worth the complexity. First of all all your inodes will
be
>> renumbered. You'll need a full directory scan-and-replace for inodes
>> which is very crash-sensitive. On the other hand, relocating a block
>> is atomic.
>
>There are two other possibilities:
>1) "#define EXT2_EXPAND_INO 7" and put it in include/linux/ext2_fs.h and
allocate
>   the first few data blocks in each group to this inode to reserve them.

Would be nice. But this way the blocks are really reserved and
can't be used for anything else. Why don't we say: "every ext2
fs must have 32 gdt blocks per block group" then? Same idea.

>2) Have the "reserved" blocks blocks be the first few data blocks in each
group,
>   rather than all in a single group.  This way the blocks can be used by
root when
>   the FS is very full, or they can be used for expanding the filesystem.
The one
>   problem is that you may not have your extra blocks when you need them
(ie when the
>   FS is full) if it is root that is filling the FS.  The plus is that you
don't keep
>   more spare blocks that normally nobody uses in the FS.

How do you tell the kernel that it should use those 'reserved' blocks only
when
free space is low? compat/rocompat/incompat feature?

Lennert Buytenhek
<buytenh@dsv.nl>
