Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102272007.f1RK7aM27545@webber.adilger.net>
Subject: Re: [linux-lvm] Problem mounting ext2 fs on LVM
In-Reply-To: <m27l2ct3p7.fsf@isnogud.escape.de> from Urs Thuermann at "Feb 27,
 2001 06:51:00 pm"
Date: Tue, 27 Feb 2001 13:07:36 -0700 (MST)
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Urs writes:
> Andreas Dilger <adilger@turbolinux.com> writes:
> > What does it say in the syslog?  This will tell you why ext2 thinks it
> > can't mount, and will give us a clue on how to fix LVM.  I'm guessing
> > that when ext2 tries to set the blocksize to 1k it fails.
> 
> Yes, I have a couple of messages in my syslog, like
> 
> Feb 27 17:04:39 isnogud kernel: VFS: Unsupported blocksize on dev lvm(58,0).

This is an ext2 message when sb->s_blocksize != bh->b_size, even though
ext2 _should_ set the block size correctly if we get to this point (it
will call set_blocksize(sb->s_blocksize)).

Now I see what the problem might be, it is in ext2.  Give it a try and
let me know how it goes.

Cheers, Andreas
==========================================================================
--- fs/ext2/super.c.orig	Fri Feb  2 17:12:09 2001
+++ fs/ext2/super.c	Tue Feb 27 12:53:41 2001
@@ -787,7 +791,7 @@
 	
 	sb->s_maxbytes = ext2_max_size(sb->s_blocksize_bits);
 	
-	if (sb->s_blocksize != BLOCK_SIZE &&
+	if (sb->s_blocksize != blocksize &&
 	    (sb->s_blocksize == 1024 || sb->s_blocksize == 2048 ||
 	     sb->s_blocksize == 4096)) {
 		/*
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
