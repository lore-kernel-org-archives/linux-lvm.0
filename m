Message-ID: <00cd01bec78d$629e24c0$0102010a@adminstation.sgymsdam.nl>
From: "Lennert Buytenhek" <buytenh@dsv.nl>
Subject: Re: [linux-lvm] Re: ext2resize
Date: Tue, 6 Jul 1999 10:56:06 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com, linux-fsdevel@vger.rutgers.edu

Stephen Tweedie said:
>Hi,
>
>On Fri, 2 Jul 1999 10:58:27 -0600 (MDT), Andreas Dilger
><adilger@enel.ucalgary.ca> said:
>
>> I agree that reserving GDT blocks would be a small hack for v0 of ext2,
but
>> we could add a "COMPATIBLE" extension to v1 of ext2 that gave the number
of
>> GDT blocks reserved.  Also, since the v1 sparse superblock filesystems
>> leave a gap between the structures, there should not be a real problem.
>> We just have to make sure that we agree (for example) that all the blocks
>> from the start of the group to the block bitmap are reserved for the GDT.
>> This is not a big strech, since this is already how v0 ext2 filesystems
are.
>
>If you're going to be moving user data around anyway (and you have to be
>able to do this for the shrink case anyway), then relocating the
>inode/bitmap blocks is really not that much harder.

There's quite a difference between moving a non-metadata block and
a metadata block. Non-metadata blocks are easily moved; they have
only (max.) 1 reference somewhere. Moving metadata blocks is a bit
harder, especially when the fs is mounted.

Moving the inode/block bitmap blocks is not that difficult when
unmounted, but moving the inode table is tricky to get right (w.r.t
atomicity). One ext2resize user got a segfault while the inode table
was being moved (yes, that bug is fixed now) a while ago and
we're still cleaning up the mess.

Lennert
