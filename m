Date: Fri, 2 Jul 1999 11:39:20 +0200
From: Lennert Buytenhek <buytenh@dsv.nl>
Message-Id: <199907020939.LAA06040@icarus.sgymsdam.nl>
Subject: [linux-lvm] ext2resize
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


Hi all,

Got a new snapshot out (990702) at my homepage. It should
work with sparse superblocks, it _should_ work with >2gig
filesystems now and it fixes a whole lot of bugs.

I have an interesting question some people might want to
think about.

If you make a filesystem with the sparse superblocks feature
turned on, it will be layout as follows:

a sparse block group:
superblock
group descriptors
block bitmap
inode bitmap
inode table

a non-sparse block group:
block bitmap
inode bitmap
empty blocks
inode table

I.e. the inode table will always have the same offset w.r.t
the block group start. So if the superblock/group descs
are absent there will be empty space between the inode
bitmap and the inode table.

A bit strange.

Should ext2resize replicate this behaviour when creating
new groups? It does now, but.... It also means that when
you need to grow the group descriptor area (or shrink
it) you need to move the inode table in all non-sparse
groups as well, although there is no need to.

Anyone has clues on what the "True Behaviour" is?

Lennert Buytenhek
<buytenh@dsv.nl>
