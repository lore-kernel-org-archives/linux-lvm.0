Date: Thu, 8 Jul 1999 18:56:54 -0400
Message-Id: <199907082256.SAA13689@tsx-prime.MIT.EDU>
From: "Theodore Y. Ts'o" <tytso@mit.edu>
In-reply-to: <004a01bec785$01f0f920$0102010a@adminstation.sgymsdam.nl>
	(buytenh@dsv.nl)
Subject: Re: [linux-lvm] Re: ext2resize
References: <004a01bec785$01f0f920$0102010a@adminstation.sgymsdam.nl>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buytenh@dsv.nl
Cc: linux-lvm@msede.com, linux-fsdevel@vger.rutgers.edu

   From: "Lennert Buytenhek" <buytenh@dsv.nl>
   Date:   Tue, 6 Jul 1999 09:56:07 +0200

   I just got an email from John Finlay saying he's got a 52GB fs with
   6000+ block groups. So the 1024 block group limit is just bogus.
   The header in question which #defined the max # of block groups
   to be 1024 is wrong, then.

I'm curious *where* people thought a header defined the max # of block
groups to be 1024?  Yes, that limit is completely bogus.

   From: "Lennert Buytenhek" <buytenh@dsv.nl>
   Date:   Tue, 6 Jul 1999 10:56:06 +0200

   Moving the inode/block bitmap blocks is not that difficult when
   unmounted, but moving the inode table is tricky to get right (w.r.t
   atomicity). One ext2resize user got a segfault while the inode table
   was being moved (yes, that bug is fixed now) a while ago and
   we're still cleaning up the mess.

The trick here is to try *very* hard not to have to do an overlapping
move of the inode table (which you may be forced to do if the filesystem
is too full, but in most cases it can be avoided).  Then do a copy of
that portion of the inode table, and only update the GDT *after* the
inode table has been safely moved.  

You may have to move some extra data blocks belonging to files to do
this, though, so it's much easier to do this safely during an offline
resize. 

						- Ted
