Message-ID: <004a01bec785$01f0f920$0102010a@adminstation.sgymsdam.nl>
From: "Lennert Buytenhek" <buytenh@dsv.nl>
Subject: Re: [linux-lvm] Re: ext2resize
Date: Tue, 6 Jul 1999 09:56:07 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM on Linux <linux-lvm@msede.com>, Linux FS development list <linux-fsdevel@vger.rutgers.edu>

Andreas Dilger writes:
>>>Have the "reserved" blocks blocks be the first few data blocks in each
>>>group, rather than all in a single group.  This way the blocks can be
>>>used by root when the FS is very full, or they can be used for expanding
>>>the filesystem.  The one problem is that you may not have your extra
>>>blocks when you need them (ie when the FS is full) if it is root that
>>>is filling the FS.  The plus is that you don't keep more spare blocks
>>>that normally nobody uses in the FS.
>
>>How do you tell the kernel that it should use those 'reserved' blocks
>>only when free space is low? compat/rocompat/incompat feature?
>
>Actually, ext2 (like most Unix FS) already reserves space for root (or
>other specified users).  The default is 5% of the FS, but can be set at
>FS creation time or via tune2fs (-m parameter).  If we have mke2fs
>allocate the 5% reserved blocks spread across all groups using the blocks
>right after the current GDT, then we could use these data blocks later
>on instead of moving user blocks out of the way.  However, these blocks
>are not guaranteed to be anywhere in particular (currently they all get
>allocated in one group), so doing "tune2fs -m 0; tune2fs -m 5" will
>probably move all of these blocks around.

ext2 doesn't specify _which_ blocks are reserved. So you can't just
say: "Hey, I want those blocks to be reserved." ext2 keeps track of
the # of free blocks and it detects when it is eating into reserved
space.

>>Why don't we say: "every ext2 fs must have 32 gdt blocks per block group"
>>then? Same idea.
>
>Being able to tune it makes people happy.  If the max is actually 512
>blocks we definitely don't want that.  Also, people may want to have a
>few GB expansion room in each FS, but not 2TB worth...  Since at 1kB
>blocks we get 256MB growth/block, and at 4kB blocks it is 16GB per block,
>we probably don't need to reserve more than 4 GDT blocks over what people
>already allocate in order to give them the normal expansion needs.  If
>they need more expansion at a later date, they can unmount the FS and
>do block shuffling offline.

I just got an email from John Finlay saying he's got a 52GB fs with
6000+ block groups. So the 1024 block group limit is just bogus.
The header in question which #defined the max # of block groups
to be 1024 is wrong, then.

Lennert Buytenhek
