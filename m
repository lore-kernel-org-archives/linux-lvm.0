Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200101260035.f0Q0Zv401823@webber.adilger.net>
Subject: Re: [linux-lvm] Newbie questions
Date: Thu, 25 Jan 2001 17:35:57 -0700 (MST)
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
To: Linux LVM mailing list <linux-lvm@sistina.com>

Mayank writes:
> Read a lil' more and have one more question. From a application point of
> view, would the resize utility (extonline) take care of application flushing
> or not?

I don't understand the question.  What is "application flushing"?  The
ext2online code can resize the filesystem while it is in use and apps
have files open and are writing to them.  That's why it is "online".
It can't shrink a mounted filesystem, but that can be done while the
filesystem is unmounted.

> If it does, how? If not, wouldn't you need to take care of that?

There are two parts to ext2online - the user tool, which does a lot
of the boring work like writing ext2 format information onto the disk,
and the kernel part, which updates the ext2 superblock free block and
free inode counts, and does all the "atomic" things that you can't
safely do from user space.

Cheers, Andreas

PS - resending because my mail was broken, sorry if you get it twice
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
