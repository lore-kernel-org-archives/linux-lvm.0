Message-Id: <4.2.2.20000311215504.04107840@mail.cgra1.ab.wave.home.com>
Date: Sat, 11 Mar 2000 22:00:06 -0700
From: Ken Miller <klm@shetlandsoftware.com>
Subject: [linux-lvm] Missing header file for ext2resize
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I finally got LVM working last night on my SuSE 6.3 box, and excluding a 
few problems with creating the LV's during system configuration (things 
like make a typo (like 5000g for a LV size :-) ) and have the installation 
barf and restart, at which point no further LVM configuration could be done 
due to some tables being 'out of sync') things wen't pretty well.  Then I 
realized that I had made one of the filesystems too small, so I started on 
the path of resizing the filesystem.

I got the stable version of ext2resize (1.0.6?) to work, but I wanted 
on-the-fly resizing.  So, I downloaded the kernel patches, installed them, 
recompiled the kernel, etc.  The new kernel seems to work ok.  Then I tried 
to build V1.1.13 of ext2resize, and ran into this:

(./configure done here)

new/ext2resize-1.1> make
Making all in doc
make[1]: Entering directory `/home/miller/new/ext2resize-1.1/doc'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/home/miller/new/ext2resize-1.1/doc'
Making all in src
make[1]: Entering directory `/home/miller/new/ext2resize-1.1/src'
gcc -DHAVE_CONFIG_H -I. -I. -I.     -Wall -g -c ext2.c
gcc -DHAVE_CONFIG_H -I. -I. -I.     -Wall -g -c ext2_block_relocator.c
gcc -DHAVE_CONFIG_H -I. -I. -I.     -Wall -g -c ext2_buffer.c
gcc -DHAVE_CONFIG_H -I. -I. -I.     -Wall -g -c ext2_inode_relocator.c
gcc -DHAVE_CONFIG_H -I. -I. -I.     -Wall -g -c ext2_journal.c
ext2_journal.c:52: warning: `create_journal_inode' defined but not used
gcc -DHAVE_CONFIG_H -I. -I. -I.     -Wall -g -c ext2_meta.c
gcc -DHAVE_CONFIG_H -I. -I. -I.     -Wall -g -c ext2_mkfs.c
ext2_mkfs.c:30: uuid/uuid.h: No such file or directory
make[1]: *** [ext2_mkfs.o] Error 1
make[1]: Leaving directory `/home/miller/new/ext2resize-1.1/src'
make: *** [all-recursive] Error 1
	
Where would I find uuid/uuid.h?

Thanks!
