Message-ID: <19990630052507.22408.rocketmail@web602.mail.yahoo.com>
Date: Tue, 29 Jun 1999 22:25:07 -0700 (PDT)
From: =?iso-8859-1?q?Michael=20Field?= <hamster_nz@yahoo.com>
Reply-To: mafield@the.net.nz
Subject: [linux-lvm] A minor fs extend brainwave....
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi again...

I've just realised that the inode table, block bitmaps
and inode bitmaps do not need to follow the
superblock/group descriptors at the start of the
group.

If they are moved to the end of the file system
*BEFORE* the file system is put to use, their is no
big problem with extending the file system later, and
no large scale move of data (or inodes as I was first
thinking) is required, only a maximum of 1 block of
user data per group needs to be relocated (128K / GB),
and the new group descriptors written in it's place.

I've already hacked up a program to move these tables
around (on an empty file system), and the kernel and
fsck like it as long as the inode table is not hard up
against the end of the group (strange - must be an off
by one error somewhere in fsck.ext2).

The short trailing groups at the end of a file system
are not a problem, as by default mkfs.ext2 makes sure
that they have 50 blocks of data in there, enough to
extend a file system 12.5GB (greater than it's size at
creation (can ext2 file systems be that big?). 

This makes things a lot simpler....

Ideas/Comments?

Mike





_________________________________________________________
Do You Yahoo!?
Get your free @yahoo.com address at http://mail.yahoo.com
