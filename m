Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103122229.f2CMTIX00580@webber.adilger.int>
Subject: Re: [linux-lvm] e2fsck error
In-Reply-To: <F797oDaSeXnbnCndg5o000050a8@hotmail.com> from hail narcissus at
 "Mar 12, 2001 01:02:52 pm"
Date: Mon, 12 Mar 2001 15:29:18 -0700 (MST)
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

You write:
> I am trying to resize my ext2 fs but I get an error from ext2resize:
> 
> ext2resize: ext2_open: filesystem has errors! e2fsck first!
> ext2resize: can't open /dev/junior/site
> 
> At this point I do did a 'umount /dev/junior/site'
> Then I do a 'e2fsck -fyv /dev/junior/site &'

You should probably run "e2fsck -fpv /dev/junior/site", because there
are a few anwers which should be "n" and not "y".  The "-p" option
will pick the right one (-y always answers "y").  It may not make a
difference in this case.  Also, don't run it in the background, in
case it wants to ask some questions.

> It returns this:
> 
> Pass 1: Checking inodes, blocks, and sizes
> Group 3125's block bitmap at 102400000 conflicts with some other fs block.
> Relocate? yes
> 
> Group 3125's inode bitmap at 102400001 conflicts with some other fs block.
> Relocate? yes

Strangely, the bitmaps are in the same location as a superblock and group
descriptor backup (group 3125 = 5^5 is a "sparse" group).

> It finds other errors which I believe it fixes but not the above error.  If 
> I re-run e2fsck then it comes up with the above error again.

Strange.  e2fsck _should_ be able to fix this, but maybe it has never
been tested before.  How did you get into this situation in the first place?
Your previous posting indicated that you weren't running e2fsck on your
filesystem with errors?  What version of ext2resize are you using?  Did
you ever "force" a resize?  In any case, probably a good time to make a
backup.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
