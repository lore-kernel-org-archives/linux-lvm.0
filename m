Message-ID: <37773336.2DFD841C@the.net.nz>
Date: Mon, 28 Jun 1999 20:32:54 +1200
From: Mike Field <mafield@the.net.nz>
MIME-Version: 1.0
Subject: [linux-lvm] Alpha testers rqd for ext2 fs extend utility.
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

I'm a HP-UX user and love LVM. I find the lack of an free extendfs
utility a real hole in LVM on Linux - so I've done something about it!

I've finially hacked togeather to version 0.1.0 of ext2end - my ext2
file system extend utlity. It has two limitations at present:

1. It cannot extend a file further than the limit of the group
descriptor table (in practice over 256M boundary for 1024 byte blocks).
So a 257Mb file system can be extended to a 512 MB file system,  but a
255M Bone can't be extended to 257MB. This will be fixed as soon as I
learn enough about inodes to do some inode relocation, allowing the
group descriptor table to be extended without moving all the data.

2. Because I am using lseek() the maximum file system size that I would
be confident running it on is 2GB (but it might run upto 4GB... maybe).
If anybody knows how to do block oriented file IO under linux can they
drop me a email. Otherwise I'll have to troll the glib sources...

A minor issue is that the number of nodes is fixed to the number of
inodes/per group as  the original file system (to avoid moving data
around): if you need more Inodes you have to extend a lot - maybe upto
8MB to open a new group...

Apart from that it works, but it is early, early alpha.  I'm looking for
some alpha testers to send my source tarballs to.  Please don't sign up
unless you have a tape drive :-)

Also, don't expect too much - command line options (like disabling the
pre/post-extend fscks) and header comments in source files are on the
list for for version 0.1.1, and debuging switches are changed in a
source file (for 0.1.1 also). Hell, it might even allow you to attempt
to extend mounted file systems (can you say 'kernel panic'?). This
project will officially put under the GPL, but at the moment I'ld rather
fix limitations 1&2 that worry about paperwork.

So till version 0.2.0, if you want it, send a mail, I'll send you the
source.

Mike Field

PS. Anybody got any spare web space to host the source????
